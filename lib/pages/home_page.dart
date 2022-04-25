import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String appTitle = "Stations";
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text(appTitle, style: const TextStyle(color: Colors.white, fontSize: 20.0))),
      body: const Center(
        child: Text('Station List Here'),
      ),
    );
  }
}
