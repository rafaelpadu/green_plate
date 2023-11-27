import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/domain/model/DTOs/usuario_dto.dart';
import 'package:green_plate/src/presentation/features/authentication/views/reset_password/password_confirmation_screen.dart';
import 'package:green_plate/src/utils/loading_service.dart';
import 'package:green_plate/src/utils/mask_formatters.dart';
import 'package:green_plate/src/utils/toast_service.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _emailConfimationController = TextEditingController();
  final TextEditingController _secretQuestionController = TextEditingController();
  final TextEditingController _secretAnswerController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suas Informações'),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: MediaQuery.sizeOf(context).height - 100),
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text("Por favor, deixe-nos sabe algumas informações para um serviço seguro"),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _fullNameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Nome Completo',
                        prefixIcon: Icon(
                          Icons.account_circle_outlined,
                          color: ThemeColors.primaryFontColor,
                        ),
                        fillColor: ThemeColors.textFieldBackGround,
                        filled: true,
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo não pode estar vazio';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        controller: _cpfController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'CPF',
                          fillColor: ThemeColors.textFieldBackGround,
                          filled: true,
                        ),
                        inputFormatters: [CpfCnpjFormatter()],
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo não pode estar vazio';
                          }
                          if (value.length < 11) {
                            return 'CPF inválido';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'E-mail',
                        fillColor: ThemeColors.textFieldBackGround,
                        filled: true,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[/\\ ]'))],
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo não pode estar vazio';
                        }
                        if (!EmailValidator.validate(value)) {
                          return 'E-mail inválido';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: TextFormField(
                        controller: _emailConfimationController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Confirmação de E-mail',
                          fillColor: ThemeColors.textFieldBackGround,
                          filled: true,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'[/\\ ]'))],
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo não pode estar vazio';
                          }
                          if (!EmailValidator.validate(value)) {
                            return 'E-mail inválido';
                          }
                          if (_emailController.text != _emailConfimationController.text) {
                            return 'Os e-mails precisam ser iguais';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: TextFormField(
                        controller: _secretQuestionController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: 'Pergunta Secreta',
                          prefixIcon: Icon(
                            Icons.security_rounded,
                            color: ThemeColors.primaryFontColor,
                          ),
                          fillColor: ThemeColors.textFieldBackGround,
                          filled: true,
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Campo não pode estar vazio';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    TextFormField(
                      controller: _secretAnswerController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Resposta Secreta',
                        prefixIcon: Icon(
                          Icons.security_outlined,
                          color: ThemeColors.primaryFontColor,
                        ),
                        fillColor: ThemeColors.textFieldBackGround,
                        filled: true,
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo não pode estar vazio';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) => nextPhase(),
                    ),
                  ],
                ),
              ),
              Material(
                color: ThemeColors.primary,
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  customBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  onTap: () => nextPhase(),
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

  _goToPassWordScreen(UsuarioDTO usuarioDTO) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PasswordConfirmationScreen(
          usuarioDTO: usuarioDTO,
        ),
      ),
    );
  }

  nextPhase() {
    if (!_formKey.currentState!.validate()) {
      ToastService.warning('Existem campos inválidos');
      return;
    }
    LoadingService.show(context);
    UsuarioDTO newUsuario = UsuarioDTO(
      id: 0,
      userName: _fullNameController.text,
      email: _emailController.text,
      password: '',
      customerId: 0,
      active: true,
      secretAnswer: _secretAnswerController.text,
      secretQuestion: _secretQuestionController.text,
    );
    Future.delayed(const Duration(seconds: 2)).then((value) {
      LoadingService.hide();
      _goToPassWordScreen(newUsuario);
    });
  }
}
