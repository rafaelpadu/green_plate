import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/presentation/features/authentication/views/reset_password/code_confirmation_screen.dart';

class VerificationNumberScreen extends StatelessWidget {
  const VerificationNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Recuperar Senha'),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: MediaQuery.sizeOf(context).height - 90),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    'lib/res/assets/images/arts/reset_password.png',
                    height: 200,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Digite seu número de celular',
                        style: TextStyle(fontSize: 20, fontWeight: pesosDeFonte['medium']),
                      ),
                    ),
                    Text(
                      "Precisamos verificar você. Nós lhe enviaremos \num código de verificação único",
                      style: TextStyle(
                        color: ThemeColors.primaryFontLowOpacityColor,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Número de Telefone',
                    prefixIcon: const Icon(Icons.phone),
                    fillColor: ThemeColors.textFieldBackGround,
                    filled: true,
                  ),
                ),
                Material(
                  color: ThemeColors.primary,
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    onTap: () => goToResetPasswordScreen(context),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(),
                          Text(
                            'Próximo',
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
          ),
        ),
      ),
    );
  }

  goToResetPasswordScreen(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const CodeConfirmationScreen()));
  }
}
