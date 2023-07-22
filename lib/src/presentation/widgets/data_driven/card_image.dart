// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CardImageWidget extends StatelessWidget {
  final String title;
  final String imageAsset;
  const CardImageWidget({
    Key? key,
    required this.title,
    required this.imageAsset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 189,
      height: 173,
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
              imageAsset,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
              child: Text(title),
            ),
          ],
        ),
      ),
    );
  }
}
