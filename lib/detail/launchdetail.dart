import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spacex_work/api/models/launch.dart';
import 'package:spacex_work/route/route_delegate.dart';
import 'package:spacex_work/route/route_handeler.dart';

class LaunchDetail extends StatefulWidget {
  final dynamic launch;
  const LaunchDetail({
    this.launch,
    Key? key,
  }) : super(key: key);

  State<LaunchDetail> createState() => _LaunchDetailState();
}

class _LaunchDetailState extends State<LaunchDetail> {
  @override
  Widget build(BuildContext context) {
    Launch local = widget.launch;
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          AppRouterDelegate().setPathName(
            RouteData.home.name,
          );
          return false;
        },
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              color: const Color(0xFF4F3C48),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.fill,
                    width: double.infinity,
                    imageUrl: local.links.flickrImages.isEmpty
                        ? "https://cdn.shopify.com/s/files/1/0173/8204/7844/articles/SpaceX-Tesmanian_1800x.jpg?v=1592622401"
                        : local.links.flickrImages[0],
                    placeholder: (context, url) => Container(
                      padding: const EdgeInsets.all(10),
                      child: const Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.grey),
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.ac_unit_outlined),
                  ),
                  GestureDetector(
                    onTap: () => AppRouterDelegate().setPathName(
                      RouteData.home.name,
                    ),
                    child: Container(
                      padding:const EdgeInsets.all(8),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(local.missionName,
                  style: GoogleFonts.actor(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Text("${local.launchSite.siteName} - ${local.launchYear}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(local.details,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
        )),
      ),
    );
  }
}
