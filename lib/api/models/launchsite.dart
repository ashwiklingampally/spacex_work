import 'package:hive/hive.dart';
part 'launchsite.g.dart';

@HiveType(typeId: 1)
class LaunchSite {
  LaunchSite({
    required this.siteId,
    required this.siteName,
    required this.siteNameLong,
  });
  @HiveField(0)
  String siteId;
  @HiveField(1)
  String siteName;
  @HiveField(2)
  String siteNameLong;

  factory LaunchSite.fromJson(Map<String, dynamic> json) => LaunchSite(
        siteId: json["site_id"],
        siteName: json["site_name"],
        siteNameLong: json["site_name_long"],
      );

  Map<String, dynamic> toJson() => {
        "site_id": siteId,
        "site_name": siteName,
        "site_name_long": siteNameLong,
      };
}
