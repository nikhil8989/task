class PhotoModel {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  PhotoModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  static PhotoModel fromJson(final json) => PhotoModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  static List<PhotoModel> getPhotoList(final jsonList) {
    List<PhotoModel> photoList = [];
    for (var i in jsonList) {
      photoList.add(fromJson(i));
    }
    return photoList;
  }
}
