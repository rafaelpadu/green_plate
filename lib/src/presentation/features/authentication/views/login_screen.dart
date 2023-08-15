import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/presentation/features/authentication/views/registration/registration_mode_selection.dart';
import 'package:green_plate/src/presentation/features/authentication/views/reset_password/verification_number_screen.dart';
import 'package:green_plate/src/presentation/widgets/independent/green_plate_logo.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.sizeOf(context).height,
          maxHeight: MediaQuery.sizeOf(context).height,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 90,
            ),
            greenPlateLogo,
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Seja bem-vindo',
                        style: TextStyle(fontSize: 20, fontWeight: pesosDeFonte['medium']),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'E-mail ou celular',
                      prefixIcon: const Icon(Icons.account_circle_outlined),
                      fillColor: ThemeColors.textFieldBackGround,
                      filled: true,
                    ),
                  ),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Senha',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                    fillColor: ThemeColors.textFieldBackGround,
                    filled: true,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () => goToResetPasswordScreen(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Esqueceu sua senha?',
                      style: TextStyle(
                        color: ThemeColors.secondary,
                      ),
                    ),
                  ),
                ),
                Material(
                  color: ThemeColors.primary,
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Text(
                            'Entrar',
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
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 30),
                  child: Material(
                    color: ThemeColors.primary,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      onTap: () => goToRegistrationScreen(),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(),
                            Text(
                              'Cadastre-se',
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
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }

  goToResetPasswordScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const VerificationNumberScreen()));
  }

  goToRegistrationScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationModeSelectionScreen()));
  }
}
