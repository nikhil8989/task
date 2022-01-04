import 'package:flutter/material.dart';
import '../../model/photo_model.dart';

class PhotoWidget extends StatelessWidget {
  final PhotoModel photoData;
  const PhotoWidget({
    Key? key,
    required this.photoData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed("imageviewr", arguments: {
          "photodata": photoData,
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: Colors.grey.shade100,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  photoData.thumbnailUrl,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                photoData.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: mediaQueryData.size.height * 0.02,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
