import 'package:flutter/material.dart';
import 'package:spacex_work/route/route_delegate.dart';
import 'package:spacex_work/route/route_information_parser.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // root of  application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'SpaceX',
      routeInformationParser: RoutesInformationParser(),
      routerDelegate: AppRouterDelegate(),
    );
  }
}
