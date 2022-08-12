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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            // todo : test widgets
            // EllipsisText(
            //   style: TextStyle(color: Colors.black, fontSize: 16),
            //   text: "위젯 테스트 문구입니다. 위젯 테스트 문구입니다. 위젯 테스트 문구입니다. 위젯 테스트 문구입니다. 위젯 테스트 문구입니다. 위젯 테스트 문구입니다. 위젯 테스트 문구입니다. 위젯 테스트 문구입니다. 위젯 테스트 문구입니다. 위젯 테스트 문구입니다. 위젯 테스트 문구입니다. "
            //       "위젯 테스트 문구입니다. 위젯 테스트 문구입니다. 위젯 테스트 문구입니다. 위젯 테스트 문구입니다. 위젯 테스트 문구입니다. 위젯 테스트 문구입니다. 위젯 테스트 문구입니다. 위젯 테스트 문구입니다. 위젯 테스트 문구입니다. 위젯 테스트 문구입니다. 위젯 테스트 문구입니다.",
            //   ellipsis: "..더보기",
            //   maxLines: 2,
            //   isShowMore: true,
            //   splashFactory: NoSplash.splashFactory,
            // ),
          ],
        ),
      ),
    );
  }
}
