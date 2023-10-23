import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/domain/model/DTOs/usuario_dto.dart';
import 'package:green_plate/src/presentation/features/authentication/views/reset_password/password_confirmation_screen.dart';
import 'package:green_plate/src/utils/loading_service.dart';
import 'package:green_plate/src/utils/toast_service.dart';

class SecretWordConfirmationScreen extends StatefulWidget {
  final UsuarioDTO usuarioDTO;

  const SecretWordConfirmationScreen({super.key, required this.usuarioDTO});
  @override
  State<SecretWordConfirmationScreen> createState() => _SecretWordConfirmationScreenState();
}

class _SecretWordConfirmationScreenState extends State<SecretWordConfirmationScreen> {
  final TextEditingController secretAnswerController = TextEditingController();
  bool _submitted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Confirmação de Código'),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: MediaQuery.sizeOf(context).height - 90),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text(
                    'Palavra Secreta',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: pesosDeFonte['medium'],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('A sua pergunta secreta é:'),
                  ),
                  Text(
                    widget.usuarioDTO.secretQuestion,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: TextFormField(
                      controller: secretAnswerController,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) => checkSecretAnswer(context),
                      keyboardType: TextInputType.text,
                      autovalidateMode: _submitted ? AutovalidateMode.always : AutovalidateMode.disabled,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo não pode estar vazio';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Digite a sua resposta secreta',
                        prefixIcon: const Icon(Icons.security),
                        fillColor: ThemeColors.textFieldBackGround,
                        filled: true,
                      ),
                    ),
                  ),
                ],
              ),
              Material(
                color: ThemeColors.primary,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  onTap: () => goToConfimarionScreen(),
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
    );
  }

  void goToConfimarionScreen() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PasswordConfirmationScreen(usuarioDTO: widget.usuarioDTO)));
  }

  checkSecretAnswer(BuildContext context) {
    setState(() {
      _submitted = true;
    });
    if (secretAnswerController.text != '' && secretAnswerController.text.isNotEmpty) {
      LoadingService.show(context);
      Future.delayed(const Duration(seconds: 1)).then((_) {
        LoadingService.hide();
        if (secretAnswerController.text.toLowerCase() != widget.usuarioDTO.secretAnswer.toLowerCase()) {
          ToastService.warning('A resposta secreta não está correta');
          return;
        } else {
          ToastService.success('Resposta secreta correta. Atualize sua conta com uma nova senha secura.');
          goToConfimarionScreen();
        }
      });
    }
  }
}
