class Photo {
  late int id;
  late String pageUrl;
  late String type;
  late String tags;
  late String previewUrl;
  late int previewWidth;
  late int previewHeight;
  late String webformatUrl;
  late int webformatWidth;
  late int webformatHeight;
  late String largeImageUrl;
  late int imageWidth;
  late int imageHeight;
  late int imageSize;
  late int views;
  late int downloads;
  late int collections;
  late int likes;
  late int comments;
  late int userId;
  late String user;
  late String userImageUrl;

  Photo({
    required this.id,
    required this.pageUrl,
    required this.type,
    required this.tags,
    required this.previewUrl,
    required this.previewWidth,
    required this.previewHeight,
    required this.webformatUrl,
    required this.webformatWidth,
    required this.webformatHeight,
    required this.largeImageUrl,
    required this.imageWidth,
    required this.imageHeight,
    required this.imageSize,
    required this.views,
    required this.downloads,
    required this.collections,
    required this.likes,
    required this.comments,
    required this.userId,
    required this.user,
    required this.userImageUrl,
  });

  Photo.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["pageURL"] is String) {
      pageUrl = json["pageURL"];
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["tags"] is String) {
      tags = json["tags"];
    }
    if (json["previewURL"] is String) {
      previewUrl = json["previewURL"];
    }
    if (json["previewWidth"] is int) {
      previewWidth = json["previewWidth"];
    }
    if (json["previewHeight"] is int) {
      previewHeight = json["previewHeight"];
    }
    if (json["webformatURL"] is String) {
      webformatUrl = json["webformatURL"];
    }
    if (json["webformatWidth"] is int) {
      webformatWidth = json["webformatWidth"];
    }
    if (json["webformatHeight"] is int) {
      webformatHeight = json["webformatHeight"];
    }
    if (json["largeImageURL"] is String) {
      largeImageUrl = json["largeImageURL"];
    }
    if (json["imageWidth"] is int) {
      imageWidth = json["imageWidth"];
    }
    if (json["imageHeight"] is int) {
      imageHeight = json["imageHeight"];
    }
    if (json["imageSize"] is int) {
      imageSize = json["imageSize"];
    }
    if (json["views"] is int) {
      views = json["views"];
    }
    if (json["downloads"] is int) {
      downloads = json["downloads"];
    }
    if (json["collections"] is int) {
      collections = json["collections"];
    }
    if (json["likes"] is int) {
      likes = json["likes"];
    }
    if (json["comments"] is int) {
      comments = json["comments"];
    }
    if (json["user_id"] is int) {
      userId = json["user_id"];
    }
    if (json["user"] is String) {
      user = json["user"];
    }
    if (json["userImageURL"] is String) {
      userImageUrl = json["userImageURL"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["pageURL"] = pageUrl;
    data["type"] = type;
    data["tags"] = tags;
    data["previewURL"] = previewUrl;
    data["previewWidth"] = previewWidth;
    data["previewHeight"] = previewHeight;
    data["webformatURL"] = webformatUrl;
    data["webformatWidth"] = webformatWidth;
    data["webformatHeight"] = webformatHeight;
    data["largeImageURL"] = largeImageUrl;
    data["imageWidth"] = imageWidth;
    data["imageHeight"] = imageHeight;
    data["imageSize"] = imageSize;
    data["views"] = views;
    data["downloads"] = downloads;
    data["collections"] = collections;
    data["likes"] = likes;
    data["comments"] = comments;
    data["user_id"] = userId;
    data["user"] = user;
    data["userImageURL"] = userImageUrl;
    return data;
  }
}
