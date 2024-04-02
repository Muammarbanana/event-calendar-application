import 'package:flutter/material.dart';

import '../widgets/week_view_widget.dart';

class WeekViewPage extends StatelessWidget {
  const WeekViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WeekViewWidget(),
    );
  }
}
