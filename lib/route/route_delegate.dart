import 'package:flutter/material.dart';
import 'package:spacex_work/detail/launchdetail.dart';
import 'package:spacex_work/home/homescreen.dart';
import 'package:spacex_work/route/route_handeler.dart';
import 'package:spacex_work/route/route_path.dart';
import 'package:spacex_work/unknown/unknown.dart';
import 'custom_navigation_key.dart';
import 'custom_transition_delegate.dart';

/// AppRouterDelegate includes the parsed result from RoutesInformationParser
class AppRouterDelegate extends RouterDelegate<RoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePath> {
  static final AppRouterDelegate _instance = AppRouterDelegate._();
  String? pathName;
  dynamic args;
  bool isError = false;

  factory AppRouterDelegate() {
    return _instance;
  }
  AppRouterDelegate._();

  // A custom trasition delegate to overwrite the default animation.
  TransitionDelegate transitionDelegate = CustomTransitionDelegate();

  /// Keeps the app stack
  late List<Page> _stack = [];

  /// currentConfiguration detects a route information may have changed as a result of rebuild.
  @override
  RoutePath get currentConfiguration {
    if (isError) {
      return RoutePath.unknown();
    }
    if (pathName == null) return RoutePath.home('splash'); //main

    return RoutePath.otherPage(pathName);
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey =>
      CustomNavigationKeys.navigatorKey;

  /// App Stack - Profile screen and other known and unknown routes
  List<Page> get _homeStack => [
        const MaterialPage(
          key: ValueKey('home'),
          child: HomeScreen(
              // routeName: args,
              ),
        )
      ];

  /// Auth route
  List<Page> get _detailStack => [
        MaterialPage(
          key: const ValueKey('detail'),
          child: LaunchDetail(
            launch: args,
            // routeName: pathName ?? RouteData.home.name,
          ),
        ),
      ];

  /// UnKnownRoute Stack
  List<Page> get _unknownRoute => [
        const MaterialPage(
          key: ValueKey('unknown'),
          child: UnknownRoute(),
        )
      ];

  @override
  Widget build(BuildContext context) {
    if (pathName == RouteData.home.name) {
      _stack = _homeStack;
    } else if (pathName == RouteData.detail.name) {
      _stack = _detailStack;
    } else {
      _stack = _homeStack;
    }

    return Navigator(
      transitionDelegate: transitionDelegate,
      key: navigatorKey,
      pages: _stack,
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        pathName = null;
        // isError = false;
        notifyListeners();
        return true;
      },
    );
  }

  /// setNewRoutePath is called when a new route has been pushed to the application.
  @override
  Future<void> setNewRoutePath(RoutePath configuration) async {
    pathName = configuration.pathName;

    if (configuration.isOtherPage) {
      if (configuration.pathName != null) {
        /// If logged in
        if (configuration.pathName == RouteData.home.name) {
          pathName = RouteData.home.name;
          isError = false;
        } else if (configuration.pathName == RouteData.detail.name) {
          pathName =
              // ? configuration.pathName
              // :
              RouteData.detail.name;
          isError = false;
        }
      } else {
        pathName = configuration.pathName;
        isError = false;
      }
    } else {
      pathName = "/";
    }
    notifyListeners();
  }

  /// setPathName  sets url path
  void setPathName(
    String path, {
    dynamic aargs,
  }) {
    pathName = path;
    args = aargs;
    setNewRoutePath(RoutePath.otherPage(pathName));
    notifyListeners();
  }
}
