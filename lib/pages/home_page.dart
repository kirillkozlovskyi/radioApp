import 'package:flutter/material.dart';
import 'package:radio/constants.dart';
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
                    fit: BoxFit.fill)),
          ),
          title: Text(appTitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.w700,
              )),
          centerTitle: true,
          backgroundColor: const Color(0xFF0C0D31),
          toolbarHeight: MediaQuery.of(context).size.height * 0.15),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 27.0, horizontal: 15.0),
        child: _streamModel.isEmpty
            ? const Center(
                child: CircularProgressIndicator(color: Color(0xFF0C0D31)))
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 17.0,
                    mainAxisSpacing: 20.0),
                itemCount: _streamModel.length,
                itemBuilder: (context, index) {
                  var imgUri = ApiConstants.codeveryWork +
                      '/' +
                      _streamModel[index].streamBackground;
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    color: const Color(0xFF0C0D31),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(imgUri), fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * 0.37,
                                  47.0)),
                          label: Text(
                            _streamModel[index].streamName.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          icon: const Icon(Icons.play_arrow),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  );
                }),
      ),
    );
  }
}
