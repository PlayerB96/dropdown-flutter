import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatefulWidget {
  MapPage({this.url, this.title, this.image});

  final String url;
  final String title;
  final String image;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Future<LocationPermission> permission = Geolocator.requestPermission();
  Future<Position> position =
      Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

  @override
  void initState() {
    super.initState();
    
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
            title: Row(
              children: [
                Padding(padding: EdgeInsets.only(right:2.0)),
                Image.asset(
                 widget.image,
                  fit: BoxFit.contain,
                  height: 50,
                  width: 50,
              ),
              SizedBox(width: 20),
                Text(widget.title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            )));
  }
}