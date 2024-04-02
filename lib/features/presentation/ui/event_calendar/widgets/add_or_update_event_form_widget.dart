import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_color_manager.dart';
import '../../../../../core/theme/button_style_manager.dart';
import '../../../../../core/theme/input_decoration_style_manager.dart';
import 'color_picker_dialog_widget.dart';
import 'date_time_selector_form_field_widget.dart';

class AddOrUpdateEventFormWidget extends StatefulWidget {
  final void Function(CalendarEventData)? onEventAdd;
  final CalendarEventData? event;

  const AddOrUpdateEventFormWidget({
    super.key,
    this.onEventAdd,
    this.event,
  });

  @override
  AddOrUpdateEventFormWidgetState createState() =>
      AddOrUpdateEventFormWidgetState();
}

class AddOrUpdateEventFormWidgetState
    extends State<AddOrUpdateEventFormWidget> {
  late DateTime _startDate = DateTime.now().withoutTime;
  late DateTime _endDate = DateTime.now().withoutTime;

  DateTime? _startTime;
  DateTime? _endTime;

  final ValueNotifier<Color> _color =
      ValueNotifier<Color>(AppColorManager.blue);

  final _form = GlobalKey<FormState>();

  late final _descriptionController = TextEditingController();
  late final _titleController = TextEditingController();
  late final _titleNode = FocusNode();
  late final _descriptionNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _setDefaults();
  }

  @override
  void dispose() {
    _titleNode.dispose();
    _descriptionNode.dispose();

    _descriptionController.dispose();
    _titleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _titleController,
            decoration:
                InputDecorationStyleManager.primary(labelText: 'Event Title'),
            style: const TextStyle(
              color: AppColorManager.black,
              fontSize: 17.0,
            ),
            validator: (value) {
              final title = value?.trim();

              if (title == null || title == "") {
                return "Please enter event title.";
              }

              return null;
            },
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: DateTimeSelectorFormFieldWidget(
                  decoration: InputDecorationStyleManager.primary(
                      labelText: 'Start Date'),
                  initialDateTime: _startDate,
                  onSelect: (date) {
                    if (date.withoutTime.withoutTime
                        .isAfter(_endDate.withoutTime)) {
                      _endDate = date.withoutTime;
                    }

                    _startDate = date.withoutTime;

                    if (mounted) {
                      setState(() {});
                    }
                  },
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Please select start date.";
                    }

                    return null;
                  },
                  textStyle: const TextStyle(
                    color: AppColorManager.black,
                    fontSize: 17.0,
                  ),
                  onSave: (date) => _startDate = date ?? _startDate,
                  type: DateTimeSelectionType.date,
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: DateTimeSelectorFormFieldWidget(
                  initialDateTime: _endDate,
                  decoration: InputDecorationStyleManager.primary(
                      labelText: 'End Date'),
                  onSelect: (date) {
                    if (date.withoutTime.withoutTime
                        .isBefore(_startDate.withoutTime)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text('End date cannot be before start date.'),
                        ),
                      );
                    } else {
                      _endDate = date.withoutTime;
                    }

                    if (mounted) {
                      setState(() {});
                    }
                  },
                  validator: (value) {
                    if (value == null || value == "") {
                      return "Please select end date.";
                    }

                    return null;
                  },
                  textStyle: const TextStyle(
                    color: AppColorManager.black,
                    fontSize: 17.0,
                  ),
                  onSave: (date) => _endDate = date ?? _endDate,
                  type: DateTimeSelectionType.date,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              Expanded(
                child: DateTimeSelectorFormFieldWidget(
                  decoration: InputDecorationStyleManager.primary(
                      labelText: 'Start Time'),
                  initialDateTime: _startTime,
                  minimumDateTime: CalendarConstants.epochDate,
                  onSelect: (date) {
                    if (_endTime != null &&
                        date.getTotalMinutes > _endTime!.getTotalMinutes) {
                      _endTime = date.add(const Duration(minutes: 1));
                    }
                    _startTime = date;

                    if (mounted) {
                      setState(() {});
                    }
                  },
                  onSave: (date) => _startTime = date,
                  textStyle: const TextStyle(
                    color: AppColorManager.black,
                    fontSize: 17.0,
                  ),
                  type: DateTimeSelectionType.time,
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: DateTimeSelectorFormFieldWidget(
                  decoration: InputDecorationStyleManager.primary(
                      labelText: 'End Time'),
                  initialDateTime: _endTime,
                  onSelect: (date) {
                    if (_startTime != null &&
                        date.getTotalMinutes < _startTime!.getTotalMinutes) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('End time cannot be before start time.'),
                      ));
                    } else {
                      _endTime = date;
                    }

                    if (mounted) {
                      setState(() {});
                    }
                  },
                  onSave: (date) => _endTime = date,
                  textStyle: const TextStyle(
                    color: AppColorManager.black,
                    fontSize: 17.0,
                  ),
                  type: DateTimeSelectionType.time,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          TextFormField(
            controller: _descriptionController,
            focusNode: _descriptionNode,
            style: const TextStyle(
              color: AppColorManager.black,
              fontSize: 17.0,
            ),
            keyboardType: TextInputType.multiline,
            textInputAction: TextInputAction.newline,
            selectionControls: MaterialTextSelectionControls(),
            minLines: 1,
            maxLines: 10,
            maxLength: 1000,
            validator: (value) {
              if (value == null || value.trim() == "") {
                return "Please enter event description.";
              }

              return null;
            },
            decoration: InputDecorationStyleManager.primary(
                labelText: 'Event Description'),
          ),
          const SizedBox(height: 15.0),
          Row(
            children: [
              const Text(
                "Event Color: ",
                style: TextStyle(
                  color: AppColorManager.black,
                  fontSize: 17,
                ),
              ),
              GestureDetector(
                onTap: _displayColorPicker,
                child: ValueListenableBuilder(
                  valueListenable: _color,
                  builder: (context, colorValue, _) {
                    return CircleAvatar(
                      radius: 15,
                      backgroundColor: colorValue,
                    );
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: _createEvent,
            style: ButtonStyleManager.primary(),
            child: Text(widget.event == null ? "Add Event" : "Update Event"),
          ),
        ],
      ),
    );
  }

  void _createEvent() {
    if (!(_form.currentState?.validate() ?? true)) return;

    _form.currentState?.save();

    final event = CalendarEventData(
      date: _startDate,
      endTime: _endTime,
      startTime: _startTime,
      endDate: _endDate,
      color: _color.value,
      title: _titleController.text.trim(),
      description: _descriptionController.text.trim(),
    );

    widget.onEventAdd?.call(event);
    _resetForm();
  }

  void _setDefaults() {
    if (widget.event == null) return;

    final event = widget.event!;

    _startDate = event.date;
    _endDate = event.endDate;
    _startTime = event.startTime ?? _startTime;
    _endTime = event.endTime ?? _endTime;
    _titleController.text = event.title;
    _descriptionController.text = event.description ?? '';
  }

  void _resetForm() {
    _form.currentState?.reset();
    _startDate = DateTime.now().withoutTime;
    _endDate = DateTime.now().withoutTime;
    _startTime = null;
    _endTime = null;
    _color.value = AppColorManager.blue;

    if (mounted) {
      setState(() {});
    }
  }

  void _displayColorPicker() {
    showDialog(
        context: context,
        useSafeArea: true,
        builder: (_) => ColorPickerDialogWidget(color: _color));
  }
}
