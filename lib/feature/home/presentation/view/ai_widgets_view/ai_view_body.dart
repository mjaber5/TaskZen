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
    final Color backgroundColor =
        isDark ? ZColors.backgroundDark : ZColors.white;

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(ZSizes.md),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'What do you want to accomplish?',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
                ),
              ),
              const SizedBox(height: ZSizes.lg),
              inputTaskSection(isDark, context),
              const SizedBox(height: ZSizes.xl),
              Text(
                'AI Suggestions',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
                ),
              ),
              const SizedBox(height: ZSizes.md),
              if (_isLoading)
                Center(
                  child: Lottie.asset(
                    'assets/lottie/ai.json',
                    width: 120,
                    height: 120,
                  ),
                )
              else if (_subtasks.isEmpty)
                NoSubTasks(isDark: isDark)
              else
                SubTasksView(subtasks: _subtasks),
            ],
          ),
        ),
      ),
    );
  }

  Row inputTaskSection(bool isDark, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: TextField(
            controller: _taskController,
            decoration: InputDecoration(
              hintText: 'e.g., Plan a team meeting',
              prefixIcon: Icon(
                Icons.task_alt_outlined,
                color: ZColors.secondary,
              ),
              suffixIcon:
                  _taskController.text.isNotEmpty
                      ? IconButton(
                        icon: Icon(Icons.clear, color: ZColors.secondary),
                        onPressed: _clearInput,
                      )
                      : null,
              filled: true,
              fillColor:
                  isDark ? ZColors.greyDark.withOpacity(0.2) : ZColors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
            ),
            style: Theme.of(context).textTheme.bodyLarge,
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
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: ZColors.secondary,
                    child: Lottie.asset(
                      'assets/lottie/mic.json',
                      width: 40,
                      height: 40,
                    ),
                  ),
                ),
          ),
        ),
      ],
    );
  }
}

class NoSubTasks extends StatelessWidget {
  const NoSubTasks({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: ZSizes.lg),
        child: Text(
          'No subtasks generated yet.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color:
                isDark
                    ? ZColors.textOnPrimary.withOpacity(0.6)
                    : ZColors.textSecondary,
          ),
        ),
      ),
    );
  }
}

class SubTasksView extends StatelessWidget {
  const SubTasksView({super.key, required List<String> subtasks})
    : _subtasks = subtasks;

  final List<String> _subtasks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _subtasks.length,
      itemBuilder: (context, index) {
        final subtask = _subtasks[index].replaceAll('*', '').trim();
        return Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ListTile(
            leading: Icon(Icons.check_circle, color: ZColors.secondary),
            title: Text(subtask, style: Theme.of(context).textTheme.bodyLarge),
          ),
        );
      },
    );
  }
}
