import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class WeekViewPage extends StatelessWidget {
  const WeekViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WeekView(),
    );
  }
}
