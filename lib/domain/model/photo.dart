import 'dart:convert';

import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  final int id;
  final String pageURL;
  final String type;
  final String tags;
  final String previewURL;
  final int previewWidth;
  final int previewHeight;
  final String webformatURL;
  final int webformatWidth;
  final int webformatHeight;
  final String largeImageURL;
  final int imageWidth;
  final int imageHeight;
  final int imageSize;
  final int views;
  final int downloads;
  final int collections;
  final int likes;
  final int comments;
  final int userId;
  final String user;
  final String userImageURL;
  const Photo({
    required this.id,
    required this.pageURL,
    required this.type,
    required this.tags,
    required this.previewURL,
    required this.previewWidth,
    required this.previewHeight,
    required this.webformatURL,
    required this.webformatWidth,
    required this.webformatHeight,
    required this.largeImageURL,
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
    required this.userImageURL,
  });

  @override
  List<Object> get props {
    return [
      id,
      pageURL,
      type,
      tags,
      previewURL,
      previewWidth,
      previewHeight,
      webformatURL,
      webformatWidth,
      webformatHeight,
      largeImageURL,
      imageWidth,
      imageHeight,
      imageSize,
      views,
      downloads,
      collections,
      likes,
      comments,
      userId,
      user,
      userImageURL,
    ];
  }

  @override
  String toString() {
    return 'Photo(id: $id, pageURL: $pageURL, type: $type, tags: $tags, previewURL: $previewURL, previewWidth: $previewWidth, previewHeight: $previewHeight, webformatURL: $webformatURL, webformatWidth: $webformatWidth, webformatHeight: $webformatHeight, largeImageURL: $largeImageURL, imageWidth: $imageWidth, imageHeight: $imageHeight, imageSize: $imageSize, views: $views, downloads: $downloads, collections: $collections, likes: $likes, comments: $comments, userId: $userId, user: $user, userImageURL: $userImageURL)';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'pageURL': pageURL,
      'type': type,
      'tags': tags,
      'previewURL': previewURL,
      'previewWidth': previewWidth,
      'previewHeight': previewHeight,
      'webformatURL': webformatURL,
      'webformatWidth': webformatWidth,
      'webformatHeight': webformatHeight,
      'largeImageURL': largeImageURL,
      'imageWidth': imageWidth,
      'imageHeight': imageHeight,
      'imageSize': imageSize,
      'views': views,
      'downloads': downloads,
      'collections': collections,
      'likes': likes,
      'comments': comments,
      'userId': userId,
      'user': user,
      'userImageURL': userImageURL,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      id: map['id']?.toInt() ?? 0,
      pageURL: map['pageURL'] ?? '',
      type: map['type'] ?? '',
      tags: map['tags'] ?? '',
      previewURL: map['previewURL'] ?? '',
      previewWidth: map['previewWidth']?.toInt() ?? 0,
      previewHeight: map['previewHeight']?.toInt() ?? 0,
      webformatURL: map['webformatURL'] ?? '',
      webformatWidth: map['webformatWidth']?.toInt() ?? 0,
      webformatHeight: map['webformatHeight']?.toInt() ?? 0,
      largeImageURL: map['largeImageURL'] ?? '',
      imageWidth: map['imageWidth']?.toInt() ?? 0,
      imageHeight: map['imageHeight']?.toInt() ?? 0,
      imageSize: map['imageSize']?.toInt() ?? 0,
      views: map['views']?.toInt() ?? 0,
      downloads: map['downloads']?.toInt() ?? 0,
      collections: map['collections']?.toInt() ?? 0,
      likes: map['likes']?.toInt() ?? 0,
      comments: map['comments']?.toInt() ?? 0,
      userId: map['userId']?.toInt() ?? 0,
      user: map['user'] ?? '',
      userImageURL: map['userImageURL'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) => Photo.fromMap(json.decode(source));

  Photo copyWith({
    int? id,
    String? pageURL,
    String? type,
    String? tags,
    String? previewURL,
    int? previewWidth,
    int? previewHeight,
    String? webformatURL,
    int? webformatWidth,
    int? webformatHeight,
    String? largeImageURL,
    int? imageWidth,
    int? imageHeight,
    int? imageSize,
    int? views,
    int? downloads,
    int? collections,
    int? likes,
    int? comments,
    int? userId,
    String? user,
    String? userImageURL,
  }) {
    return Photo(
      id: id ?? this.id,
      pageURL: pageURL ?? this.pageURL,
      type: type ?? this.type,
      tags: tags ?? this.tags,
      previewURL: previewURL ?? this.previewURL,
      previewWidth: previewWidth ?? this.previewWidth,
      previewHeight: previewHeight ?? this.previewHeight,
      webformatURL: webformatURL ?? this.webformatURL,
      webformatWidth: webformatWidth ?? this.webformatWidth,
      webformatHeight: webformatHeight ?? this.webformatHeight,
      largeImageURL: largeImageURL ?? this.largeImageURL,
      imageWidth: imageWidth ?? this.imageWidth,
      imageHeight: imageHeight ?? this.imageHeight,
      imageSize: imageSize ?? this.imageSize,
      views: views ?? this.views,
      downloads: downloads ?? this.downloads,
      collections: collections ?? this.collections,
      likes: likes ?? this.likes,
      comments: comments ?? this.comments,
      userId: userId ?? this.userId,
      user: user ?? this.user,
      userImageURL: userImageURL ?? this.userImageURL,
    );
  }
}
