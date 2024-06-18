import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  const WebViewContainer({super.key});

  @override
  State<WebViewContainer> createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  final controler = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(
      Uri.parse(
        'https://dripalert.vercel.app/',
      ),
    );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Web View',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
      ),
      body: WebViewWidget(controller: controler),
    );
  }
}
  // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 20),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const WebViewContainer(),
            //         ),
            //       );
            //     },
            //     child: const Text(
            //       'web',
            //       style: TextStyle(
            //           color: Colors.black,
            //           fontSize: 20,
            //           fontWeight: FontWeight.bold,
            //           fontFamily: 'Poppins'),
            //     ),
            //   ),
            // ),