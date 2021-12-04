import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inframe/color_constants.dart';

class PGManageGallery extends StatefulWidget {
  const PGManageGallery({Key? key}) : super(key: key);

  @override
  State<PGManageGallery> createState() => _PGManageGalleryState();
}

class _PGManageGalleryState extends State<PGManageGallery> {
  File? _image;
  late final _picker = ImagePicker();

  Future getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(
      () {
        if (image != null) {
          _image = File(image.path);
        } else {
          // ignore: avoid_print
          print('No image selected.');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    color: kMain,
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 80)),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 10),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white)),
                  ),
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: EdgeInsets.only(
                        top: 70,
                      ),
                      child: Text(
                        "Manage Equipments",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            _image == null
                ? IconButton(
                    icon: const Icon(Icons.add_box_outlined),
                    color: kMain,
                    iconSize: 100.0,
                    onPressed: () {
                      getImage();
                    },
                  )
                : Stack(
                    children: <Widget>[
                      SizedBox(
                        width: 250.0,
                        height: 320.0,
                        child: Image.file(_image!),
                      ),
                      Positioned(
                        right: 5.0,
                        child: InkWell(
                          child: const Icon(
                            Icons.remove_circle,
                            size: 30,
                            color: Colors.red,
                          ),
                          onTap: () {
                            setState(
                              () {
                                _image = null;
                              },
                            );
                          },
                        ),
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
