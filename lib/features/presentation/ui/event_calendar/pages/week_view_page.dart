import 'package:flutter/material.dart';

import '../../../../../core/theme/app_color_manager.dart';
import '../widgets/week_view_widget.dart';
import 'create_or_update_event_page.dart';

class WeekViewPage extends StatelessWidget {
  const WeekViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const WeekViewWidget(),
      floatingActionButton: FloatingActionButton(
        elevation: 6,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateOrUpdateEventPage(),
            ),
          );
        },
        backgroundColor: AppColorManager.blue,
        child: const Icon(
          Icons.add,
          color: AppColorManager.white,
        ),
      ),
    );
  }
}
