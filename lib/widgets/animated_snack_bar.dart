import 'package:flutter/material.dart';
import 'package:icon_animated/animated_icons.dart';

enum SnackBarType {
  saveFirstAnimation,
  saveSecondAnimation,
  failFirstAnimation,
  failSecondAnimation,
  alertFirstAnimation,
  alertSecondAnimation,
}

class AnimatedSnackBar {
  static style1({
    required BuildContext context,
    String? label,
    Color? primaryColor,
    required SnackBarType snackBarType,
    String? subTitle,
    String? actionLabel,
    TextStyle? titleTextStyle,
    TextStyle? subtitleTextStyle,
    TextStyle? actionLabelTextStyle,
    Function? onActionTap,
    IconData? iconData,
    double? height,
    double? iconAvatarRadius,
    Color? iconColor,
    Duration? duration,
    DismissDirection? direction,
    bool? hasLabel,
  }) {
    switch (snackBarType) {
      case SnackBarType.saveFirstAnimation:
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: duration ?? const Duration(seconds: 3),
          dismissDirection: direction ?? DismissDirection.down,
          behavior: SnackBarBehavior.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: SaveSnackBarFirstWidget(
            onPressed: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
            },
            label: label ?? "",
            primaryColor: primaryColor ?? Colors.green,
            titleTextStyle: titleTextStyle,
          ),
        ));
      case SnackBarType.saveSecondAnimation:
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: duration ?? const Duration(seconds: 3),
          dismissDirection: direction ?? DismissDirection.down,
          behavior: SnackBarBehavior.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: SaveSnackBarSecondWidget(
            onPressed: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
            },
            label: label ?? "",
            primaryColor: primaryColor ?? Colors.green,
            titleTextStyle: titleTextStyle,
          ),
        ));
      case SnackBarType.failFirstAnimation:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: duration ?? const Duration(seconds: 3),
          dismissDirection: direction ?? DismissDirection.down,
          behavior: SnackBarBehavior.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: FailSnackBarFirstWidget(
            onPressed: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
            },
            label: label ?? "",
            primaryColor: primaryColor ?? Colors.red,
            titleTextStyle: titleTextStyle,
          ),
        ));
        break;
      case SnackBarType.failSecondAnimation:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: duration ?? const Duration(seconds: 3),
          dismissDirection: direction ?? DismissDirection.down,
          behavior: SnackBarBehavior.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: FailSnackBarSecondWidget(
            onPressed: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
            },
            label: label ?? "",
            primaryColor: primaryColor ?? Colors.red,
            titleTextStyle: titleTextStyle,
          ),
        ));
        break;
      case SnackBarType.alertFirstAnimation:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: duration ?? const Duration(seconds: 3),
          dismissDirection: direction ?? DismissDirection.down,
          behavior: SnackBarBehavior.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: AlertSnackBarFirstWidget(
            onPressed: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
            },
            label: label ?? "",
            primaryColor: primaryColor ?? Colors.black,
            titleTextStyle: titleTextStyle,
          ),
        ));
        break;
      case SnackBarType.alertSecondAnimation:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: duration ?? const Duration(seconds: 3),
          dismissDirection: direction ?? DismissDirection.down,
          behavior: SnackBarBehavior.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: AlertSnackBarSecondWidget(
            onPressed: () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
            },
            label: label ?? "",
            primaryColor: primaryColor ?? Colors.black,
            titleTextStyle: titleTextStyle,
          ),
        ));
        break;
    }
  }
}

class SaveSnackBarFirstWidget extends StatefulWidget implements SnackBarAction {
  const SaveSnackBarFirstWidget({
    Key? key,
    this.textColor,
    this.disabledTextColor,
    required this.label,
    required this.onPressed,
    this.primaryColor = Colors.green,
    this.titleTextStyle,
  }) : super(key: key);

  @override
  final Color? textColor;

  @override
  final Color? disabledTextColor;

  @override
  final String label;

  @override
  final VoidCallback onPressed;

  final Color primaryColor;
  final TextStyle? titleTextStyle;

  @override
  State<SaveSnackBarFirstWidget> createState() =>
      _SaveSnackBarFirstWidgetState();
}

