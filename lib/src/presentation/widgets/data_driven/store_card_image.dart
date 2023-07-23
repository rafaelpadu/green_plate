// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';

class StoreCardImage extends StatelessWidget {
  final String imageUrl;
  final double rating;
  final String storeType;
  final String storeName;
  final String description;
  final double distance;
  const StoreCardImage({
    Key? key,
    required this.imageUrl,
    required this.rating,
    required this.storeType,
    required this.storeName,
    required this.description,
    required this.distance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 167,
      height: 168,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
              child: Text(
                storeName,
                style: TextStyle(fontWeight: pesosDeFonte['medium']),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 14,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Text(
                    rating.toString(),
                    style: const TextStyle(color: Colors.yellow, fontSize: 10),
                  ),
                ),
                Text(
                  "| $storeType | ",
                  style: const TextStyle(fontSize: 10),
                ),
                Text(
                  "${distance.toString()} km",
                  style: const TextStyle(fontSize: 10),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(description, style: const TextStyle(fontSize: 10)),
            )
          ],
        ),
      ),
    );
  }
}
