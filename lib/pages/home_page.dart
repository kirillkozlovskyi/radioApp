import 'package:flutter/material.dart';
import 'package:radio/models/stream.model.dart';

import '../api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String appTitle = "Stations";
  List<StreamModel> _streamModel = [];
  @override
  void initState() {
    super.initState();
    _getStream();
  }
  void _getStream() async {
    _streamModel = (await ApiService().getStreams())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text(appTitle, style: const TextStyle(color: Colors.white, fontSize: 20.0))),
      body: _streamModel.isEmpty
        ? const Center(child:  CircularProgressIndicator())
        : Center(
            child: ListView.builder(
              itemCount: _streamModel.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column (
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_streamModel[index].streamName.toString())
                        ],
                      )
                    ],
                  )
                );
              }
            ),
      ),
    );
  }
}
