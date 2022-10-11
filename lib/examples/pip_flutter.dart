// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:pip_flutter/pipflutter_player.dart';
import 'package:pip_flutter/pipflutter_player_configuration.dart';
import 'package:pip_flutter/pipflutter_player_controller.dart';
import 'package:pip_flutter/pipflutter_player_data_source.dart';
import 'package:pip_flutter/pipflutter_player_data_source_type.dart';

//! หน้าแรกและปุ่มกดกลางจอ
class PipFlutter extends StatefulWidget {
  const PipFlutter({Key? key}) : super(key: key);

  @override
  State<PipFlutter> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<PipFlutter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picture in Picture Mode'),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PictureInPicturePage()));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.circular(12.0)),
                child: const Text(
                  'Picture in Picture Mode',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//! หลังจากกดปุ่นมาหน้า result
class PictureInPicturePage extends StatefulWidget {
  const PictureInPicturePage({super.key});

  @override
  _PictureInPicturePageState createState() => _PictureInPicturePageState();
}

class _PictureInPicturePageState extends State<PictureInPicturePage> {
  late PipFlutterPlayerController pipFlutterPlayerController;
  final GlobalKey pipFlutterPlayerKey = GlobalKey();

  @override
  void initState() {

    //! กำหนดการตั้งค่า
    PipFlutterPlayerConfiguration pipFlutterPlayerConfiguration =
        const PipFlutterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
    );

    //! กำหนดประเภทที่ต้องการทำ PIP
    PipFlutterPlayerDataSource dataSource = PipFlutterPlayerDataSource(
      PipFlutterPlayerDataSourceType.network,
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    );
    pipFlutterPlayerController =
        PipFlutterPlayerController(pipFlutterPlayerConfiguration);
    pipFlutterPlayerController.setupDataSource(dataSource);
    pipFlutterPlayerController
        .setPipFlutterPlayerGlobalKey(pipFlutterPlayerKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Picture in Picture player"),
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back_ios,color: Colors.white,)),
      ),
      body: Column(
        children: [
          //! Result Video
          const SizedBox(height: 20),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: PipFlutterPlayer(
                controller: pipFlutterPlayerController,
                key: pipFlutterPlayerKey,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.circular(12.0)),
                      child: const Center(child: Text("Show PiP",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
                  onTap: () {
                    pipFlutterPlayerController
                        .enablePictureInPicture(pipFlutterPlayerKey);
                  },
                ),
                InkWell(
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      padding: const EdgeInsets.all(8.0),
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(color: Colors.pink,borderRadius: BorderRadius.circular(12.0)),
                      child: const Center(child: Text("Disable PiP",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
                  onTap: () async {
                    pipFlutterPlayerController.disablePictureInPicture();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

