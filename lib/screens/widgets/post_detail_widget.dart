import 'package:flutter/material.dart';

import '../../model/api_response_model.dart';
import '../../model/post_model.dart';
import '../../services/api_controller.dart';

class PostDetailWidget extends StatelessWidget {
  final int id;
  const PostDetailWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Container(
      height: (mediaQueryData.size.height - mediaQueryData.padding.top) * 0.5,
      width: mediaQueryData.size.width * 0.85,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(mediaQueryData.size.height * 0.02),
      ),
      child: FutureBuilder(
        future: ApiController.getPostDetail(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (!snapshot.hasError && snapshot.hasData) {
              final response = snapshot.data as ApiResponseModel;
              final postData = response.data as PostModel;
              return Column(
                children: [
                  Text(
                    postData.title,
                    style: TextStyle(
                      fontSize: mediaQueryData.size.height * 0.03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    postData.body,
                    style: TextStyle(
                      fontSize: mediaQueryData.size.height * 0.02,
                    ),
                  ),
                ],
              );
            } else {
              return const Text("Somthing went wrong");
            }
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
