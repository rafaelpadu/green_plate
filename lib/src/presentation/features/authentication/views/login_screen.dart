import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/data/error/exceptions.dart';
import 'package:green_plate/src/presentation/features/authentication/application/login_service.dart';
import 'package:green_plate/src/presentation/features/authentication/views/reset_password/verification_number_screen.dart';
import 'package:green_plate/src/presentation/features/main/green_plate_screen.dart';
import 'package:green_plate/src/presentation/widgets/independent/green_plate_logo.dart';
import 'package:green_plate/src/utils/loading_service.dart';
import 'package:green_plate/src/utils/toast_service.dart';

import 'registration/personal_info_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _showPassword = false;
  bool _submitted = false;
  @override
  void initState() {
    super.initState();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

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
            Form(
              key: _formKey,
              child: Column(
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
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        _fieldFocusChange(context, emailFocusNode, passwordFocusNode);
                      },
                      keyboardType: TextInputType.emailAddress,
                      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[/\\ ]'))],
                      focusNode: emailFocusNode,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo não pode estar vazio';
                        }
                        if (!EmailValidator.validate(value)) {
                          return 'E-mail inválido';
                        }
                        return null;
                      },
                      autovalidateMode: _submitted ? AutovalidateMode.always : AutovalidateMode.disabled,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'E-mail',
                        prefixIcon: const Icon(Icons.account_circle_outlined),
                        fillColor: ThemeColors.textFieldBackGround,
                        filled: true,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
                    focusNode: passwordFocusNode,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      passwordFocusNode.unfocus();
                      login();
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Senha',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: !_showPassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
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
                ],
              ),
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
                    onTap: () => login(),
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => const VerificationUserNameScreen()));
  }

  goToRegistrationScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonalInfoScreen()));
  }

  login() {
    LoginService loginService = LoginService();
    setState(() => _submitted = true);
    if (!_formKey.currentState!.validate()) {
      ToastService.warning('Existem campos inválidos no login');
      return;
    }
    LoadingService.show(context);
    loginService.login(_emailController.text, _passwordController.text).then((value) {
      ToastService.success('Login realizado com sucesso');
      LoadingService.hide();
      Navigator.push(context, MaterialPageRoute(builder: (context) => const GreenPlateScreen()));
    }).catchError((err) {
      if (err is SocketException) {
        ToastService.error('Sistema está offline no momento. Tente novamente mais tarde');
        return;
      }
      ToastService.error(err is GreenPlateException ? err.message : err.toString());
      LoadingService.hide();
    });
  }

  @override
  void dispose() {
    emailFocusNode.dispose();
    super.dispose();
  }

  void _fieldFocusChange(BuildContext context, FocusNode emailFocusNode, FocusNode passwordFocusNode) {}
}
