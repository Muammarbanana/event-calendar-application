import 'package:calendar_view/calendar_view.dart';
import 'package:event_calendar_application/core/theme/app_color_manager.dart';
import 'package:flutter/material.dart';

class DayViewWidget extends StatelessWidget {
  const DayViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DayView(
      startDuration: const Duration(hours: 8),
      showHalfHours: true,
      heightPerMinute: 3,
      timeLineBuilder: _timeLineBuilder,
      hourIndicatorSettings: HourIndicatorSettings(
        color: Theme.of(context).dividerColor,
      ),
      onEventTap: (events, date) {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (_) => DetailsPage(
        //       event: events.first,
        //     ),
        //   ),
        // );
      },
      halfHourIndicatorSettings: HourIndicatorSettings(
        color: Theme.of(context).dividerColor,
        lineStyle: LineStyle.dashed,
      ),
      verticalLineOffset: 0,
      timeLineWidth: 65,
      showLiveTimeLineInAllDays: true,
      liveTimeIndicatorSettings: const LiveTimeIndicatorSettings(
        color: AppColorManager.red,
        showBullet: false,
        showTime: true,
        showTimeBackgroundView: true,
      ),
    );
  }

  Widget _timeLineBuilder(DateTime date) {
    if (date.minute != 0) {
      return Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            top: -8,
            right: 8,
            child: Text(
              "${date.hour}:${date.minute}",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.black.withAlpha(50),
                fontStyle: FontStyle.italic,
                fontSize: 12,
              ),
            ),
          ),
        ],
      );
    }

    final hour = ((date.hour - 1) % 12) + 1;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          top: -8,
          right: 8,
          child: Text(
            "$hour ${date.hour ~/ 12 == 0 ? "am" : "pm"}",
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
