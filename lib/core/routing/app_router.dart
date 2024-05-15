import 'package:flutter/material.dart';
import 'package:social_app/features/register/presentation/pages/register_page.dart';

import '../../features/feeds/presentation/pages/feeds_screen.dart';
import '../../features/login/presentation/pages/login_page.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.loginPage:
        return MaterialPageRoute(
          builder: (_) => const LoginPage()
        );
      case Routes.registerPage:
        return MaterialPageRoute(builder: (_)=>const RegisterPage()
        );
      case Routes.feedsScreen:
        return MaterialPageRoute(builder: (_)=>FeedsScreen()
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}