import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_color_manager.dart';
import '../widgets/add_or_update_event_form_widget.dart';

class CreateOrUpdateEventPage extends StatelessWidget {
  const CreateOrUpdateEventPage({super.key, this.event});

  final CalendarEventData? event;

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
          event == null ? "Create New Event" : "Update Event",
          style: const TextStyle(
            color: AppColorManager.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: AddOrUpdateEventFormWidget(
            onEventAdd: (newEvent) {
              if (event != null) {
                CalendarControllerProvider.of(context)
                    .controller
                    .update(event!, newEvent);
              } else {
                CalendarControllerProvider.of(context).controller.add(newEvent);
              }

              Navigator.pop(context);
            },
            event: event,
          ),
        ),
      ),
    );
  }
}
