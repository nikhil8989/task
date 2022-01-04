import 'package:flutter/material.dart';

import './video_widget.dart';

class VideoListWidget extends StatelessWidget {
  const VideoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return SizedBox(
      width: mediaQueryData.size.width,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Fetured Video",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: mediaQueryData.size.height * 0.03,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: (mediaQueryData.size.height - mediaQueryData.padding.top) * 0.2,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const VideoWidget();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 20,
                  );
                },
                itemCount: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
