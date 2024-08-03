import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import 'package:tflite_v2/tflite_v2.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LeafScan extends StatefulWidget {
  final String modelName;
  const LeafScan({super.key, required this.modelName});

  @override
  // ignore: no_logic_in_create_state
  State<LeafScan> createState() => _LeafScanState(modelName);
}

class _LeafScanState extends State<LeafScan> {
  String modelName;
  _LeafScanState(this.modelName);

  File? pickedImage;
  bool isButtonPressedCamera = false;
  bool isButtonPressedGallery = false;
  Color backgroundColor = const Color(0xffe9edf1);
  Color secondaryColor = const Color(0xffe1e6ec);
  Color accentColor = const Color(0xff2d5765);

  List? results;
  String confidence = "";
  String name = "";
  String crop_name = "";
  String disease_name = "";
  String disease_url = "";
  bool result_visibility = false;
  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      } else {
        final imageTemporary = File(image.path);
        setState(() {
          pickedImage = imageTemporary;
          applyModelOnImage(pickedImage!);
          result_visibility = true;
          isButtonPressedCamera = false;
          isButtonPressedGallery = false;
        });
      }
    } on PlatformException {
      // print("Failed to pick image: $e");
    }
  }

  applyModelOnImage(File file) async {
    var res = await Tflite.runModelOnImage(
        path: file.path,
        numResults: 2,
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5);

    setState(() {
      results = res!;
      // print(results);
      String str = results![0]["label"];
      name = str.substring(2);
      confidence = results != null
          ? (results![0]["confidence"] * 100.0).toString().substring(0, 5) + "%"
          : "";
      // print(name);
      // print(confidence);
      split_model_result();
    });
  }

  void split_model_result() {
    List temp = name.split(' ');
    crop_name = temp[0];
    temp.removeAt(0);
    disease_name = temp.join(' ');
    // print(crop_name);
    // print(disease_name);
  }

  String ModelPathSelector() {
    if (modelName.toLowerCase() == "apple") {
      return 'models/Apple';
    } else if (modelName.toLowerCase() == "bellpepper") {
      return 'models/BellPepper';
    } else if (modelName.toLowerCase() == "cherry") {
      return 'models/Cherry';
    } else if (modelName.toLowerCase() == "corn") {
      return 'models/Corn';
    } else if (modelName.toLowerCase() == "grape") {
      return 'models/Grape';
    } else if (modelName.toLowerCase() == "peach") {
      return 'models/Peach';
    } else if (modelName.toLowerCase() == "potato") {
      return 'models/Potato';
    } else if (modelName.toLowerCase() == "rice") {
      return 'models/Rice';
    } else if (modelName.toLowerCase() == "tomato") {
      return 'models/Tomato';
    } else {
      return "";
    }
  }

  void closeModel() async {
    await Tflite.close();
  }

  void buttonPressedCamera() {
    setState(() {
      isButtonPressedCamera = !isButtonPressedCamera;
      getImage(ImageSource.camera);
    });
  }

  void buttonPressedGallery() {
    setState(() {
      isButtonPressedGallery = !isButtonPressedGallery;
      getImage(ImageSource.gallery);
    });
  }

  loadModel() async {
    String modelPath = ModelPathSelector();
    // print(modelPath);
    // ignore: unused_local_variable
    var resultant = await Tflite.loadModel(
        model: modelPath + "/model_unquant.tflite",
        labels: modelPath + "/labels.txt");

    // print("Result after loading model: $resultant");
  }

  @override
  void initState() {
    super.initState();
    // print(modelName);
    loadModel().then((val) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    closeModel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: pickedImage != null
                    ? Image.file(
                        pickedImage!,
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      )
                    : LottieBuilder.asset(
                        'assets/39771-farm.json',
                        width: 300,
                        height: 300,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    elevation: 2,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)))),
                        onPressed: buttonPressedCamera,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                                child: Icon(
                              Icons.camera_alt,
                            )),
                            Text(
                              "Camera",
                              style: TextStyle(
                                overflow: TextOverflow.clip,
                                //    color: Colors.greenAccent.shade200,
                                fontSize: 25,
                                fontFamily: 'odibeeSans',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(),
                  Card(
                    elevation: 2,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(5)))),
                        onPressed: buttonPressedGallery,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(child: Icon(Icons.image)),
                            Text(
                              "Gallery",
                              style: TextStyle(
                                overflow: TextOverflow.clip,
                                fontSize: 25,
                                fontFamily: 'odibeeSans',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: !result_visibility,
              child: Flexible(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.camera_alt_rounded,
                              size: 15,
                              color: Colors.greenAccent.shade200,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: Text(
                                "Select an image of the plant's leaf to view the results",
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.greenAccent.shade200,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              color: Colors.greenAccent.shade200,
                              Icons.light_mode_rounded,
                              size: 15,
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                left: 5,
                              ),
                              child: Text(
                                'The image must be well lit and clear',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.greenAccent.shade200,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.hide_image_rounded,
                              size: 15,
                              color: Colors.greenAccent.shade200,
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                                child: Text(
                                  "Images other than the specific plant's leaves may lead to inaccurate results",
                                  softWrap: true,
                                  maxLines: 10,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.greenAccent.shade200,
                                  ),
                                  // textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: result_visibility,
              child: Expanded(
                child: GestureDetector(
                  onTap: () async {
                    if (disease_name.toLowerCase() != "healthy") {
                      disease_url = "https://www.google.com/search?q=" +
                          modelName +
                          '+' +
                          disease_name.replaceAll(' ', '+');
                      Uri url = Uri.parse(disease_url);
                      await launchUrl(url, mode: LaunchMode.inAppWebView);
                    } else {
                      disease_url = "https://www.google.com/search?q=" +
                          modelName +
                          '+' +
                          'plant+care+tips';
                      Uri url = Uri.parse(disease_url);
                      await launchUrl(url, mode: LaunchMode.inAppWebView);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(50, 10, 50, 20),
                            child: Text(
                              disease_name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Confidence : ' + confidence,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.info_rounded,
                                      size: 15,
                                      color: Colors.greenAccent.shade200,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 5,
                                      ),
                                      child: Text(
                                        disease_name.toLowerCase() != "healthy"
                                            ? 'Tap on this card to read more about this disease'
                                            : 'Tap on this card for ' +
                                                modelName +
                                                ' plant care tips',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.greenAccent.shade200,
                                        ),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ]),
    ));
  }
}
