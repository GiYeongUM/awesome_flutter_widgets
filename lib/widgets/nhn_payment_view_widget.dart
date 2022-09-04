
/// import 'dart:async';
/// import 'dart:convert';
/// import 'dart:developer';
/// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:webview_flutter/webview_flutter.dart';



/// NHN 사이버 결제 웹뷰 위젯
/// url에 결제요청 url 연동하면 완료

class PaymentViewWidget extends StatelessWidget {
  const PaymentViewWidget(
      {Key? key, required this.url}) : super(key: key);

  final String url;
  final MethodChannel _channel = const MethodChannel('payment');

  ///todo: flutter webView 라이브러리 추가 후 설정
  ///todo: urlLauncher 필요시 추가

  @override
  Widget build(BuildContext context) {
    return Container(
      // child:
        // WebView(
        //   debuggingEnabled: true,
        //   onPageStarted: () {
        //   },
        //   onProgress: (int progress) {
        //   },
        //   onWebViewCreated: (WebViewController webViewController) {
        //     paymentController.completerController = Completer<WebViewController>();
        //     paymentController.completerController.complete(webViewController);
        //     paymentController.completerController.future.then((value) => paymentController.webViewController = value);
        //   },
        //   onPageFinished: (String url) {
        //
        //   },
        //   javascriptChannels: <JavascriptChannel>{
        //     paymentController.baseJavascript(context),
        //   },
        //   navigationDelegate: (NavigationRequest delegate) async {
        //     if (Platform.isAndroid && (delegate.url.startsWith('intent://') || delegate.url.startsWith('market://'))) {
        //       await _channel.invokeMethod('intent', {'url': delegate.url});
        //       return NavigationDecision.prevent;
        //     }
        //     else if (Platform.isIOS && (delegate.url.contains('itms-apps') || ((!delegate.url.startsWith('https') && (!delegate.url.startsWith("http")))))) {
        //       await _iosNavigate(delegate.url);
        //       return NavigationDecision.prevent;
        //     }
        //     return NavigationDecision.navigate;
        //   },
        //   initialUrl: Uri.parse(url).toString(),
        //   javascriptMode: JavascriptMode.unrestricted,
        // ),
      // ),
    );
  }

  /// IOS 네비게이팅
  /// IOS에서 앱스토어 연결 혹은 인터넷 창 연결을 위한 로직
  // Future<void> _iosNavigate(String url) async {
  //   await launchUrl(Uri.parse(url));
  // }

  /// 뒤로가기 웹뷰 로직
  /// 강제적으로 웹의 뒤로가기를 활용해야 할 때 사용
  // Future<bool> _goBack(BuildContext context) async {
  //   if (controller is null) {
  //     return true;
  //   }
  //   if (canGoBack) {
  //     paymentController.webViewController!.goBack();
  //     return Future.value(false);
  //   } else {
  //     return Future.value(true);
  //   }
  // }
}

/// Javascript Controller
/// 웹뷰앱 javascript 통신이 필요하면 사용
// JavascriptChannel baseJavascript(BuildContext context) {
//   return JavascriptChannel(
//       name: 'ChannelName',
//       onMessageReceived: (JavascriptMessage message) async {
//
//       });
// }

/// Android Method Channel
/// 안드로이드 Intent 사용을 위한 메소드 체널 (MainActivity 에서 사용 권장)
// class MainActivity: FlutterActivity() {
//   private val openIntent: String = "openIntentChannel"
//   private val CHANNEL = "payment"
//   lateinit var channel : MethodChannel
//
//   override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
//   GeneratedPluginRegistrant.registerWith(flutterEngine)
//   channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
//   channel.setMethodCallHandler { call, result ->
//   when (call.method) {
//   "intent" -> intentCall(call, result)
//   }
//
//   }
//   }
//   fun intentCall(call: MethodCall, result: MethodChannel.Result) {
//   val url: String = call.argument("url") ?: return
//   try {
//   val intent: Intent = Intent.parseUri(url, Intent.URI_INTENT_SCHEME)
//   val existPackage =
//   activity.packageManager.getLaunchIntentForPackage(intent.`package`.toString())
//   if (existPackage != null) {
//   activity.startActivity(intent)
//   } else {
//   val marketIntent = Intent(Intent.ACTION_VIEW)
//   marketIntent.data = Uri.parse("market://details?id=" + intent.`package`)
//   activity.startActivity(marketIntent)
//   }
//   } catch (e: Exception) {
//   e.printStackTrace()
//   }
//   }
// }