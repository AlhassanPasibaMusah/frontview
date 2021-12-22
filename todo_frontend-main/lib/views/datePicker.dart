// ignore_for_file: file_names

import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DatePickerDialog(
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2024));
  }
}
