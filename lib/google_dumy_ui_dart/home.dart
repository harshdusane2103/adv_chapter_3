import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

late InAppWebViewController webViewController;
TextEditingController searchController = TextEditingController();

class GoogleSearchInAppWebView extends StatefulWidget {
  const GoogleSearchInAppWebView({super.key});

  @override
  _GoogleSearchInAppWebViewState createState() =>
      _GoogleSearchInAppWebViewState();
}

class _GoogleSearchInAppWebViewState extends State<GoogleSearchInAppWebView> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Color(0xff1E1F22),
        centerTitle: true,
        title: const Text(
          'Google',
          style: TextStyle(fontWeight: FontWeight.bold,),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search,),
            onPressed: () {
              String query = searchController.text;
              if (query.isNotEmpty) {
                String url =
                Uri.https('www.google.com', '/search', {'q': query})
                    .toString();
                webViewController.loadUrl(
                  urlRequest: URLRequest(url: WebUri.uri(Uri.parse(url))),
                );
              }
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: SizedBox(
            height: h * 0.065,
            width: w * 0.92,
            child: TextField(
              style: TextStyle(color: Colors.white),
              autocorrect: true,

              controller: searchController,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                prefixIcon: CircleAvatar(
                  radius: 2 ,
                  backgroundImage: AssetImage('Assets/Image/googlelogo.png'),
                ),
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.white)),
                filled: true,
                fillColor: Color(0xff939393),
              ),
              onSubmitted: (query) {
                if (query.isNotEmpty) {
                  String url =
                  Uri.https('www.google.com', '/search', {'q': query})
                      .toString();
                  webViewController.loadUrl(
                    urlRequest: URLRequest(url: WebUri.uri(Uri.parse(url))),
                  );
                }
              },
            ),
          ),
        ),
      ),
      body: InAppWebView(
        initialUrlRequest:
        URLRequest(url: WebUri.uri(Uri.parse("https://www.google.com"))),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        // initialOptions: InAppWebViewGroupOptions(
        //   crossPlatform: InAppWebViewOptions(
        //     javaScriptEnabled: true,
        //   ),
        // ),
      ),
    );
  }
}