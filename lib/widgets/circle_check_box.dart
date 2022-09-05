import 'package:flutter/material.dart';

class CircleCheckBox extends StatefulWidget {
  final ValueChanged<bool> onChanged;
  final bool isSelected;
  final bool enable;
  final Color changeColor;
  final Color selectColor;

  const CircleCheckBox(
      {Key? key,
      required this.onChanged,
      this.isSelected = false,
      this.enable = true,
      this.changeColor = Colors.black,
      this.selectColor = Colors.blue})
      : super(key: key);

  @override
  State<CircleCheckBox> createState() => _CircleCheckBoxState();
}

class _CircleCheckBoxState extends State<CircleCheckBox> {
  bool localSelected = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    localSelected = widget.isSelected;
    return IgnorePointer(
      ignoring: !widget.enable,
      child: ClipRRect(
        clipBehavior: Clip.hardEdge,
        borderRadius: const BorderRadius.all(Radius.circular(Checkbox.width)),
        child: SizedBox(
          width: Checkbox.width,
          height: Checkbox.width,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: widget.isSelected ? Colors.black : widget.changeColor,
              ),
              borderRadius: BorderRadius.circular(Checkbox.width),
            ),
            child: Theme(
              data: ThemeData(
                unselectedWidgetColor: Colors.transparent,
              ),
              child: Checkbox(
                activeColor: widget.selectColor,
                value: localSelected,
                onChanged: (value) {
                  setState(() {
                    widget.onChanged(value ?? false);
                    localSelected = value ?? false;
                  });
                },
                // activeColor: Colors.transparent,
                // checkColor: CommonColors.checkBoxColor,
                materialTapTargetSize: MaterialTapTargetSize.padded,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
