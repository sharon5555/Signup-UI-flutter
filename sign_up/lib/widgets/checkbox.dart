import 'package:flutter/material.dart';
import '../theme.dart';

class CheckBox extends StatefulWidget {
  final String text;
  final bool value; // Accept an initial value
  final ValueChanged<bool> onChanged; // Callback for when the state changes

  const CheckBox(this.text, {super.key, required this.value, required this.onChanged});

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    // Initialize with the passed value
    _isSelected = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _isSelected = !_isSelected;
                });

                // Notify the parent widget of the state change
                widget.onChanged(_isSelected);
              },
              child: Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: nDarkGreyColor),
                ),
                child: _isSelected
                    ? const Icon(
                        Icons.check,
                        size: 17,
                        color: Colors.green,
                      )
                    : null,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(widget.text),
          ],
        )
      ],
    );
  }
}
