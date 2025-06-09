import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:task_zen/core/utils/constants/colors.dart';

class AnimatedCircualTimer extends StatelessWidget {
  const AnimatedCircualTimer({
    super.key,
    required Animation<double> pulseAnimation,
    required this.isRunning,
    required this.seconds,
    required this.sessions,
    required TabController tabController,
    required this.isDark,
    required this.minutesStr,
    required this.secondsStr,
  }) : _pulseAnimation = pulseAnimation,
       _tabController = tabController;

  final Animation<double> _pulseAnimation;
  final bool isRunning;
  final int seconds;
  final Map<String, int> sessions;
  final TabController _tabController;
  final bool isDark;
  final String minutesStr;
  final String secondsStr;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder:
          (context, child) => Transform.scale(
            scale: isRunning ? _pulseAnimation.value : 1.0,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: ZColors.primary.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: CircularPercentIndicator(
                radius: 140.0,
                lineWidth: 18.0,
                percent:
                    seconds / sessions.values.toList()[_tabController.index],
                circularStrokeCap: CircularStrokeCap.round,
                backgroundColor: isDark ? ZColors.greyDark : ZColors.greyLight,
                progressColor: ZColors.primary,
                center: Text(
                  '$minutesStr:$secondsStr',
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: isDark ? ZColors.textOnPrimary : ZColors.textPrimary,
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ),
            ),
          ),
    );
  }
}
