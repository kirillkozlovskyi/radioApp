import 'package:flutter/material.dart';

import '../api_service.dart';
import '../constants.dart';
import '../models/stream.model.dart';
import '../widgets/stream_card.dart';
import 'single_stream_page.dart';

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
                    fit: BoxFit.fill)),
          ),
          title: Text(appTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.w700,
              )),
          centerTitle: true,
          backgroundColor: ColorConstants.primaryColor,
          toolbarHeight: MediaQuery.of(context).size.height * 0.15),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 27.0, horizontal: 15.0),
        child: _streamModel.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                    color: ColorConstants.primaryColor))
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 17.0,
                    mainAxisSpacing: 20.0),
                itemCount: _streamModel.length,
                itemBuilder: (context, index) {
                  return StreamCard(
                    streamModel: _streamModel[index],
                    streamPress: (StreamModel streamModel) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  SingleStream(streamModel: streamModel)));
                    },
                  );
                },
              ),
      ),
    );
  }
}
