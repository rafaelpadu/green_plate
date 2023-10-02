import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';

class GreenPlateDialog extends StatefulWidget {
  const GreenPlateDialog(
      {super.key, required this.titlePartOne, required this.type, this.titlePartTwo, this.titlePartThree});
  final String titlePartOne;
  final String? titlePartTwo;
  final String? titlePartThree;
  final AlertType type;
  @override
  State<GreenPlateDialog> createState() => _GreenPlateDialogState();
}

class _GreenPlateDialogState extends State<GreenPlateDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: ThemeColors.backGroundColor,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 220),
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text.rich(
                  TextSpan(text: widget.titlePartOne, children: [
                    TextSpan(
                        text: widget.titlePartTwo,
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: widget.titlePartThree == null ? FontWeight.w400 : FontWeight.w700)),
                    TextSpan(text: widget.titlePartThree),
                  ]),
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: widget.titlePartThree == null && widget.titlePartTwo != null
                          ? FontWeight.w700
                          : FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            (widget.type == AlertType.confirmation)
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Material(
                            color: ThemeColors.primary,
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop(true);
                              },
                              customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16),
                                child: Text(
                                  "Sim",
                                  style: TextStyle(color: ThemeColors.whiteFontColor),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Material(
                            color: ThemeColors.greyBackGroundColor,
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop(false);
                                },
                                customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Text(
                                    "Não",
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}

enum AlertType {
  warning,
  confirmation;
}
