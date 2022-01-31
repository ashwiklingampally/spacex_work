import 'package:hive/hive.dart';

import 'launchsite.dart';
import 'links.dart';
 part 'launch.g.dart';


@HiveType(typeId: 0)
//const String tableLaunches = "launches";

// class LaunchFields {
//   static final List<String> values = [
//     id,
//     details,
//     launchDateUtc,
//     launchSite,
//     launchYear,
//     missionName,
//     links
//   ];

// ignore: prefer_const_declarations
// static final String id = '_id';
// static final String details = 'details';
// static final String launchDateUtc = 'launchDateUtc';
// static final String launchSite = 'launchSite';
// static final String launchYear = 'launchYear';
// static final String missionName = 'missionName';
// static final String links = 'links';
//}

class Launch {
  Launch({
    required this.id,
    required this.details,
    required this.launchDateUtc,
    required this.launchSite,
    required this.launchYear,
    required this.missionName,
    required this.links,
  });

  // Launch copy({
  //   int? id,
  //   String? details,
  //   DateTime? launchDateUtc,
  //   LaunchSite? launchSite,
  //   String? launchYear,
  //   String? missionName,
  //   Links? links,
  // }) =>
  //     Launch(
  //         id: this.id,
  //         details: this.details,
  //         launchDateUtc: this.launchDateUtc,
  //         launchSite: this.launchSite,
  //         launchYear: this.launchYear,
  //         missionName: this.missionName,
  //         links: this.links);
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String details;
  @HiveField(2)
  final DateTime launchDateUtc;
  @HiveField(3)
  final LaunchSite launchSite;
  @HiveField(4)
  final String launchYear;
  @HiveField(5)
  final String missionName;
  @HiveField(6)
  final Links links;

  factory Launch.fromJson(Map<String, dynamic> json) => Launch(
        id: json["id"],
        details: json["details"] ?? "Not Found",
        launchDateUtc: DateTime.parse(json["launch_date_utc"]),
        launchSite: LaunchSite.fromJson(json["launch_site"]),
        launchYear: json["launch_year"],
        missionName: json["mission_name"],
        links: Links.fromJson(json["links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "details": details,
        "launch_date_utc": launchDateUtc.toIso8601String(),
        "launch_site": launchSite.toJson(),
        "launch_year": launchYear,
        "mission_name": missionName,
        "links": links.toJson(),
      };
}
