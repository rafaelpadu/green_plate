import 'package:flutter/material.dart';

class SimpleCardImageWidget extends StatelessWidget {
  final String title;
  final String imageAsset;
  final Function() nextPage;
  const SimpleCardImageWidget({
    super.key,
    required this.title,
    required this.imageAsset,
    required this.nextPage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: nextPage,
      child: SizedBox(
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
      ),
    );
  }
}
