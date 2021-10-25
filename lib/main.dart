import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:geolocator/geolocator.dart';

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
      home: MyHomePage(title: 'Flutter'),
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
  List<String> empresas = [
    "REINO DE QUITO",
    "TRANSPORSEL",
    "QUITUMBE",
    "TRANSALFA",
    "COLECTRANS",
    "NACIONAL",
    "RAPITRANS"
  ];
  String value = 'REINO DE QUITO';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PrecisoGps'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: Colors.white),
                ],
              ),
              child: DropdownButton(
                icon: Icon(
                  Icons.arrow_downward,
                  color: Colors.redAccent,
                  size: 20.09,
                ),
                value: _chosenValue,
                style: TextStyle(color: Colors.black, fontSize: 18),
                dropdownColor: Colors.white,
                elevation: 6,
               
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
              style: TextButton.styleFrom(
                primary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                backgroundColor: Colors.teal,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FirstRoute(url: _chosenValue)),
                );
              },
              child: Text("Siguiente"),
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
  Future<LocationPermission> permission = Geolocator.requestPermission();
  Future<Position> position =
      Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: widget.url,
        withZoom: true,
        hidden: true,
        withLocalStorage: true,
        geolocationEnabled: true,
        appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text("Regresar",
                style: const TextStyle(fontWeight: FontWeight.bold))));
  }
}

class CustomGps {
  Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }
}
