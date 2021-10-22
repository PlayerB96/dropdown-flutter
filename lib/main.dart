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
        primarySwatch: Colors.teal,
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
              color: Colors.tealAccent,
              child: DropdownButton(
                value: _chosenValue,
                //elevation: 5,
                style: TextStyle(color: Colors.black),
                

                items: [
                  DropdownMenuItem(
                    child: Text("Transporsel"),
                    value:
                        "https://nimbus.wialon.com/locator/606e95159c964a95aac201f5d3cbe6d5",
                  ),
                  DropdownMenuItem(
                    child: Text("Rapitrans"),
                    value:
                        "https://nimbus.wialon.com/locator/45c3b367f8ef49a09699f39a77e6b037",
                  ),
                  DropdownMenuItem(
                    child: Text("Quitumbe"),
                    value:
                        "https://nimbus.wialon.com/locator/93b33e6675ea4fc99894b984a05b8a63",
                  ),
                  DropdownMenuItem(
                    child: Text("Transalfa"),
                    value:
                        "https://nimbus.wialon.com/locator/0abb1d1e4a9d45918e86a7b82fcff5a5",
                  ),
                  DropdownMenuItem(
                    child: Text("Reino de Quito"),
                    value:
                        "https://nimbus.wialon.com/locator/4fe87c3d1a574162a6f240d5a0461eeb",
                  ),
                  DropdownMenuItem(
                    child: Text("Colectrans"),
                    value:
                        "https://nimbus.wialon.com/locator/5e61cc2c0d644c9f90f530210726056e",
                  ),
                  DropdownMenuItem(
                    child: Text("Nacional"),
                    value:
                        "https://nimbus.wialon.com/locator/a189b56b42f94cd397a46416ea908a9a",
                  ),
                ],
                hint: Text(
                  "Selecciona Empresa",
                  style: TextStyle(
                      color: Colors.blue,
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
  String value;

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
          title: 
          TextField(
            onChanged: (String value) {
              Text("First text field: $value");
            },
            
          ),
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
