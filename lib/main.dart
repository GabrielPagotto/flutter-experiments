import 'package:flutter/material.dart';
import 'package:flutter_experiments/routes.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: Routes.initialRoute,
      onGenerateRoute: Routes.onGenerateRoute,
      onGenerateInitialRoutes: Routes.onGenerateInitialRoutes,
    );
  }
}
