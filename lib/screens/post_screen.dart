import 'package:flutter/material.dart';

import '../model/post_model.dart';
import '../services/api_controller.dart';

import './widgets/post_widget.dart';
import './widgets/post_detail_widget.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  bool isLoding = false;
  List<PostModel> postList = [];

  @override
  void initState() {
    super.initState();
    getPost();
  }

  void getPost() async {
    final response = await ApiController.getPostList();
    if (response.status) {
      setState(() {
        isLoding = true;
        postList = response.data as List<PostModel>;
      });
    }
  }

  void showPostDetail(int id) {
    showDialog(
      context: context,
      builder: (context) {
        final mediaQueryData = MediaQuery.of(context);
        return Dialog(
          child: PostDetailWidget(
            id: id,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Visibility(
      visible: isLoding,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        child: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => showPostDetail(postList[index].id),
              child: PostWidget(
                postData: postList[index],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 10,
            );
          },
          itemCount: postList.length,
        ),
      ),
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
