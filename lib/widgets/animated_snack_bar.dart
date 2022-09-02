import 'dart:ui';

import 'package:flutter/material.dart';
enum SnackBarType {
  saveFirstAnimation,
  saveSecondAnimation,
  failFirstAnimation,
  failSecondAnimation,

}
class AnimatedSnackBar {
  static style1({
    required BuildContext context,
    String? label,
    Color primaryColor = Colors.green,
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
    switch (snackBarType){
      case SnackBarType.saveFirstAnimation:
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: duration ?? const Duration(seconds: 3),
          dismissDirection: direction ?? DismissDirection.down,
          behavior: SnackBarBehavior.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: SaveSnackBarFirstWidget(onPressed: () {
            ScaffoldMessenger.of(context).clearSnackBars();
          },
            label: label ?? "",
            primaryColor: primaryColor,
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
          content: SaveSnackBarSecondWidget(onPressed: () {
            ScaffoldMessenger.of(context).clearSnackBars();
          },
            label: label ?? "",
            primaryColor: primaryColor,
            titleTextStyle: titleTextStyle,
          ),
        ));
      case SnackBarType.failFirstAnimation:
        // TODO: Handle this case.
        break;
      case SnackBarType.failSecondAnimation:
        // TODO: Handle this case.
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
  State<SaveSnackBarFirstWidget> createState() => _SaveSnackBarFirstWidgetState();
}

class _SaveSnackBarFirstWidgetState extends State<SaveSnackBarFirstWidget> with SingleTickerProviderStateMixin {
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
    Future.delayed(const Duration(milliseconds: 800), (){
      setState(() {
        changeAnimationStart = true;
      });
      Future.delayed(const Duration(milliseconds: 50), (){
        setState(() {
          fadeAnimationStart = true;
        });
      });
    });
  }

  void _showCheck() {
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
          color: changeAnimationStart ? widget.primaryColor : Colors.white.withOpacity(0),
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 200),
          height: 50,
          child: !changeAnimationStart ? Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.only(left: 8),
              height: 50,
              width: 40,
              child: Center(
                  child: AnimatedCheck(
                    color: widget.primaryColor,
                    progress: _animation,
                    size: 40,
                  )),
            ),
          ) : SizedBox(
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
                      child: AnimatedCheck(
                        color: fadeAnimationStart ? Colors.white : widget.primaryColor,
                        progress: _animation,
                        size: 40,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(widget.label,
                    overflow: TextOverflow.ellipsis,
                    style: widget.titleTextStyle ?? TextStyle(fontSize: 16, color: widget.primaryColor == Colors.white ? Colors.black : Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SaveSnackBarSecondWidget extends StatefulWidget implements SnackBarAction {
  const SaveSnackBarSecondWidget({
    Key? key,
    this.textColor,
    this.disabledTextColor,
    required this.label,
    required this.onPressed,
    this.primaryColor = Colors.green, this.titleTextStyle,
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
  State<SaveSnackBarSecondWidget> createState() => _SaveSnackBarSecondWidgetState();
}

class _SaveSnackBarSecondWidgetState extends State<SaveSnackBarSecondWidget> with SingleTickerProviderStateMixin {
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
    Future.delayed(const Duration(milliseconds: 300), (){
      _showCheck();
      setState(() {
        fadeAnimationStart = true;
      });
    });
  }

  void _showCheck() {
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
                          child: AnimatedCheck(
                            color: fadeAnimationStart ? Colors.white : widget.primaryColor,
                            progress: _animation,
                            size: 40,
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
                      margin: EdgeInsets.only(left: fadeAnimationStart ? 0 : 10),
                      duration: const Duration(milliseconds: 400),
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 400),
                        opacity: fadeAnimationStart ? 1.0 : 0.0,
                        child: Text(widget.label,
                            overflow: TextOverflow.visible,
                            maxLines: 1,
                            style: widget.titleTextStyle ??
                                const TextStyle(fontSize: 16, color: Colors.white)),
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

