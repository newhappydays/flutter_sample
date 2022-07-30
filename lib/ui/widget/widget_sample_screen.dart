import 'package:flutter/material.dart';
import 'package:flutter_sample/ui/util/routes.dart';

import '../component/route_button.dart';

class WidgetSampleScreen extends StatelessWidget {
  const WidgetSampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget Sample'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widgetRoutes
            .map((e) => RouteButton(route: e))
            .toList(),
      ),
    );
  }
}
