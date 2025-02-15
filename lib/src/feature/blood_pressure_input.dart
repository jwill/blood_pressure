import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:signals/signals_flutter.dart';

class BloodPressureInput extends StatefulWidget {
  final date = signal(DateTime.now());
  final systolic = signal('120');
  final diastolic = signal('80');
  final notes = signal('');

  BloodPressureInput({super.key});

  @override
  State<BloodPressureInput> createState() => _BloodPressureInputState();
}

class _BloodPressureInputState extends State<BloodPressureInput> {
  late TextEditingController _systolic_controller;
  late TextEditingController _diatolic_controller;
  late TextEditingController _notes_controller;

  @override
  void initState() {
    super.initState();
    _systolic_controller =
        TextEditingController(text: widget.systolic.value.toString());
    _diatolic_controller =
        TextEditingController(text: widget.diastolic.value.toString());
    _notes_controller = TextEditingController(text: widget.notes.value.toString());
  }

  @override
  void dispose() {
    _systolic_controller.dispose();
    _diatolic_controller.dispose();
    _notes_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Watch((context) {
            var displayDate = widget.date.value;
            final display = DateFormat.yMd().format(displayDate);
            return Text(display);
          }),
          const SizedBox(
            width: 8,
          ),
          OutlinedButton(
              onPressed: () async {
                showDatePicker(
                        context: context,
                        firstDate: DateTime.now().subtract(Duration(days: 365)),
                        lastDate: DateTime.now(),
                        currentDate: DateTime.now())
                    .then((value) => widget.date.value = value!);
              },
              child: const Text("Edit Date"))
        ]),
        const SizedBox(
          height: 8,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Watch((context) {
            var displayTime = widget.date.value;
            final display = DateFormat.Hm().format(displayTime);
            return Text(display);
          }),
          const SizedBox(
            width: 8,
          ),
          OutlinedButton(
              onPressed: () async {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then((value) {
                  widget.date.value = widget.date.value
                      .copyWith(hour: value?.hour, minute: value?.minute);
                });
              },
              child: const Text("Edit Time"))
        ]),
        TextField(
          controller: _systolic_controller,
          onChanged: (value) {
            widget.systolic.value = value;
          },
        ),
        TextField(
          controller: _diatolic_controller,
          onChanged: (value) {
            widget.diastolic.value = value;
          },
        ),
        TextField(
          controller: _notes_controller,
          onChanged: (value) {
            widget.notes.value = value;
          },
        )
      ],
    );
  }
}
