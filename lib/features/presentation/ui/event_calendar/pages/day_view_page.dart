import 'package:flutter/material.dart';

import '../widgets/day_view_widget.dart';

class DayViewPage extends StatelessWidget {
  const DayViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DayViewWidget(),
    );
  }
}
