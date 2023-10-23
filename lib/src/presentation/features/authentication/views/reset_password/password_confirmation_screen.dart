import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/data/error/exceptions.dart';
import 'package:green_plate/src/utils/loading_service.dart';
import 'package:green_plate/src/utils/toast_service.dart';

import '../../../../../domain/model/DTOs/usuario_dto.dart';
import '../../application/login_service.dart';
import '../login_screen.dart';

class PasswordConfirmationScreen extends StatefulWidget {
  const PasswordConfirmationScreen({super.key, required this.usuarioDTO});
  final UsuarioDTO usuarioDTO;
  @override
  State<PasswordConfirmationScreen> createState() => _PasswordConfirmationScreenState();
}

class _PasswordConfirmationScreenState extends State<PasswordConfirmationScreen> {
  final TextEditingController _passWordController = TextEditingController();
  final TextEditingController _confirmPassWordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _submitted = false;
  bool _showConfirmPassword = false;
  bool _showPassword = false;

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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      controller: _passWordController,
                      textInputAction: TextInputAction.next,
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
                        suffixIcon: IconButton(
                          icon: !_showPassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                          color: ThemeColors.primaryFontColor,
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                        fillColor: ThemeColors.textFieldBackGround,
                        filled: true,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !_showPassword,
                      autovalidateMode: _submitted ? AutovalidateMode.always : AutovalidateMode.disabled,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo não pode estar vazio';
                        }
                        if (value.length < 6) {
                          return 'A senha precisa ter no minímo 6 carácteres';
                        }
                        return null;
                      },
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
                      suffixIcon: IconButton(
                        icon: !_showConfirmPassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                        color: ThemeColors.primaryFontColor,
                        onPressed: () {
                          setState(() {
                            _showConfirmPassword = !_showConfirmPassword;
                          });
                        },
                      ),
                      fillColor: ThemeColors.textFieldBackGround,
                      filled: true,
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !_showConfirmPassword,
                    autovalidateMode: _submitted ? AutovalidateMode.always : AutovalidateMode.disabled,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo não pode estar vazio';
                      }
                      if (value.length < 6) {
                        return 'A senha precisa ter no minímo 6 carácteres';
                      }
                      if (value != _passWordController.text) {
                        return 'As senhas devem ser iguais';
                      }
                      return null;
                    },
                    onFieldSubmitted: (value) => createNewPassword(),
                  ),
                ],
              ),
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

  createNewPassword() {
    LoginService loginService = LoginService();
    setState(() => _submitted = true);
    if (!_formKey.currentState!.validate()) {
      return;
    }
    LoadingService.show(context);
    loginService.createNewPassWord(widget.usuarioDTO.id, _passWordController.text).then((_) {
      LoadingService.hide();
      ToastService.success('Senha alterada com sucesso!');
      redirectToLoginScreen();
    }).catchError((err) {
      LoadingService.hide();
      ToastService.error(err is GreenPlateException
          ? err.message
          : 'Ocorreu um erro ao tentar alterar a sua senha. Tente novamente mais tarde');
    });
  }

  redirectToLoginScreen() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
