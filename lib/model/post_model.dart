class PostModel {
  int userId;
  int id;
  String title;
  String body;

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  static PostModel fromJson(final json) => PostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  static List<PostModel> getPostList(final jsonList) {
    List<PostModel> postList = [];
    for (var i in jsonList) {
      postList.add(fromJson(i));
    }
    return postList;
  }
}
