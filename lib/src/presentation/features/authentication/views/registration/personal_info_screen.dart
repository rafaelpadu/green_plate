import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/domain/model/DTOs/usuario_dto.dart';
import 'package:green_plate/src/presentation/features/authentication/views/reset_password/password_confirmation_screen.dart';

class PersonalInfoScreen extends StatefulWidget {
  const PersonalInfoScreen({super.key});

  @override
  State<PersonalInfoScreen> createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _federalIDController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suas Informações'),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: MediaQuery.sizeOf(context).height - 80),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text("Por favor, deixe-nos sabe algumas informações para um serviço seguro"),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80), color: ThemeColors.greyBackGroundColor),
                      padding: const EdgeInsets.all(36),
                      child: const Icon(
                        Icons.add_a_photo_outlined,
                        size: 55,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: TextFormField(
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
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: TextFormField(
                      controller: _federalIDController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'CPF',
                        fillColor: ThemeColors.textFieldBackGround,
                        filled: true,
                      ),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: 'Confirmação de E-mail',
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
                  onTap: () => _goToPassWordScreen(),
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

  _goToPassWordScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PasswordConfirmationScreen(
                  usuarioDTO: UsuarioDTO.emptyUsuario(),
                )));
  }
}
