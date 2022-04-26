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
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/appBarBg.png'),
              fit: BoxFit.fill
            )
          ),
        ),
          title: Text(appTitle, style: const TextStyle(
              color: Colors.white,
              fontSize: 26.0,
              fontWeight: FontWeight.w700,
          )),
          centerTitle: true,
          backgroundColor: const Color(0xFF0C0D31),

          toolbarHeight: MediaQuery.of(context).size.height * 0.15


      ),
      body: _streamModel.isEmpty
        ? const Center(child:  CircularProgressIndicator(color: Color(0xFF0C0D31)))
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
