import 'package:flutter/material.dart';
import 'package:flutter_sample/ui/component/route_button.dart';

import '../util/routes.dart';

class PackageSampleScreen extends StatelessWidget {
  const PackageSampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Package Sample'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: packageRoutes
            .map((e) => RouteButton(route: e))
            .toList(),
      ),
    );
  }
}