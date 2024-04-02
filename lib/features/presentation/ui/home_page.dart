import '../../../core/theme/app_color_manager.dart';
import '../../../core/theme/button_style_manager.dart';
import 'event_calendar/pages/day_view_page.dart';
import 'event_calendar/pages/month_view_page.dart';
import 'event_calendar/pages/week_view_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Event Calendar Application",
            style: TextStyle(
              color: AppColorManager.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: AppColorManager.blue),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => const MonthViewPage(),
                    ),
                  );
                },
                style: ButtonStyleManager.primary(),
                child: const Text("Month View"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => const DayViewPage(),
                    ),
                  );
                },
                style: ButtonStyleManager.primary(),
                child: const Text("Day View"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => const WeekViewPage(),
                    ),
                  );
                },
                style: ButtonStyleManager.primary(),
                child: const Text("Week View"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
