import 'package:flutter/material.dart';

import '../model/photo_model.dart';

class ImageViewerScreen extends StatelessWidget {
  const ImageViewerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final arguments = ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final photoData = arguments["photodata"] as PhotoModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          photoData.title,
        ),
      ),
      backgroundColor: Colors.black,
      body: InteractiveViewer(
        child: SizedBox(
          height: (mediaQueryData.size.height - mediaQueryData.padding.top),
          width: mediaQueryData.size.width,
          child: Image.network(
            photoData.url,
          ),
        ),
      ),
    );
  }
}
