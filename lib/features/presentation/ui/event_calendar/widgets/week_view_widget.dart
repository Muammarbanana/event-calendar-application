import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_color_manager.dart';
import '../pages/event_detail_page.dart';

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
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => EventDetailPage(event: events.first),
          ),
        );
      },
    );
  }
}
