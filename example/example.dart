import 'package:awesome_flutter_widgets/awesome_flutter_widgets.dart';
import 'package:flutter/material.dart';
import 'package:icon_animated/widgets/icon_animated.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Demo Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Widget Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCirc));
    super.initState();
  }

  void _showIcon() {
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const EllipsisText(
                text:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                    "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                    "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
                ellipsis: "..show more",
                maxLines: 2, // default
                isShowMore: true, // default
                startScaleIsSmall: true, // default
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    CustomDialog.dialog(
                        context: context,
                        title: 'Check',
                        content: "Save successfully",
                        iconTitle: true);
                  },
                  child: const Text("Save"),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                    AnimatedSnackBar.style1(
                        context: context,
                        label: "Save successfully",
                        snackBarType: SnackBarType.saveSecondAnimation);
                  },
                  child: const Text("Save"),
                ),
              ),
              IconAnimated(
                color: Colors.green,
                progress: _animation,
                size: 40,
                iconType: IconType.check,
              ),
            ],
          ),
        ),
      ),
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
    );
  }
}
