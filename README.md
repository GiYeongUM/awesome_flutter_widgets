# awesome_flutter_widgets

awesome flutter widgets

[![Flutter](https://img.shields.io/badge/Platform-Flutter-blue.svg)](https://flutter.dev/)

## Widget lists

- ellipsis_text
- custom_dialog
- custom_fab
- custom_animated_icons
- animated_snack_bar
- and some utils (regex, timeAgo..)

## ⚡ [Installation](https://flutter.dev/docs/development/packages-and-plugins/using-packages)


```yaml
dependencies:
  awesome_flutter_widgets: ^<latest_version>
```

## 💪 Widgets

## 1. ellipsis_text

ellipsis text is a widget that allows you to **customize text in ellipsis** when text exceeds maxLines.


<img width="308" alt="" src="https://github.com/GiYeongUM/awesome_flutter_widgets/raw/main/images/ellipsis_text.gif">

``` dart
EllipsisText(
    text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
        "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
        "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
    ellipsis: "..show more",
    maxLines: 2,  // default
    style: TextStyle(), // add if you want
    isShowMore: true, // default
    startScaleIsSmall: true, // default
)
```


## 2. custom_dialog 

This widget is a simple dialog that deviates from the complex dialog of the flutter.
You can also add an **animation icon** instead of a title.


<img width="308" alt="" src="https://github.com/GiYeongUM/awesome_flutter_widgets/raw/main/images/custom_dialog_text.png">
<img width="308" alt="" src="https://github.com/GiYeongUM/awesome_flutter_widgets/raw/main/images/custom_dialog_icon.gif">

``` dart
CustomDialog.dialog(
    context: context, 
    title: "Check", 
    content: "Save successfully", 
    iconTitle: true
);
```

also you can customize sizes, widget and fonts ...

``` dart
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
  });
```

## 3. custom_fab 

Simple animated FAB! (maximum 3)

<img width="308" alt="" src="https://github.com/GiYeongUM/awesome_flutter_widgets/raw/main/images/custom_fab_widget.gif">

``` dart
floatingActionButton: CustomFAB(
    firstOnClick: () { 
      /// do something!
    },
    firstButtonIcon: Icons.add,
    secondOnClick: () {
      /// do something!
    },
    secondButtonIcon: Icons.close,
    thirdOnClick: () {
      /// do something!
    },
    thirdButtonIcon: Icons.add,
),
```


## 4. custom_animated_icons 

Simple animated Icons! (It will be added frequently)

<img width="308" alt="" src="https://github.com/GiYeongUM/awesome_flutter_widgets/raw/main/images/custom_animated_icons.gif">

1. set animations
``` dart
class _FooClassState extends State<FooClass> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState()  {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutCirc));
    super.initState();
  }

  void _showIcon() {
    _animationController.forward();
  }
  
  ...
```

2. add widget
``` dart
CustomAnimatedIcons(
    color: Colors.green,
    progress: _animation,
    size: 40,
    iconType: IconType.check,
),

CustomAnimatedIcons(
    color: Colors.red,
    progress: _animation,
    size: 40,
    iconType: IconType.fail,
),

CustomAnimatedIcons(
    color: Colors.black,
    progress: _animation,
    size: 40,
    iconType: IconType.alert,
),
```

3. trigger widget animation
``` dart
_showIcon()

/// If you want to do the reverse
/// do this
/// _animationController.reverse();
```

## 5. animated_snack_bar 

This widget is a snack bar with a customized animation.
There are two animations for each state.


<img width="308" alt="" src="https://github.com/GiYeongUM/awesome_flutter_widgets/raw/main/images/animated_snack_bar_save_2.gif">
<img width="308" alt="" src="https://github.com/GiYeongUM/awesome_flutter_widgets/raw/main/images/animated_snack_bar_fail_2.gif">
<img width="308" alt="" src="https://github.com/GiYeongUM/awesome_flutter_widgets/raw/main/images/animated_snack_bar_alert_2.gif">


``` dart
ElevatedButton(
  onPressed: () {
    AnimatedSnackBar.style1(
        context: context,
        label: "Save successfully",
        snackBarType: SnackBarType.saveSecondAnimation
    );
  },
  child: const Text("Save"),
),
```

## 6. utils 


