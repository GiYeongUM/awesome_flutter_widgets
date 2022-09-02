import 'package:awesome_flutter_widgets/utils.dart';
import 'package:awesome_flutter_widgets/widgets/animated_snack_bar.dart';
import 'package:awesome_flutter_widgets/widgets/circle_check_box.dart';
import 'package:awesome_flutter_widgets/widgets/custom_dialog.dart';
import 'package:awesome_flutter_widgets/widgets/custom_fab.dart';
import 'package:awesome_flutter_widgets/widgets/ellipsis_text.dart';
import 'package:flutter/material.dart';


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

class _MyHomePageState extends State<MyHomePage> {

  List<bool> isSelected = [false, false, false, false];

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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: ElevatedButton(
                  onPressed: () {
                      AnimatedSnackBar.style1(context: context, label: "Save failed!", snackBarType: SnackBarType.failSecondAnimation);
                  },
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: CustomFAB(
      //   firstButtonIcon: Icons.add_photo_alternate_outlined,
      //   secondButtonIcon: Icons.camera_alt,
      //   thirdButtonIcon: Icons.delete,
      //   thirdIconColor: Colors.red,
      //   firstOnClick: (){
      //     showDialog(context: context, builder: (context) {
      //       return const CustomDialog(
      //           title: "알림",
      //           content: "내용입니다.",
      //           titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      //       );});
      //     },
      //   secondOnClick: (){
      //   },
      //   thirdOnClick: (){print("third");},
      // ),
    );
  }
}
