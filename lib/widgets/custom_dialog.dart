import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String? content;
  final Widget? widgets;
  final bool? canGoBack;
  final double? radius;
  final double? insetPadding;
  final double? topToTitleGap;
  final double? titleToContentGap;
  final double? contentToButtonGap;
  final double? buttonToBottomGap;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;
  final Color? defaultButtonBackColor;
  final Color? defaultButtonTextColor;

  const CustomDialog(
      {Key? key,
      required this.title,
      this.content,
      this.widgets,
      this.canGoBack = true,
      this.insetPadding,
      this.titleStyle,
      this.radius,
      this.contentStyle,
      this.contentToButtonGap,
      this.titleToContentGap,
      this.topToTitleGap,
      this.buttonToBottomGap,
      this.defaultButtonBackColor,
      this.defaultButtonTextColor})
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
              SizedBox(
                height: topToTitleGap ?? 24,
              ),
              Text(
                title,
                style: titleStyle,
              ),
              SizedBox(
                height: titleToContentGap ?? 32,
              ),
              content == null
                  ? Container()
                  : Text(
                      content!,
                      textAlign: TextAlign.center,
                      style: contentStyle,
                    ),
              SizedBox(
                height: contentToButtonGap ?? 40,
              ),
              widgets ??
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: defaultButtonBackColor ?? Colors.black,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0)),
                      ),
                      height: 40,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "확인",
                          style: TextStyle(
                              color: defaultButtonTextColor ?? Colors.white),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
