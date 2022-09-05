import 'package:flutter/material.dart';

class CustomFAB extends StatefulWidget {
  const CustomFAB({
    Key? key,
    required this.firstButtonIcon,
    this.secondButtonIcon,
    this.thirdButtonIcon,
    required this.firstOnClick,
    this.secondOnClick,
    this.thirdOnClick,
    this.primaryColor,
    this.firstButtonColor,
    this.firstIconColor,
    this.secondButtonColor,
    this.secondIconColor,
    this.thirdButtonColor,
    this.thirdIconColor,
  }) : super(key: key);

  final Color? primaryColor;
  final IconData firstButtonIcon;
  final IconData? secondButtonIcon;
  final IconData? thirdButtonIcon;
  final Color? firstButtonColor;
  final Color? firstIconColor;
  final Color? secondButtonColor;
  final Color? secondIconColor;
  final Color? thirdButtonColor;
  final Color? thirdIconColor;
  final Function() firstOnClick;
  final Function()? secondOnClick;
  final Function()? thirdOnClick;

  @override
  State<CustomFAB> createState() => _CustomFABState();
}

class _CustomFABState extends State<CustomFAB>
    with SingleTickerProviderStateMixin {
  int _angle = 90;
  bool _isRotated = true;
  var buttonLength = 1;
  AnimationController? _controller;
  Animation<double>? _animation;
  Animation<double>? _animation2;
  Animation<double>? _animation3;

  @override
  void initState() {
    if (widget.secondButtonIcon == null || widget.secondOnClick == null) {
      buttonLength = 1;
    } else if (widget.thirdButtonIcon == null || widget.thirdOnClick == null) {
      buttonLength = 2;
    } else {
      buttonLength = 3;
    }

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 180),
    );

    _animation = CurvedAnimation(
      parent: _controller!,
      curve: const Interval(0.0, 1.0, curve: Curves.linear),
    );

    _animation2 = CurvedAnimation(
      parent: _controller!,
      curve: const Interval(0.5, 1.0, curve: Curves.linear),
    );

    _animation3 = CurvedAnimation(
      parent: _controller!,
      curve: const Interval(0.8, 1.0, curve: Curves.linear),
    );
    _controller!.reverse();
    super.initState();
  }

  void _rotate() {
    setState(() {
      if (_isRotated) {
        _angle = 45;
        _isRotated = false;
        _controller!.forward();
      } else {
        _angle = 90;
        _isRotated = true;
        _controller!.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Positioned(
          bottom: 80.0,
          right: 10.0,
          child: Row(
            children: <Widget>[
              ScaleTransition(
                scale: _animation!,
                alignment: FractionalOffset.center,
                child: GestureDetector(
                  onTap: () {
                    if (_angle == 45.0) {
                      widget.firstOnClick();
                      _rotate();
                    }
                  },
                  child: Stack(
                    children: [
                      Material(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            color:
                                (Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white
                                    : widget.firstButtonColor ?? Colors.white),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: Center(
                            child: Icon(
                              widget.firstButtonIcon,
                              color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : widget.firstIconColor ?? Colors.black),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          )),
      buttonLength > 1
          ? Positioned(
              bottom: 145.0,
              right: 10.0,
              child: Row(
                children: <Widget>[
                  ScaleTransition(
                    scale: _animation2!,
                    alignment: FractionalOffset.center,
                    child: GestureDetector(
                      onTap: () {
                        if (_angle == 45.0) {
                          widget.secondOnClick!();
                          _rotate();
                        }
                      },
                      child: Stack(
                        children: [
                          Material(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : widget.secondButtonColor ??
                                          Colors.white),
                                  shape: BoxShape.circle),
                            ),
                          ),
                          SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: Center(
                                child: Icon(
                                  widget.secondButtonIcon,
                                  color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : widget.secondIconColor ?? Colors.black),
                                  // color: Colors.white,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
          : Container(),
      buttonLength > 2
          ? Positioned(
              bottom: 210.0,
              right: 10.0,
              child: Row(
                children: <Widget>[
                  ScaleTransition(
                    scale: _animation3!,
                    alignment: FractionalOffset.center,
                    child: GestureDetector(
                      onTap: () {
                        if (_angle == 45.0) {
                          widget.thirdOnClick!();
                          _rotate();
                        }
                      },
                      child: Stack(
                        children: [
                          Material(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : widget.thirdButtonColor ??
                                          Colors.white),
                                  shape: BoxShape.circle),
                            ),
                          ),
                          SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: Center(
                                child: Icon(
                                  widget.thirdButtonIcon,
                                  color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : widget.thirdIconColor ?? Colors.black),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ))
          : Container(),
      Positioned(
        bottom: 10.0,
        right: 10.0,
        child: GestureDetector(
          onTap: _rotate,
          child: Stack(
            children: [
              Material(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : widget.primaryColor ?? Colors.white),
                      shape: BoxShape.circle),
                ),
              ),
              SizedBox(
                  width: 50.0,
                  height: 50.00,
                  child: Center(
                    child: AnimatedIcon(
                      icon: AnimatedIcons.menu_close,
                      progress: _controller!,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? widget.primaryColor ?? Colors.black
                          : Colors.black),
                    ),
                  )),
            ],
          ),
        ),
      ),
    ]);
  }
}
