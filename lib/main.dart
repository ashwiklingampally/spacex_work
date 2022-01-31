import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive/hive.dart';
import 'package:spacex_work/api/models/launch.dart';
import 'package:spacex_work/api/models/links.dart';
import 'package:spacex_work/api/models/launchsite.dart';

// ignore: library_prefixes
import 'package:path_provider/path_provider.dart' as pathProvider;

import 'api/models/launch.dart';
import 'app.dart';
import 'home/bloc/home_bloc.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //hive related
  Directory directory = await pathProvider.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(LaunchAdapter());
  Hive.registerAdapter(LaunchSiteAdapter());

  Hive.registerAdapter(LinksAdapter());
  setPathUrlStrategy();
  // ignore: prefer_const_constructors
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(),
      ),
    ], child: const MyApp()),
  );
}
