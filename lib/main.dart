import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _chosenValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DropDown'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(0.0),
              child: DropdownButton(
                value: _chosenValue,
                //elevation: 5,
                style: TextStyle(color: Colors.black),

                items: [
                  DropdownMenuItem(
                    child: Text("transporsel"),
                    value:
                        "https://nimbus.wialon.com/locator/606e95159c964a95aac201f5d3cbe6d5",
                  ),
                  DropdownMenuItem(
                    child: Text("Rapitrans"),
                    value:
                        "https://nimbus.wialon.com/locator/45c3b367f8ef49a09699f39a77e6b037",
                  ),
                ],
                hint: Text(
                  "Selecciona Empresa",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                onChanged: (String value) {
                  setState(() {
                    _chosenValue = value;
                  });
                },
              ),
            ),
            TextButton(
              child: Text("Siguiente"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FirstRoute(url: _chosenValue)),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class FirstRoute extends StatefulWidget {
  FirstRoute({this.url});

  final String url;

  @override
  _FirstRouteState createState() => _FirstRouteState();
}

class _FirstRouteState extends State<FirstRoute> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('First Route'),
        ),
        body: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ));
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
