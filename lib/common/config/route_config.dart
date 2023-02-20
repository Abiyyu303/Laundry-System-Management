import 'package:flutter/material.dart';
import 'package:loundry_apps_01_23/common/common.dart';
import 'package:loundry_apps_01_23/ui/ui.dart';

class RouteConfig {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    final dynamic args = routeSettings.arguments;
    switch (routeSettings.name) {
      case RouteName.splash:
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: args,
          ),
          builder: (_) => const SplashScreen(),
        );
      case RouteName.login:
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: args,
          ),
          builder: (_) => const LoginScreen(),
        );
      case RouteName.register:
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: args,
          ),
          builder: (_) => const RegisterScreen(),
        );
      case RouteName.home:
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: args,
          ),
          builder: (_) => const HomeScreen(),
        );
      case RouteName.product:
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: args,
          ),
          builder: (_) => const ProductScreen(),
        );
      case RouteName.payment:
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: args,
          ),
          builder: (_) => const PaymentScreen(),
        );
      case RouteName.history:
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: args,
          ),
          builder: (_) => const HistoryScreen(),
        );
      case RouteName.historyDetail:
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: args,
          ),
          builder: (_) => const HistoryDetailScreen(),
        );
      case RouteName.customerCare:
        return MaterialPageRoute(
          settings: RouteSettings(
            arguments: args,
          ),
          builder: (_) => const CustomerCareScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Halaman Tidak Ditemukan'),
            ),
          ),
        );
    }
  }
}