class _SaveSnackBarFirstWidgetState extends State<SaveSnackBarFirstWidget>
    with SingleTickerProviderStateMixin {
  var changeAnimationStart = false;
  var fadeAnimationStart = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCirc));
    _handleAnimation();
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose(); // you need this
    super.dispose();
  }

  void _handleAnimation() {
    _showAnimation();
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        changeAnimationStart = true;
      });
      Future.delayed(const Duration(milliseconds: 50), () {
        setState(() {
          fadeAnimationStart = true;
        });
      });
    });
  }

  void _showAnimation() {
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(15),
        child: AnimatedContainer(
          color: changeAnimationStart
              ? widget.primaryColor
              : Colors.white.withOpacity(0),
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 200),
          height: 50,
          child: !changeAnimationStart
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    height: 50,
                    width: 40,
                    child: Center(
                        child: IconAnimated(
                      color: widget.primaryColor,
                      progress: _animation,
                      size: 40,
                      iconType: IconType.check,
                    )),
                  ),
                )
              : SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(left: 8),
                          width: 40,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            child: IconAnimated(
                              color: fadeAnimationStart
                                  ? Colors.white
                                  : widget.primaryColor,
                              progress: _animation,
                              size: 40,
                              iconType: IconType.check,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      AnimatedContainer(
                        margin:
                            EdgeInsets.only(left: fadeAnimationStart ? 0 : 10),
                        duration: const Duration(milliseconds: 300),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: fadeAnimationStart ? 1.0 : 0.0,
                          child: Text(widget.label,
                              overflow: TextOverflow.ellipsis,
                              style: widget.titleTextStyle ??
                                  TextStyle(
                                      fontSize: 16,
                                      color: widget.primaryColor == Colors.white
                                          ? Colors.black
                                          : Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class SaveSnackBarSecondWidget extends StatefulWidget
    implements SnackBarAction {
  const SaveSnackBarSecondWidget({
    Key? key,
    this.textColor,
    this.disabledTextColor,
    required this.label,
    required this.onPressed,
    this.primaryColor = Colors.green,
    this.titleTextStyle,
  }) : super(key: key);

  @override
  final Color? textColor;

  @override
  final Color? disabledTextColor;

  @override
  final String label;

  @override
  final VoidCallback onPressed;

  final Color primaryColor;
  final TextStyle? titleTextStyle;

  @override
  State<SaveSnackBarSecondWidget> createState() =>
      _SaveSnackBarSecondWidgetState();
}

class _SaveSnackBarSecondWidgetState extends State<SaveSnackBarSecondWidget>
    with SingleTickerProviderStateMixin {
  var fadeAnimationStart = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCirc));
    _handleAnimation();
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose(); // you need this
    super.dispose();
  }

  void _handleAnimation() {
    Future.delayed(const Duration(milliseconds: 300), () {
      _showAnimation();
      setState(() {
        fadeAnimationStart = true;
      });
    });
  }

  void _showAnimation() {
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(15),
        child: AnimatedContainer(
          color: widget.primaryColor,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 400),
          height: 50,
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    width: 40,
                    child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white.withOpacity(0),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          child: IconAnimated(
                            color: fadeAnimationStart
                                ? Colors.white
                                : widget.primaryColor,
                            progress: _animation,
                            size: 40,
                            iconType: IconType.check,
                          ),
                        )),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      margin:
                          EdgeInsets.only(left: fadeAnimationStart ? 0 : 10),
                      duration: const Duration(milliseconds: 400),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 400),
                        opacity: fadeAnimationStart ? 1.0 : 0.0,
                        child: Text(widget.label,
                            overflow: TextOverflow.visible,
                            maxLines: 1,
                            style: widget.titleTextStyle ??
                                const TextStyle(
                                    fontSize: 16, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FailSnackBarFirstWidget extends StatefulWidget implements SnackBarAction {
  const FailSnackBarFirstWidget({
    Key? key,
    this.textColor,
    this.disabledTextColor,
    required this.label,
    required this.onPressed,
    this.primaryColor = Colors.red,
    this.titleTextStyle,
  }) : super(key: key);

  @override
  final Color? textColor;

  @override
  final Color? disabledTextColor;

  @override
  final String label;

  @override
  final VoidCallback onPressed;

  final Color primaryColor;
  final TextStyle? titleTextStyle;

  @override
  State<FailSnackBarFirstWidget> createState() =>
      _FailSnackBarFirstWidgetState();
}

class _FailSnackBarFirstWidgetState extends State<FailSnackBarFirstWidget>
    with SingleTickerProviderStateMixin {
  var changeAnimationStart = false;
  var fadeAnimationStart = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCirc));
    _handleAnimation();

    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose(); // you need this
    super.dispose();
  }

  void _handleAnimation() {
    _showIcon();
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        changeAnimationStart = true;
      });
      Future.delayed(const Duration(milliseconds: 50), () {
        setState(() {
          fadeAnimationStart = true;
        });
      });
    });
  }

  void _showIcon() {
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(15),
        child: AnimatedContainer(
          color: changeAnimationStart
              ? widget.primaryColor
              : Colors.white.withOpacity(0),
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 200),
          height: 50,
          child: !changeAnimationStart
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    height: 50,
                    width: 40,
                    child: Center(
                        child: IconAnimated(
                      color: widget.primaryColor,
                      progress: _animation,
                      size: 40,
                      iconType: IconType.fail,
                    )),
                  ),
                )
              : SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(left: 8),
                          width: 40,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            child: IconAnimated(
                              color: fadeAnimationStart
                                  ? Colors.white
                                  : widget.primaryColor,
                              progress: _animation,
                              size: 40,
                              iconType: IconType.fail,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      AnimatedContainer(
                        margin:
                            EdgeInsets.only(left: fadeAnimationStart ? 0 : 10),
                        duration: const Duration(milliseconds: 300),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: fadeAnimationStart ? 1.0 : 0.0,
                          child: Text(widget.label,
                              overflow: TextOverflow.ellipsis,
                              style: widget.titleTextStyle ??
                                  TextStyle(
                                      fontSize: 16,
                                      color: widget.primaryColor == Colors.white
                                          ? Colors.black
                                          : Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class FailSnackBarSecondWidget extends StatefulWidget
    implements SnackBarAction {
  const FailSnackBarSecondWidget({
    Key? key,
    this.textColor,
    this.disabledTextColor,
    required this.label,
    required this.onPressed,
    this.primaryColor = Colors.red,
    this.titleTextStyle,
  }) : super(key: key);

  @override
  final Color? textColor;

  @override
  final Color? disabledTextColor;

  @override
  final String label;

  @override
  final VoidCallback onPressed;

  final Color primaryColor;
  final TextStyle? titleTextStyle;

  @override
  State<FailSnackBarSecondWidget> createState() =>
      _FailSnackBarSecondWidgetState();
}

class _FailSnackBarSecondWidgetState extends State<FailSnackBarSecondWidget>
    with SingleTickerProviderStateMixin {
  var fadeAnimationStart = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCirc));
    _handleAnimation();
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose(); // you need this
    super.dispose();
  }

  void _handleAnimation() {
    Future.delayed(const Duration(milliseconds: 300), () {
      _showIcon();
      setState(() {
        fadeAnimationStart = true;
      });
    });
  }

  void _showIcon() {
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(15),
        child: AnimatedContainer(
          color: widget.primaryColor,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 400),
          height: 50,
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    width: 40,
                    child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white.withOpacity(0),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          child: IconAnimated(
                            color: fadeAnimationStart
                                ? Colors.white
                                : widget.primaryColor,
                            progress: _animation,
                            size: 40,
                            iconType: IconType.fail,
                          ),
                        )),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      margin:
                          EdgeInsets.only(left: fadeAnimationStart ? 0 : 10),
                      duration: const Duration(milliseconds: 400),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 400),
                        opacity: fadeAnimationStart ? 1.0 : 0.0,
                        child: Text(widget.label,
                            overflow: TextOverflow.visible,
                            maxLines: 1,
                            style: widget.titleTextStyle ??
                                const TextStyle(
                                    fontSize: 16, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AlertSnackBarFirstWidget extends StatefulWidget
    implements SnackBarAction {
  const AlertSnackBarFirstWidget({
    Key? key,
    this.textColor,
    this.disabledTextColor,
    required this.label,
    required this.onPressed,
    this.primaryColor = Colors.black,
    this.titleTextStyle,
  }) : super(key: key);

  @override
  final Color? textColor;

  @override
  final Color? disabledTextColor;

  @override
  final String label;

  @override
  final VoidCallback onPressed;

  final Color primaryColor;
  final TextStyle? titleTextStyle;

  @override
  State<AlertSnackBarFirstWidget> createState() =>
      _AlertSnackBarFirstWidgetState();
}

class _AlertSnackBarFirstWidgetState extends State<AlertSnackBarFirstWidget>
    with SingleTickerProviderStateMixin {
  var changeAnimationStart = false;
  var fadeAnimationStart = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCirc));
    _handleAnimation();

    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose(); // you need this
    super.dispose();
  }

  void _handleAnimation() {
    _showIcon();
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {
        changeAnimationStart = true;
      });
      Future.delayed(const Duration(milliseconds: 50), () {
        setState(() {
          fadeAnimationStart = true;
        });
      });
    });
  }

  void _showIcon() {
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(15),
        child: AnimatedContainer(
          color: changeAnimationStart
              ? widget.primaryColor
              : Colors.white.withOpacity(0),
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 200),
          height: 50,
          child: !changeAnimationStart
              ? Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    height: 50,
                    width: 40,
                    child: Center(
                        child: IconAnimated(
                      color: widget.primaryColor,
                      progress: _animation,
                      size: 40,
                      iconType: IconType.alert,
                    )),
                  ),
                )
              : SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(left: 8),
                          width: 40,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 400),
                            child: IconAnimated(
                              color: fadeAnimationStart
                                  ? Colors.white
                                  : widget.primaryColor,
                              progress: _animation,
                              size: 40,
                              iconType: IconType.alert,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      AnimatedContainer(
                        margin:
                            EdgeInsets.only(left: fadeAnimationStart ? 0 : 10),
                        duration: const Duration(milliseconds: 300),
                        child: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: fadeAnimationStart ? 1.0 : 0.0,
                          child: Text(widget.label,
                              overflow: TextOverflow.ellipsis,
                              style: widget.titleTextStyle ??
                                  TextStyle(
                                      fontSize: 16,
                                      color: widget.primaryColor == Colors.white
                                          ? Colors.black
                                          : Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}

class AlertSnackBarSecondWidget extends StatefulWidget
    implements SnackBarAction {
  const AlertSnackBarSecondWidget({
    Key? key,
    this.textColor,
    this.disabledTextColor,
    required this.label,
    required this.onPressed,
    this.primaryColor = Colors.black,
    this.titleTextStyle,
  }) : super(key: key);

  @override
  final Color? textColor;

  @override
  final Color? disabledTextColor;

  @override
  final String label;

  @override
  final VoidCallback onPressed;

  final Color primaryColor;
  final TextStyle? titleTextStyle;

  @override
  State<AlertSnackBarSecondWidget> createState() =>
      _AlertSnackBarSecondWidgetState();
}

class _AlertSnackBarSecondWidgetState extends State<AlertSnackBarSecondWidget>
    with SingleTickerProviderStateMixin {
  var fadeAnimationStart = false;

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCirc));
    _handleAnimation();
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose(); // you need this
    super.dispose();
  }

  void _handleAnimation() {
    Future.delayed(const Duration(milliseconds: 300), () {
      _showIcon();
      setState(() {
        fadeAnimationStart = true;
      });
    });
  }

  void _showIcon() {
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(15),
        child: AnimatedContainer(
          color: widget.primaryColor,
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 400),
          height: 50,
          child: SizedBox(
            height: 50,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    width: 40,
                    child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white.withOpacity(0),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          child: IconAnimated(
                            color: fadeAnimationStart
                                ? Colors.white
                                : widget.primaryColor,
                            progress: _animation,
                            size: 40,
                            iconType: IconType.alert,
                          ),
                        )),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      margin:
                          EdgeInsets.only(left: fadeAnimationStart ? 0 : 10),
                      duration: const Duration(milliseconds: 400),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 400),
                        opacity: fadeAnimationStart ? 1.0 : 0.0,
                        child: Text(widget.label,
                            overflow: TextOverflow.visible,
                            maxLines: 1,
                            style: widget.titleTextStyle ??
                                const TextStyle(
                                    fontSize: 16, color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
