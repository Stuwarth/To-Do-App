import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/ui/theme.dart';

class SpanishDatePicker extends StatefulWidget {
  const SpanishDatePicker({
    super.key,
    required this.initialDate,
    required this.onDateChange,
    this.width = 80,
    this.height = 100,
    this.daysToShow = 30,
    this.selectedDate,
  });

  final DateTime initialDate;
  final DateTime? selectedDate;
  final double width;
  final double height;
  final int daysToShow;
  final void Function(DateTime) onDateChange;

  @override
  State<SpanishDatePicker> createState() => _SpanishDatePickerState();
}

class _SpanishDatePickerState extends State<SpanishDatePicker> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate ?? widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.daysToShow,
        itemBuilder: (context, index) {
          final date = widget.initialDate.add(Duration(days: index));
          final isSelected = DateUtils.isSameDay(date, _selectedDate);

          final month = DateFormat.MMM('es').format(date).toUpperCase();
          final dayNum = DateFormat.d('es').format(date);
          final weekday = DateFormat.E('es').format(date).toUpperCase();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
            child: GestureDetector(
              onTap: () {
                setState(() => _selectedDate = date);
                widget.onDateChange(date);
              },
              child: Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  color: isSelected ? primaryClr : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      month,
                      style: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      dayNum,
                      style: TextStyle(
                          color: isSelected ? Colors.white : Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      weekday,
                      style: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
