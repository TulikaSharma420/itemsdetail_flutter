// import 'package:flutter/material.dart';
// class Data {
//     Data({
//         this.launchesPast,
//     });

//     List<LaunchesPast> launchesPast;

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         launchesPast: List<LaunchesPast>.from(json["launchesPast"].map((x) => LaunchesPast.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "launchesPast": List<dynamic>.from(launchesPast.map((x) => x.toJson())),
//     };
// }

// class LaunchesPast {
//     LaunchesPast({
//         this.details,
//         this.missionName,
//         this.launchDateLocal,
//         this.launchSite,
//         this.links,
//     });

//     String details;
//     String missionName;
//     DateTime launchDateLocal;
//     LaunchSite launchSite;
//     Links links;

//     factory LaunchesPast.fromJson(Map<String, dynamic> json) => LaunchesPast(
//         details: json["details"] == null ? null : json["details"],
//         missionName: json["mission_name"],
//         launchDateLocal: DateTime.parse(json["launch_date_local"]),
//         launchSite: LaunchSite.fromJson(json["launch_site"]),
//         links: Links.fromJson(json["links"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "details": details == null ? null : details,
//         "mission_name": missionName,
//         "launch_date_local": launchDateLocal.toIso8601String(),
//         "launch_site": launchSite.toJson(),
//         "links": links.toJson(),
//     };
// }

// class LaunchSite {
//     LaunchSite({
//         this.siteNameLong,
//     });

//     SiteNameLong siteNameLong;

//     factory LaunchSite.fromJson(Map<String, dynamic> json) => LaunchSite(
//         siteNameLong: siteNameLongValues.map[json["site_name_long"]],
//     );

//     Map<String, dynamic> toJson() => {
//         "site_name_long": siteNameLongValues.reverse[siteNameLong],
//     };
// }

// enum SiteNameLong { CAPE_CANAVERAL_AIR_FORCE_STATION_SPACE_LAUNCH_COMPLEX_40, VANDENBERG_AIR_FORCE_BASE_SPACE_LAUNCH_COMPLEX_4_E, KENNEDY_SPACE_CENTER_HISTORIC_LAUNCH_COMPLEX_39_A }

// final siteNameLongValues = EnumValues({
//     "Cape Canaveral Air Force Station Space Launch Complex 40": SiteNameLong.CAPE_CANAVERAL_AIR_FORCE_STATION_SPACE_LAUNCH_COMPLEX_40,
//     "Kennedy Space Center Historic Launch Complex 39A": SiteNameLong.KENNEDY_SPACE_CENTER_HISTORIC_LAUNCH_COMPLEX_39_A,
//     "Vandenberg Air Force Base Space Launch Complex 4E": SiteNameLong.VANDENBERG_AIR_FORCE_BASE_SPACE_LAUNCH_COMPLEX_4_E
// });

// class Links {
//     Links({
//         this.articleLink,
//         this.videoLink,
//     });

//     String articleLink;
//     String videoLink;

//     factory Links.fromJson(Map<String, dynamic> json) => Links(
//         articleLink: json["article_link"] == null ? null : json["article_link"],
//         videoLink: json["video_link"],
//     );

//     Map<String, dynamic> toJson() => {
//         "article_link": articleLink == null ? null : articleLink,
//         "video_link": videoLink,
//     };
// }

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }
