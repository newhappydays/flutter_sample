import 'package:flutter/material.dart';
import '../util/routes.dart';

class RouteButton extends StatelessWidget {
  RouteInfo route;

  RouteButton({
    Key? key,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
        ),
        onPressed: () {
          Navigator.pushNamed(context, route.routeName);
        },
        child: Text(
          route.routeTitle,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
