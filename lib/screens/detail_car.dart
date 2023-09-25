import 'package:app_shop_super_car/colors/color.dart';
import 'package:flutter/material.dart';

class DetailCar extends StatefulWidget {
  final String image;

  const DetailCar({super.key, required this.image});

  @override
  State<DetailCar> createState() => _DetailCarState(this.image);
}

class _DetailCarState extends State<DetailCar> {

  final String image;

  _DetailCarState(this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(image, width: double.infinity, height: double.infinity,)
      ),
    );
  }
}
