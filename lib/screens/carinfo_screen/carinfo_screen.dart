import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/mocks/cars_mock.dart';
import 'package:flutter_application_1/shared/widgets/main_layout.dart';

class CarInfoScreen extends StatelessWidget {
  final ManufacturerDetails manufacturerDetails;

  const CarInfoScreen({super.key, required this.manufacturerDetails});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        screenTitle: manufacturerDetails.manufacturer,
        body: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            Hero(
              tag: manufacturerDetails.manufacturer,
              child: CachedNetworkImage(
                imageUrl: manufacturerDetails.image,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${manufacturerDetails.manufacturer} details',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              manufacturerDetails.description,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ));
  }
}
