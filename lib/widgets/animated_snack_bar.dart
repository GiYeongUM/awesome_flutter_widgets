import 'dart:ui';

import 'package:flutter/material.dart';

class AnimatedSnackBar {
  static style1({
    required BuildContext context,
    String? title,
    Color primaryColor = Colors.green,
    Color backgroundColor = Colors.green,
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
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: duration ?? const Duration(seconds: 3),
        dismissDirection: direction ?? DismissDirection.down,
        behavior: SnackBarBehavior.fixed,
        backgroundColor: Colors.transparent,
        onVisible: () async {


        },
        elevation: 0,
        content: CustomSnackBarWidget(label: '', onPressed: () {
        },
          height: height ?? 50, title: title ?? "",
          primaryColor: primaryColor,
          backgroundColor: backgroundColor,
          subTitle: subTitle,
          actionLabel: actionLabel,
          titleTextStyle: titleTextStyle,
          subtitleTextStyle: subtitleTextStyle,
          actionLabelTextStyle: actionLabelTextStyle,
          onActionTap: onActionTap,
          iconData: iconData,
          iconAvatarRadius: iconAvatarRadius,
          iconColor: iconColor,
          duration: duration,
          direction: direction,
          hasLabel: hasLabel,
        ),
    ));
  }
}

class CustomSnackBarWidget extends StatefulWidget implements SnackBarAction {
  const CustomSnackBarWidget({
    Key? key,
    this.textColor,
    this.disabledTextColor,
    required this.label,
    required this.onPressed,
    required this.height,
    this.backgroundColor = Colors.black,
    this.primaryColor = Colors.blue,
    required this.title,
    this.subTitle,
    this.actionLabel,
    this.titleTextStyle,
    this.subtitleTextStyle,
    this.actionLabelTextStyle,
    this.onActionTap,
    this.iconData,
    this.width,
    this.iconAvatarRadius,
    this.iconColor,
    this.duration,
    this.direction,
    this.hasLabel,
  }) : super(key: key);

  @override
  final Color? textColor;

  @override
  final Color? disabledTextColor;

  @override
  final String label;

  @override
  final VoidCallback onPressed;

  final String title;
  final Color primaryColor;
  final Color backgroundColor;
  final String? subTitle;
  final String? actionLabel;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitleTextStyle;
  final TextStyle? actionLabelTextStyle;
  final Function? onActionTap;
  final IconData? iconData;
  final double? height;
  final double? width;
  final double? iconAvatarRadius;
  final Color? iconColor;
  final Duration? duration;
  final DismissDirection? direction;
  final bool? hasLabel;


  @override
  State<CustomSnackBarWidget> createState() => _CustomSnackBarWidgetState();
}

class _CustomSnackBarWidgetState extends State<CustomSnackBarWidget> with SingleTickerProviderStateMixin {
  var sizeAnimationStart = false;
  var changeAnimationStart = false;
  var fadeAnimationStart = false;

  late AnimationController _animationController;
  late Animation<double> _animation;


  @override
  void initState()  {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutCirc));
    _handleAnimation();

    super.initState();
  }

  void _handleAnimation() {
    _showCheck();
    Future.delayed(const Duration(milliseconds: 300), (){
      setState(() {
        sizeAnimationStart = true;
      });
      Future.delayed(const Duration(milliseconds: 200), (){
        setState(() {
          changeAnimationStart = true;
        });
        Future.delayed(const Duration(milliseconds: 300), (){
          _resetCheck();
          setState(() {
            fadeAnimationStart = true;
          });
        });
      });
    });

    // widget.onPressed();
    // ScaffoldMessenger.of(context).hideCurrentSnackBar(reason: SnackBarClosedReason.action);
  }



  void _showCheck() {
    _animationController.forward();
  }

  void _resetCheck() {
    // _animationController.reverse();
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: ClipRRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        borderRadius: BorderRadius.circular(15),
        child: AnimatedContainer(
          color: fadeAnimationStart ? widget.backgroundColor : Colors.white.withOpacity(0),
          duration: const Duration(milliseconds: 150),
          height: widget.height,
          child: !changeAnimationStart ? AnimatedPadding(
            curve: Curves.easeOutBack,
            duration: const Duration(milliseconds: 150),
            padding: EdgeInsets.only(right: sizeAnimationStart ? 0 : 0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.only(left: 8),
                width: 40,
                child: CircleAvatar(
                    radius: widget.iconAvatarRadius ?? 20,
                    backgroundColor: Colors.white.withOpacity(0),
                    child: Center(
                        child: AnimatedCheck(
                          color: widget.primaryColor,
                          progress: _animation,
                          size: 40,
                        ))),
              ),
            ),
          ) : Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  width: 40,
                  child: CircleAvatar(
                      radius: widget.iconAvatarRadius ?? 20,
                      backgroundColor: Colors.white.withOpacity(0),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        child: AnimatedCheck(
                          color: fadeAnimationStart ? Colors.white : widget.primaryColor,
                          progress: _animation,
                          size: 40,
                        ),
                      )),
                ),
              ),
              const SizedBox(width: 8),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 150),
                opacity: fadeAnimationStart ? 1.0 : 0.0,
                curve: Curves.easeInOut,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        overflow: TextOverflow.ellipsis,
                        style: widget.titleTextStyle ??
                            const TextStyle(fontSize: 16, color: Colors.white)),
                    if (widget.subTitle != null)
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        child: Text(widget.subTitle ?? "",
                            overflow: TextOverflow.ellipsis,
                            style: widget.subtitleTextStyle ??
                                const TextStyle(
                                    fontSize: 12, color: Colors.white)),
                      )
                  ],
                ),
              ),
              const Spacer(),
              if (widget.actionLabel != null)
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 150),
                  opacity: fadeAnimationStart ? 1.0 : 0.0,
                  child: TextButton(
                      onPressed: () {
                        widget.onActionTap;
                      },
                      child: Text(widget.actionLabel ?? "",
                          style: widget.actionLabelTextStyle ?? const TextStyle(fontSize: 10, color: Colors.white))),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedCheck extends StatefulWidget {
  final Animation<double> progress;
  final double size;
  final Color? color;
  final double? strokeWidth;

  const AnimatedCheck({
    Key? key,
    required this.progress,
    required this.size,
    this.color,
    this.strokeWidth}) : super(key: key);

  @override
  State<StatefulWidget> createState() => AnimatedCheckState();
}

class AnimatedCheckState extends State<AnimatedCheck> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return CustomPaint(
        foregroundPainter: AnimatedPathPainter(widget.progress, widget.color ?? theme.primaryColor, widget.strokeWidth),
        child: SizedBox(
          width: widget.size,
          height: widget.size,
        )
    );
  }
}

class AnimatedPathPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color _color;
  final double? strokeWidth;

  AnimatedPathPainter(this._animation, this._color, this.strokeWidth) : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    return Path()
      ..moveTo(0.27083 * size.width, 0.54167 * size.height)
      ..lineTo(0.41667 * size.width, 0.68750 * size.height)
      ..lineTo(0.75000 * size.width, 0.35417 * size.height);
  }

  Path createAnimatedPath(Path originalPath, double animationPercent) {
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(Path originalPath, double length) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {

        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;

    final path = createAnimatedPath(_createAnyPath(size), animationPercent);

    final Paint paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth ?? size.width * 0.06;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

