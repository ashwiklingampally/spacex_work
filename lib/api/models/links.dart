import 'package:hive/hive.dart';
part 'links.g.dart';
@HiveType(typeId: 2)
class Links {
  Links({
    required this.flickrImages,
    required this.wikipedia,
  });
  @HiveField(0)
  List<String> flickrImages;
  @HiveField(1)
  String wikipedia;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        flickrImages: List<String>.from(json["flickr_images"].map((x) => x)),
        wikipedia: json["wikipedia"] ?? "Not Available",
      );

  Map<String, dynamic> toJson() => {
        "flickr_images": List<dynamic>.from(flickrImages.map((x) => x)),
        "wikipedia": wikipedia,
      };
}
