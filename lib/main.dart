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
      title: 'LocatorApp',
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
      ],
      url = [
        "https://nimbus.wialon.com/locator/606e95159c964a95aac201f5d3cbe6d5",
        "https://nimbus.wialon.com/locator/45c3b367f8ef49a09699f39a77e6b037",
        "https://nimbus.wialon.com/locator/93b33e6675ea4fc99894b984a05b8a63",
        "https://nimbus.wialon.com/locator/0abb1d1e4a9d45918e86a7b82fcff5a5",
        "https://nimbus.wialon.com/locator/4fe87c3d1a574162a6f240d5a0461eeb",
        "https://nimbus.wialon.com/locator/5e61cc2c0d644c9f90f530210726056e",
        "https://nimbus.wialon.com/locator/a189b56b42f94cd397a46416ea908a9a"
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
              child: DropdownButton<String>(
                icon: Icon(
                  Icons.arrow_downward,
                  color: Colors.redAccent,
                  size: 20.09,
                ),
                value: _chosenValue,
                style: TextStyle(color: Colors.black, fontSize: 18),
                dropdownColor: Colors.white,
                elevation: 6,
                items: empresas.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                
                hint: Text(
                  "Selecciona Empresa",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                onChanged: (String a) {
                  setState(() {
                    _chosenValue = a;
                    switch(a){
                  case "REINO DE QUITO" :
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FirstRoute()),
                    );
                    break;
                  case "TRANSPORSEL" :
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondRoute()),
                    );
                    break;
                    case "QUITUMBE" :
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ThirdRoute()),
                    );
                    break;
                  case "TRANSALFA" :
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FourRoute()),
                    );
                    break;
                    case "COLECTRANS" :
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FiveRoute()),
                    );
                    break;
                  case "NACIONAL" :
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SixRoute()),
                    );
                    break;
                    case "RAPITRANS" :
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SevenRoute()),
                    );
                    break;
                  
                  
              }
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
        url: "https://nimbus.wialon.com/locator/606e95159c964a95aac201f5d3cbe6d5",
        withZoom: true,
        hidden: true,
        withLocalStorage: true,
        geolocationEnabled: true,
        appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text("Quito",
                style: const TextStyle(fontWeight: FontWeight.bold))));
  }
}

class SecondRoute extends StatefulWidget {
  SecondRoute({this.url});

  final String url;
  String value;

  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
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
        url: "https://nimbus.wialon.com/locator/45c3b367f8ef49a09699f39a77e6b037",
        withZoom: true,
        hidden: true,
        withLocalStorage: true,
        geolocationEnabled: true,
        appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text("Tranportel",
                style: const TextStyle(fontWeight: FontWeight.bold))));
  }
}


class ThirdRoute extends StatefulWidget {
  ThirdRoute({this.url});

  final String url;
  String value;

  @override
  _ThirdRouteState createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
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
        url: "https://nimbus.wialon.com/locator/93b33e6675ea4fc99894b984a05b8a63",
        withZoom: true,
        hidden: true,
        withLocalStorage: true,
        geolocationEnabled: true,
        appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text("QUITUMBE",
                style: const TextStyle(fontWeight: FontWeight.bold))));
  }
}


class FourRoute extends StatefulWidget {
  FourRoute({this.url});

  final String url;
  String value;

  @override
  _FourRouteState createState() => _FourRouteState();
}

class _FourRouteState extends State<FourRoute> {
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
        url: "https://nimbus.wialon.com/locator/0abb1d1e4a9d45918e86a7b82fcff5a5",
        withZoom: true,
        hidden: true,
        withLocalStorage: true,
        geolocationEnabled: true,
        appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text("TRANSALFA",
                style: const TextStyle(fontWeight: FontWeight.bold))));
  }
}


class FiveRoute extends StatefulWidget {
  FiveRoute({this.url});

  final String url;
  String value;

  @override
  _FiveRouteState createState() => _FiveRouteState();
}

class _FiveRouteState extends State<FiveRoute> {
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
        url: "https://nimbus.wialon.com/locator/4fe87c3d1a574162a6f240d5a0461eeb",
        withZoom: true,
        hidden: true,
        withLocalStorage: true,
        geolocationEnabled: true,
        appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text("RAPITRANS",
                style: const TextStyle(fontWeight: FontWeight.bold))));
  }
}


class SixRoute extends StatefulWidget {
  SixRoute({this.url});

  final String url;
  String value;

  @override
  _SixRouteState createState() => _SixRouteState();
}

class _SixRouteState extends State<SixRoute> {
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
        url: "https://nimbus.wialon.com/locator/5e61cc2c0d644c9f90f530210726056e",
        withZoom: true,
        hidden: true,
        withLocalStorage: true,
        geolocationEnabled: true,
        appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text("NACIONAL",
                style: const TextStyle(fontWeight: FontWeight.bold))));
  }
}

class SevenRoute extends StatefulWidget {
  SevenRoute({this.url});

  final String url;
  String value;

  @override
  _SevenRouteState createState() => _SevenRouteState();
}

class _SevenRouteState extends State<SevenRoute> {
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
        url: "https://nimbus.wialon.com/locator/a189b56b42f94cd397a46416ea908a9a",
        withZoom: true,
        hidden: true,
        withLocalStorage: true,
        geolocationEnabled: true,
        appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text("RAPITRANS",
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
