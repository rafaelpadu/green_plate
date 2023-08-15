import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/presentation/widgets/independent/green_plate_logo.dart';

class RegistrationModeSelectionScreen extends StatelessWidget {
  const RegistrationModeSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        padding: const EdgeInsets.symmetric(vertical: 58, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            greenPlateLogo,
            Text(
              'Falta pouco para\nmatar sua fome!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: pesosDeFonte['medium'],
              ),
            ),
            Text(
              'Como deseja continuar?',
              style: TextStyle(fontSize: 20, color: ThemeColors.primaryFontLowOpacityColor),
            ),
            Column(
              children: [
                Material(
                  color: const Color.fromRGBO(35, 108, 217, 1),
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(""),
                          Text(
                            'Continuar com Facebook',
                            style: TextStyle(color: Colors.white, fontWeight: pesosDeFonte['medium']),
                            textAlign: TextAlign.center,
                          ),
                          const Icon(
                            Icons.facebook,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: ThemeColors.primaryFontColor, width: 0.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(""),
                            Text(
                              'Fazer Login com o Google',
                              style: TextStyle(fontWeight: pesosDeFonte['medium']),
                              textAlign: TextAlign.center,
                            ),
                            Image.network(
                              'http://pngimg.com/uploads/google/google_PNG19635.png',
                              fit: BoxFit.cover,
                              width: 24,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Material(
                          color: ThemeColors.backGroundColor,
                          borderRadius: BorderRadiusDirectional.circular(10),
                          child: InkWell(
                            onTap: () {},
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: ThemeColors.greyBackGroundColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              child: Text(
                                'Celular',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: pesosDeFonte['medium'],
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Material(
                        color: ThemeColors.backGroundColor,
                        borderRadius: BorderRadiusDirectional.circular(10),
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: ThemeColors.greyBackGroundColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: Text(
                              'E-mail',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: pesosDeFonte['medium'],
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
