import 'package:dropdown/views/maps/my_homy_page.dart';
import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return VRouter(
      title:"Prueba",
      initialUrl: '/homepage',
      routes: [
        VWidget(
          path: '/homepage', 
          widget: MyHomePage(),
        ),
      ],
    );
  }
}

