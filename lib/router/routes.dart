import 'package:flutter/material.dart';
import 'package:flutter_application_1/mocks/cars_mock.dart';
import 'package:flutter_application_1/screens/carinfo_screen/carinfo_screen.dart';
import 'package:flutter_application_1/screens/cars_screen/cars_screen.dart';
import 'package:flutter_application_1/screens/home_screen/home_screen.dart';

class Routes {
  static const home = '/';
  static const cars = '/cars';
  static const carInfo = '/carInfo/:carInfo';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case cars:
        return MaterialPageRoute(builder: (_) => const CarsScreen());
      case carInfo:
        final manufacturerDetails = settings.arguments as ManufacturerDetails;
        return MaterialPageRoute(
            builder: (_) => CarInfoScreen(
                  manufacturerDetails: manufacturerDetails,
                ));
      default:
        return MaterialPageRoute(builder: (_) => const Text('unknown route'));
    }
  }
}
