import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/data/error/exceptions.dart';
import 'package:green_plate/src/domain/model/DTOs/customer_dto.dart';
import 'package:green_plate/src/presentation/features/authentication/views/login_screen.dart';
import 'package:green_plate/src/presentation/features/main/application/more_info_service.dart';
import 'package:green_plate/src/presentation/features/personal_info/view/profile.dart';
import 'package:green_plate/src/utils/case_formatters.dart';
import 'package:green_plate/src/utils/toast_service.dart';

class MoreInfoScreen extends StatefulWidget {
  const MoreInfoScreen({super.key});

  @override
  State<MoreInfoScreen> createState() => _MoreInfoScreenState();
}

class _MoreInfoScreenState extends State<MoreInfoScreen> {
  CustomerDTO? currentCustomer;
  bool isLogged = false;
  @override
  void initState() {
    super.initState();
    getCustomerInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        !isLogged
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text('Você não está logado!', style: TextStyle(fontSize: 18, fontWeight: pesosDeFonte['semi-bold']))
                  ],
                ),
              )
            : Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('lib/res/assets/images/avatar_image.jpg'),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        currentCustomer!.fullName,
                        style: TextStyle(fontSize: 18, fontWeight: pesosDeFonte['semi-bold']),
                      ),
                      Text(
                        currentCustomer!.cpf != null ? CaseFormatters().formatarCPF(currentCustomer!.cpf!) : '',
                        style: TextStyle(fontSize: 15, fontWeight: pesosDeFonte['medium']),
                      ),
                    ],
                  )
                ],
              ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (isLogged) ...[
              ListTile(
                onTap: goToProfileScreen,
                leading: Icon(
                  Icons.edit_outlined,
                  color: ThemeColors.blueIconColor,
                ),
                title: Text(
                  'Editar Perfil',
                  style: TextStyle(fontWeight: pesosDeFonte['medium']),
                ),
              ),
              // Divider(
              //   height: 2,
              //   color: ThemeColors.dividerColor,
              // ),
              // ListTile(
              //   leading: const Icon(
              //     Icons.place_outlined,
              //   ),
              //   title: Text(
              //     'Meus Endereços',
              //     style: TextStyle(fontWeight: pesosDeFonte['medium']),
              //   ),
              // ),
              // Divider(
              //   height: 2,
              //   color: ThemeColors.dividerColor,
              // ),
              // ListTile(
              //   leading: Icon(
              //     Icons.chat_bubble_outline,
              //     color: ThemeColors.primary,
              //   ),
              //   title: Text(
              //     'Converse Conosco',
              //     style: TextStyle(fontWeight: pesosDeFonte['medium']),
              //   ),
              // ),
              // Divider(
              //   height: 2,
              //   color: ThemeColors.dividerColor,
              // ),
              // ListTile(
              //   leading: Icon(
              //     Icons.call_outlined,
              //     color: ThemeColors.secondary,
              //   ),
              //   title: Text(
              //     'Fale com o nosso suporte',
              //     style: TextStyle(fontWeight: pesosDeFonte['medium']),
              //   ),
              // ),
              // Divider(
              //   height: 2,
              //   color: ThemeColors.dividerColor,
              // ),
              // ListTile(
              //   leading: const Icon(
              //     Icons.mail_outline,
              //   ),
              //   title: Text(
              //     'Envie um e-mail',
              //     style: TextStyle(fontWeight: pesosDeFonte['medium']),
              //   ),
              // ),
              Divider(
                height: 2,
                color: ThemeColors.dividerColor,
              ),
            ],
            ListTile(
              leading: Icon(
                Icons.power_settings_new_outlined,
                color: ThemeColors.secondary,
              ),
              title: Text(
                isLogged ? 'Sair' : 'Logar ou Cadastrar-se',
                style: TextStyle(fontWeight: pesosDeFonte['medium']),
              ),
              onTap: () => logOutAndGoToLoginscreen(),
            ),
          ],
        )
      ],
    );
  }

  void getCustomerInfo() {
    MoreInfoService moreInfoService = MoreInfoService();
    const storage = FlutterSecureStorage();
    storage.read(key: 'userId').then((userId) {
      if (userId == null) {
        return;
      }
      moreInfoService.getCustomerByUserId().then((value) {
        setState(() {
          isLogged = true;
          currentCustomer = value;
        });
      }).catchError((err) {
        ToastService.error(err is GreenPlateException ? err.message : err.toString());
      });
    });
  }

  logOutAndGoToLoginscreen() {
    const FlutterSecureStorage().deleteAll().then(
          (value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          ),
        );
  }

  goToProfileScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(customerDTO: currentCustomer!)));
  }
}
