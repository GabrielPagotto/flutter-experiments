import 'package:flutter/material.dart';
import 'package:flutter_experiments/exp/riverpod/views/routes.dart';
import 'package:flutter_experiments/initial.dart';

class Routes {
  static const String initialRoute = '/initial';

  static const String host = 'http://0.0.0.0:0000';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    WidgetBuilder? builder;
    final Uri? uri = Uri.tryParse(host + (settings.name ?? ''));

    switch (uri?.path) {
      case '/initial':
        builder = (context) => const InitialView();
        break;

      case '/riverpod':
        builder = RiverpodRoutes.getWidgetBuilder(uri!);
        break;

      default:
    }

    return MaterialPageRoute(builder: builder ?? (context) => Container(), settings: settings);
  }

  static List<Route<dynamic>> onGenerateInitialRoutes(String name) {
    final List<Route<dynamic>> routes = <Route<dynamic>>[];
    final RouteSettings routeSettings = RouteSettings(name: name);
    final Route<dynamic> createdRoute = onGenerateRoute(routeSettings);
    routes.add(createdRoute);
    return routes;
  }
}
