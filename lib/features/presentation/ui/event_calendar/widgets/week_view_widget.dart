import 'package:calendar_view/calendar_view.dart';
import 'package:event_calendar_application/core/theme/app_color_manager.dart';
import 'package:flutter/material.dart';

class WeekViewWidget extends StatelessWidget {
  const WeekViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WeekView(
      showLiveTimeLineInAllDays: true,
      timeLineWidth: 65,
      liveTimeIndicatorSettings: const LiveTimeIndicatorSettings(
        color: AppColorManager.red,
        showTime: true,
      ),
      onEventTap: (events, date) {
        // Navigator.of(context).push(
        //   MaterialPageRoute(builder: (builder) {}),
        // );
      },
    );
  }
}
