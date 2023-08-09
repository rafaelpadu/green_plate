import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';

class PasswordConfirmationScreen extends StatefulWidget {
  const PasswordConfirmationScreen({super.key});

  @override
  State<PasswordConfirmationScreen> createState() => _PasswordConfirmationScreenState();
}

class _PasswordConfirmationScreenState extends State<PasswordConfirmationScreen> {
  final TextEditingController _passWordController = TextEditingController();
  final TextEditingController _confirmPassWordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Escolha a nova senha"),
      ),
      body: SingleChildScrollView(
          child: Container(
        constraints: BoxConstraints(minHeight: MediaQuery.sizeOf(context).height - 85),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'Insira a sua nova senha',
                  style: TextStyle(color: ThemeColors.primaryFontLowOpacityColor),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Image.asset(
                'lib/res/assets/images/arts/password_confirmation.png',
                height: 200,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _passWordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Senha',
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: ThemeColors.primaryFontColor,
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 22),
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          color: ThemeColors.primaryFontColor,
                        ),
                      ),
                      fillColor: ThemeColors.textFieldBackGround,
                      filled: true,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _confirmPassWordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Confirmar Senha',
                    prefixIcon: Icon(
                      Icons.lock_outline,
                      color: ThemeColors.primaryFontColor,
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 22),
                      child: Icon(
                        Icons.remove_red_eye_outlined,
                        color: ThemeColors.primaryFontColor,
                      ),
                    ),
                    fillColor: ThemeColors.textFieldBackGround,
                    filled: true,
                  ),
                ),
              ],
            ),
            Material(
              color: ThemeColors.primary,
              borderRadius: BorderRadius.circular(8),
              child: InkWell(
                customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                onTap: () => (),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Text(
                        'Concluir',
                        style: TextStyle(
                          color: ThemeColors.whiteFontColor,
                          fontSize: 16,
                          fontWeight: pesosDeFonte['medium'],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_outlined,
                        color: ThemeColors.whiteFontColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
