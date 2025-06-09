import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:task_zen/core/utils/constants/colors.dart';
import 'package:task_zen/feature/home/presentation/view/focus_timer_widget/animated_circual_timer.dart';
import 'package:task_zen/feature/home/presentation/view/focus_timer_widget/animated_motivational_quote.dart';

class FocusTimerViewBody extends StatefulWidget {
  const FocusTimerViewBody({super.key});

  @override
  State<FocusTimerViewBody> createState() => _FocusTimerViewBodyState();
}

class _FocusTimerViewBodyState extends State<FocusTimerViewBody>
    with TickerProviderStateMixin {
  // Changed to TickerProviderStateMixin
  int seconds = 1500; // Default: Focus 25 mins
  bool isRunning = false;
  late TabController _tabController;
  late AnimationController _animationController;
  late Animation<double> _pulseAnimation;
  Timer? _timer;

  final Map<String, int> sessions = {
    'Focus': 1500,
    'Short Break': 300,
    'Long Break': 900,
  };

  final Map<String, String> motivationalQuotes = {
    'Focus': 'Concentrate all your thoughts upon the work at hand. 🌟',
    'Short Break': 'Take a moment to recharge and shine brighter. ☕',
    'Long Break': 'Relax and refresh for your next big win! 🌴',
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: sessions.length, vsync: this);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          isRunning = false;
          _timer?.cancel();
          seconds = sessions.values.toList()[_tabController.index];
          _animationController.stop();
          _animationController.reset();
        });
      }
    });
  }

  void _toggleTimer() {
    Vibrate.feedback(FeedbackType.light);
    setState(() {
      isRunning = !isRunning;
      if (isRunning) {
        _animationController.repeat(reverse: true);
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          setState(() {
            if (seconds > 0) {
              seconds--;
            } else {
              isRunning = false;
              timer.cancel();
              _animationController.stop();
              Vibrate.feedback(FeedbackType.success);
            }
          });
        });
      } else {
        _animationController.stop();
        _timer?.cancel();
      }
    });
  }

  void _resetTimer() {
    Vibrate.feedback(FeedbackType.medium);
    setState(() {
      isRunning = false;
      _timer?.cancel();
      seconds = sessions.values.toList()[_tabController.index];
      _animationController.stop();
      _animationController.reset();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _tabController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final minutesStr = (seconds ~/ 60).toString().padLeft(2, '0');
    final secondsStr = (seconds % 60).toString().padLeft(2, '0');
    final currentSession = sessions.keys.toList()[_tabController.index];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            // Title
            Text(
              'Focus Mode',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 20),
            // Session Selector
            Container(
              decoration: BoxDecoration(
                color:
                    isDark ? ZColors.greyDark.withOpacity(0.3) : ZColors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: TabBar(
                dragStartBehavior: DragStartBehavior.start,
                isScrollable: true,
                controller: _tabController,

                labelColor:
                    isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
                unselectedLabelColor: ZColors.greyMedium,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                tabs:
                    sessions.keys
                        .map(
                          (name) => Tab(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  name == 'Focus'
                                      ? Icons.timer
                                      : name == 'Short Break'
                                      ? Icons.free_breakfast
                                      : Icons.beach_access,
                                  size: 20,
                                ),
                                const SizedBox(width: 4),
                                Text(name),
                              ],
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
            const SizedBox(height: 40),
            // Circul,ar Timer
            AnimatedCircualTimer(
              pulseAnimation: _pulseAnimation,
              isRunning: isRunning,
              seconds: seconds,
              sessions: sessions,
              tabController: _tabController,
              isDark: isDark,
              minutesStr: minutesStr,
              secondsStr: secondsStr,
            ),
            const SizedBox(height: 40),
            // Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(
                  onPressed: _toggleTimer,
                  icon: isRunning ? Icons.pause : Icons.play_arrow,
                  label: isRunning ? 'Pause' : 'Start',
                  backgroundColor: ZColors.buttonPrimary,
                  textColor: ZColors.backgroundLight,
                  isDark: isDark,
                  tooltip: isRunning ? 'Pause the timer' : 'Start the timer',
                ),
                const SizedBox(width: 16),
                _buildButton(
                  onPressed: _resetTimer,
                  icon: Icons.refresh,
                  label: 'Reset',
                  backgroundColor: isDark ? ZColors.greyDark : ZColors.white,
                  textColor: isDark ? ZColors.white : ZColors.primary,
                  isDark: isDark,
                  tooltip: 'Reset the timer',
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Motivational Quote,
            AnimatedMotivationalQuote(
              motivationalQuotes: motivationalQuotes,
              currentSession: currentSession,
              isDark: isDark,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required VoidCallback onPressed,
    required IconData icon,
    required String label,
    required Color backgroundColor,
    required Color textColor,
    required bool isDark,
    required String tooltip,
  }) {
    return Tooltip(
      message: tooltip,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: textColor, size: 24),
        label: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 2,
          shadowColor: Colors.black.withOpacity(0.2),
        ),
      ),
    );
  }
}
