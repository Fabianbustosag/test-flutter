import 'package:flutter/material.dart';

class DatePickerWidget extends StatelessWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final ValueChanged<DateTime>? onDateSelected;

  const DatePickerWidget({
    Key? key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
    this.onDateSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _selectDate(context),
      child: Text('Seleccionar fecha'),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    if (picked != null && onDateSelected != null) {
      onDateSelected!(picked);
    }
  }
}
