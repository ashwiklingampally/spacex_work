import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spacex_work/api/models/launch.dart';
import 'package:spacex_work/route/route_delegate.dart';
import 'package:spacex_work/route/route_handeler.dart';

class LaunchItem extends StatelessWidget {
  final Launch launch;
  const LaunchItem(this.launch, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppRouterDelegate().setPathName(RouteData.detail.name, aargs: launch);
      },
      child: Container(
        margin: const EdgeInsets.only(
          left: 5,
          right: 5,
          top: 3,
          bottom: 3,
        ),
        width: double.infinity,
        height: 180,
        color: const Color(0xFF4F3C48),
        child: Stack(
          children: [
            CachedNetworkImage(
              fit: BoxFit.fill,
              width: double.infinity,
              imageUrl: launch.links.flickrImages.isEmpty
                  ? "https://cdn.shopify.com/s/files/1/0173/8204/7844/articles/SpaceX-Tesmanian_1800x.jpg?v=1592622401"
                  : launch.links.flickrImages[0],
              placeholder: (context, url) => Container(
                padding: const EdgeInsets.all(10),
                child: const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.grey),
                  ),
                ),
              ),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(launch.missionName,
                  style: GoogleFonts.actor(
                      color: const Color(0xFF9E788F),
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
