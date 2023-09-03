import 'package:flutter/material.dart';
import 'package:flutter_application_1/mocks/cars_mock.dart';
import 'package:flutter_application_1/screens/cars_screen/widgets/car_card.dart';
import 'package:flutter_application_1/shared/widgets/main_layout.dart';

class CarsScreen extends StatelessWidget {
  const CarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      screenTitle: 'Cars',
      body: ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: carsMock.length,
          itemBuilder: (context, index) {
            return CarCard(manufacturerDetails: carsMock[index]);
          }),
    );
  }
}
