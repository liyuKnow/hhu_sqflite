import 'package:flutter/material.dart';
import 'package:hhu_sqflite/src/screens/screens.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}





// case '/edit_user':
      //   if (args is int) {
      //     return MaterialPageRoute(
      //         builder: (_) => EditUserScreen(
      //               userId: args,
      //             ));
      //   }
      //   return _errorRoute();