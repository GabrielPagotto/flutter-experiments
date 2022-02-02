import 'package:flutter/material.dart';
import 'package:flutter_experiments/exp/riverpod/views/countermessage/countermessage_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RiverpodRoutes {
  static WidgetBuilder? getWidgetBuilder(Uri uri) {
    if (uri.pathSegments.length == 1) {
      return (context) => ProviderScope(child: CounterMessageView());
    }
  }
}
