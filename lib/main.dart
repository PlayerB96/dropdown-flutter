import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

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
          children: <Widget> [
            
            Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                  "https://www.tailorbrands.com/wp-content/uploads/2020/07/finepack-ventures-logo.jpg"),
                ),
                shape: BoxShape.circle,
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: Colors.tealAccent),
                ],
              
              ),
              child: DropdownButton(
                value: _chosenValue,
                style: TextStyle(color: Colors.black, fontSize: 18),
                dropdownColor: Colors.tealAccent,
                elevation: 6,
                borderRadius: BorderRadius.circular(8),
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
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                onChanged: (String value) {
                  setState(() {
                    _chosenValue = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              child: Text("Siguiente"),
              style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
            ),
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
  
  FirstRoute({this.url, this.value});

  final String url;
  final String value;


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
          title: new Text("${widget.value}"),
        ),
        body: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        )
    );
  }
}
