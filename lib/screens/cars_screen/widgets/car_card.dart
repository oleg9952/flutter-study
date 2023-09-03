import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/mocks/cars_mock.dart';
import 'package:flutter_application_1/router/routes.dart';

class CarCard extends StatelessWidget {
  final ManufacturerDetails manufacturerDetails;

  const CarCard({
    super.key,
    required this.manufacturerDetails,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Navigator.pushNamed(context, Routes.carInfo),
      onTap: () => Navigator.of(context)
          .pushNamed(Routes.carInfo, arguments: manufacturerDetails),
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(bottom: 20),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            // color: Colors.blue.shade100,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ]),
        child: Row(
          children: [
            Hero(
              tag: manufacturerDetails.manufacturer,
              child: CachedNetworkImage(
                imageUrl: manufacturerDetails.image,
                placeholder: (_, url) => const Placeholder(),
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                // color: Colors.grey.shade200,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                ),
                child: Center(
                    child: Text(
                  manufacturerDetails.manufacturer,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
