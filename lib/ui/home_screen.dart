import 'package:flutter/material.dart';
import 'package:flutter_sample/ui/util/routes.dart';

import 'component/route_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: appRoutes
            .map((e) => RouteButton(route: e))
            .toList(),
      ),
    );
  }
}
