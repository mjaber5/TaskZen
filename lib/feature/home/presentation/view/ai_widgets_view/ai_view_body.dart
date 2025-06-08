import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:task_zen/core/services/ai_services.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/core/utils/constants/sizes.dart';
import 'package:toasty_box/toast_enums.dart';
import 'package:toasty_box/toast_service.dart';

class AiViewBody extends StatefulWidget {
  const AiViewBody({super.key});

  @override
  State<AiViewBody> createState() => _AiViewBodyState();
}

class _AiViewBodyState extends State<AiViewBody>
    with SingleTickerProviderStateMixin {
  final TextEditingController _taskController = TextEditingController();
  final AIService _aiService = AIService();
  final SpeechToText _speechToText = SpeechToText();
  List<String> _subtasks = [];
  bool _isLoading = false;
  bool _isListening = false;
  bool _speechEnabled = false;
  late AnimationController _micAnimationController;
  late Animation<double> _micScaleAnimation;

  @override
  void initState() {
    super.initState();
    _initSpeech();
    _micAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _micScaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _micAnimationController, curve: Curves.easeInOut),
    );
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    if (!_speechEnabled) {
      ToastService.showWarningToast(
        context,
        length: ToastLength.medium,
        message: 'Speech recognition not available',
      );
      return;
    }

    setState(() {
      _isListening = true;
      _micAnimationController.repeat(reverse: true);
    });

    await _speechToText.listen(
      onResult: (result) {
        setState(() {
          _taskController.text = result.recognizedWords;
        });
      },
    );
  }

  void _stopListening() async {
    setState(() {
      _isListening = false;
      _micAnimationController.stop();
      _micAnimationController.reset();
    });
    await _speechToText.stop();
  }

  void _fetchSubtasks() async {
    if (_taskController.text.trim().isEmpty) {
      ToastService.showWarningToast(
        context,
        length: ToastLength.medium,
        message: 'Please enter a task',
      );
      return;
    }

    setState(() {
      _isLoading = true;
      _subtasks = [];
    });

    try {
      final subtasks = await _aiService.getSubtasks(_taskController.text);
      setState(() {
        _subtasks = subtasks;
        _isLoading = false;
      });
      if (_subtasks.isNotEmpty && !_subtasks[0].startsWith('Error')) {
        ToastService.showSuccessToast(
          context,
          length: ToastLength.medium,
          message: 'Subtasks generated!',
        );
      } else {
        ToastService.showErrorToast(
          context,
          length: ToastLength.medium,
          message: _subtasks[0],
        );
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
        _subtasks = ['Error: Could not fetch subtasks'];
      });
      ToastService.showErrorToast(
        context,
        length: ToastLength.medium,
        message: 'Failed to fetch subtasks: $e',
      );
    }
  }

  void _clearInput() {
    setState(() {
      _taskController.clear();
      _subtasks = [];
    });
  }

  @override
  void dispose() {
    _taskController.dispose();
    _micAnimationController.dispose();
    _speechToText.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ZSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What do you want to accomplish?',
                style: TextStyle(
                  color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
                ),
              ),
              const SizedBox(height: ZSizes.md),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _taskController,
                      decoration: InputDecoration(
                        hintText: 'e.g., Plan a team meeting',
                        filled: true,
                        fillColor:
                            isDark
                                ? ZColors.greyDark.withOpacity(0.2)
                                : ZColors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(ZSizes.sm),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon:
                            _taskController.text.isNotEmpty
                                ? IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color:
                                        isDark
                                            ? ZColors.textOnPrimary
                                            : ZColors.textPrimary,
                                  ),
                                  onPressed: _clearInput,
                                )
                                : null,
                      ),
                      style: TextStyle(
                        color:
                            isDark
                                ? ZColors.textOnPrimary
                                : ZColors.textPrimary,
                      ),
                      onSubmitted: (_) => _fetchSubtasks(),
                    ),
                  ),
                  const SizedBox(width: ZSizes.sm),
                  GestureDetector(
                    onTap: _isListening ? _stopListening : _startListening,
                    child: AnimatedBuilder(
                      animation: _micAnimationController,
                      builder:
                          (context, child) => Transform.scale(
                            scale: _micScaleAnimation.value,
                            child: Lottie.asset(
                              'assets/lottie/mic.json',
                              width: 80,
                              height: 80,
                            ),
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: ZSizes.lg),
              Text(
                'AI Suggestions',
                style: TextStyle(
                  color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
                ),
              ),
              const SizedBox(height: ZSizes.sm),
              _isLoading
                  ? const Center(
                    child: CircularProgressIndicator(color: ZColors.secondary),
                  )
                  : _subtasks.isEmpty
                  ? Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: ZSizes.lg),
                      child: Text(
                        'No subtasks generated yet.',
                        style: TextStyle(
                          color:
                              isDark
                                  ? ZColors.textOnPrimary
                                  : ZColors.textSecondary,
                        ),
                      ),
                    ),
                  )
                  : ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _subtasks.length,
                    separatorBuilder:
                        (context, index) => const SizedBox(height: ZSizes.sm),
                    itemBuilder:
                        (context, index) => Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(ZSizes.sm),
                          ),
                          elevation: 2,
                          color:
                              isDark
                                  ? ZColors.greyDark.withOpacity(0.4)
                                  : ZColors.white,
                          child: ListTile(
                            leading: Icon(
                              Icons.check_circle_outline,
                              color: ZColors.secondary,
                            ),
                            title: Text(
                              _subtasks[index],
                              style: TextStyle(
                                color:
                                    isDark
                                        ? ZColors.textOnPrimary
                                        : ZColors.textPrimary,
                              ),
                            ),
                          ),
                        ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
