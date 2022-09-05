import 'package:flutter/material.dart';

import 'custom_animated_icons.dart';

class CustomDialog {
  static dialog({
    required BuildContext context,
    required String title,
    bool? iconTitle,
    String? content,
    Widget? widgets,
    Color? primaryColor,
    bool? canGoBack,
    double? radius,
    double? insetPadding,
    double? topToTitleGap,
    double? titleToContentGap,
    double? contentToButtonGap,
    double? buttonToBottomGap,
    TextStyle? titleStyle,
    TextStyle? contentStyle,
    Color? defaultButtonTextColor,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CustomDialogWidget(
          title: title,
          iconTitle: iconTitle,
          content: content,
          widgets: widgets,
          canGoBack: canGoBack,
          radius: radius,
          insetPadding: insetPadding,
          topToTitleGap: topToTitleGap,
          contentToButtonGap: contentToButtonGap,
          buttonToBottomGap: buttonToBottomGap,
          titleStyle: titleStyle,
          contentStyle: contentStyle,
          primaryColor: primaryColor,
          defaultButtonTextColor: defaultButtonTextColor,
        );
      },
    );
  }
}

class CustomDialogWidget extends StatefulWidget {
  final String title;
  final bool? iconTitle;
  final String? content;
  final Color? primaryColor;
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
  final Color? defaultButtonTextColor;

  const CustomDialogWidget(
      {Key? key,
      required this.title,
      this.iconTitle = false,
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
      this.primaryColor,
      this.defaultButtonTextColor})
      : super(key: key);

  @override
  State<CustomDialogWidget> createState() => _CustomDialogWidgetState();
}

class _CustomDialogWidgetState extends State<CustomDialogWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCirc));
    _showCheck();

    super.initState();
  }

  void _showCheck() {
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => widget.canGoBack ?? true,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        insetPadding:
            EdgeInsets.symmetric(horizontal: widget.insetPadding ?? 56),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius ?? 8.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: widget.topToTitleGap ?? 16,
              ),
              widget.iconTitle ?? false
                  ? CustomAnimatedIcons(
                      color: widget.primaryColor ?? Colors.black,
                      progress: _animation,
                      size: 36,
                      iconType: IconType.alert,
                    )
                  : Text(
                      widget.title,
                      style: widget.titleStyle,
                    ),
              SizedBox(
                height: widget.iconTitle ?? false
                    ? widget.titleToContentGap ?? 16
                    : widget.titleToContentGap ?? 32,
              ),
              widget.content == null
                  ? Container()
                  : Text(
                      widget.content!,
                      textAlign: TextAlign.center,
                      style: widget.contentStyle,
                    ),
              SizedBox(
                height: widget.iconTitle ?? false
                    ? widget.contentToButtonGap ?? 24
                    : widget.contentToButtonGap ?? 40,
              ),
              widget.widgets ??
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: widget.primaryColor ?? Colors.black,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0)),
                      ),
                      height: 40,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "OK",
                          style: TextStyle(
                              color: widget.defaultButtonTextColor ??
                                  Colors.white),
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
