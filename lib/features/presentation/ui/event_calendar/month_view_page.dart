import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class MonthViewPage extends StatelessWidget {
  const MonthViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MonthView(),
    );
  }
}
