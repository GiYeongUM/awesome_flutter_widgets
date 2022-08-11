import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String? title;
  final String? content;
  final Widget? widgets;
  final bool? canGoBack;
  final double? radius;
  final double? insetPadding;
  final double? titleGap;
  final double? buttonGap;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;

  const CustomDialog(
      {Key? key,
      this.title,
      this.content,
      this.widgets = const Text(""),
      this.canGoBack = true,
      this.insetPadding,
      this.titleStyle,
      this.radius,
      this.contentStyle, this.buttonGap, this.titleGap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => canGoBack ?? true,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        insetPadding: EdgeInsets.symmetric(horizontal: insetPadding ?? 30),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius ?? 8.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title!,
                style: titleStyle,
              ),
              SizedBox(
                height: titleGap ?? 32,
              ),
              content == null
                  ? Container()
                  : Text(
                      content!,
                      textAlign: TextAlign.center,
                      style: contentStyle,
                    ),
              SizedBox(
                height: buttonGap ?? 32,
              ),
              widgets!,
            ],
          ),
        ),
      ),
    );
  }
}
