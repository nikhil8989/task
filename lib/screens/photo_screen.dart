import 'package:flutter/material.dart';

import '../model/photo_model.dart';
import '../services/api_controller.dart';

import './widgets/photo_widget.dart';

class PhotoScreen extends StatefulWidget {
  const PhotoScreen({Key? key}) : super(key: key);

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  bool isPhotoLoded = false;
  List<PhotoModel> photList = [];

  @override
  void initState() {
    super.initState();
    getPhoto();
  }

  void getPhoto() async {
    final response = await ApiController.getPhotoList();
    if (response.status) {
      if (mounted) {
        setState(() {
          isPhotoLoded = true;
          photList = response.data as List<PhotoModel>;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Visibility(
      visible: isPhotoLoded,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 10,
          left: 10,
        ),
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            ...photList.map(
              (e) => PhotoWidget(photoData: e),
            )
          ],
        ),
      ),
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
