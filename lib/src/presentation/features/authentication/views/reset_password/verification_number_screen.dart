import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/data/error/exceptions.dart';
import 'package:green_plate/src/domain/model/DTOs/usuario_dto.dart';
import 'package:green_plate/src/presentation/features/authentication/application/login_service.dart';
import 'package:green_plate/src/presentation/features/authentication/views/reset_password/code_confirmation_screen.dart';
import 'package:green_plate/src/utils/loading_service.dart';

import '../../../../../utils/toast_service.dart';

class VerificationUserNameScreen extends StatefulWidget {
  const VerificationUserNameScreen({super.key});

  @override
  State<VerificationUserNameScreen> createState() => _VerificationUserNameScreenState();
}

class _VerificationUserNameScreenState extends State<VerificationUserNameScreen> {
  final TextEditingController userNameController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool _submitted = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
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
            child: Form(
              key: _formKey,
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
                          'Digite seu e-mail de acesso',
                          style: TextStyle(fontSize: 20, fontWeight: pesosDeFonte['medium']),
                        ),
                      ),
                      Text(
                        "Precisamos verificar você",
                        style: TextStyle(
                          color: ThemeColors.primaryFontLowOpacityColor,
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: userNameController,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) => checkUserName(context),
                    keyboardType: TextInputType.emailAddress,
                    autovalidateMode: _submitted ? AutovalidateMode.always : AutovalidateMode.disabled,
                    inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[/\\ ]'))],
                    focusNode: focusNode,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Campo não pode estar vazio';
                      }
                      if (!EmailValidator.validate(value)) {
                        return 'E-mail inválido';
                      }
                      return null;
                    },
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
                  Material(
                    color: ThemeColors.primary,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      onTap: () => checkUserName(context),
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
      ),
    );
  }

  void checkUserName(BuildContext context) {
    LoginService loginService = LoginService();
    setState(() => _submitted = true);
    if (!_formKey.currentState!.validate()) {
      ToastService.warning('E-mail inválido. Digite o e-mail corretamente');
      return;
    }
    LoadingService.show(context);
    loginService.checkIfUserNameExists(userNameController.text).then((usuario) {
      ToastService.success('E-mail encontrado com  sucesso');
      LoadingService.hide();
      goToResetPasswordScreen(context, usuario);
    }).catchError((err) {
      LoadingService.hide();
      ToastService.error(
          err is GreenPlateException ? err.message : 'Erro ao tentar checar o e-mail. Tente novamente mais tarde');
      return;
    });
  }

  goToResetPasswordScreen(BuildContext context, UsuarioDTO usuarioDTO) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SecretWordConfirmationScreen(
          usuarioDTO: usuarioDTO,
        ),
      ),
    );
  }
}
