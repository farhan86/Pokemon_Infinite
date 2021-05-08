import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_infinite/presentation/screens/home_screen/details_screen.dart';
import '../../core/constants/strings.dart';
import '../../core/exceptions/route_exception.dart';
import '../screens/home_screen/home_screen.dart';

class AppRouter {
  static const String home = '/';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case '/details':
        return MaterialPageRoute(
          builder: (_) => DetailsScreen(
            id: args,
          ),
        );

      default:
        throw const RouteException('Route not found!');
    }
  }
}
