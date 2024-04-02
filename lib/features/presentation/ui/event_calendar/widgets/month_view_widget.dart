import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class MonthViewWidget extends StatelessWidget {
  const MonthViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MonthView(
      onEventTap: (event, date) {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (_) => DetailsPage(
        //       event: event,
        //     ),
        //   ),
        // );
      },
    );
  }
}
