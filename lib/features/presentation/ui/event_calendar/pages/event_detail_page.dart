import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/extension.dart';
import '../../../../../core/theme/app_color_manager.dart';
import '../../../../../core/theme/button_style_manager.dart';
import 'create_or_update_event_page.dart';

class EventDetailPage extends StatelessWidget {
  final CalendarEventData event;

  const EventDetailPage({super.key, required this.event});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: AppColorManager.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColorManager.white,
          ),
        ),
        title: Text(
          event.title,
          style: const TextStyle(
            color: AppColorManager.white,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Text(
            "Date: ${event.date.dateToStringWithFormat(format: "dd/MM/yyyy")}",
          ),
          const SizedBox(height: 15.0),
          if (event.startTime != null && event.endTime != null) ...[
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("From"),
                      Text(
                        event.startTime
                                ?.getTimeInFormat(TimeStampFormat.parse_12) ??
                            "",
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("To"),
                      Text(
                        event.endTime
                                ?.getTimeInFormat(TimeStampFormat.parse_12) ??
                            "",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
          ],
          if (event.description?.isNotEmpty ?? false) ...[
            const Divider(),
            const Text("Description"),
            const SizedBox(
              height: 10.0,
            ),
            Text(event.description!),
          ],
          const SizedBox(height: 50),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    CalendarControllerProvider.of(context)
                        .controller
                        .remove(event);
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyleManager.primary(),
                  child: const Text('Delete Event'),
                ),
              ),
              const SizedBox(width: 30),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context)
                        .push(
                      MaterialPageRoute(
                        builder: (_) => CreateOrUpdateEventPage(
                          event: event,
                        ),
                      ),
                    )
                        .then(
                      (result) {
                        Navigator.pop(context);
                      },
                    );
                  },
                  style: ButtonStyleManager.primary(),
                  child: const Text('Edit Event'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
