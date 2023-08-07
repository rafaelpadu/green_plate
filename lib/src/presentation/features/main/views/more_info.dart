import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/presentation/features/authentication/views/login_screen.dart';

class MoreInfoScreen extends StatelessWidget {
  const MoreInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
                  'Rafael de Pádua',
                  style: TextStyle(fontSize: 18, fontWeight: pesosDeFonte['semi-bold']),
                ),
                Text(
                  '999.989.989-78',
                  style: TextStyle(fontSize: 15, fontWeight: pesosDeFonte['medium']),
                ),
              ],
            )
          ],
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.edit_outlined,
                  color: ThemeColors.blueIconColor,
                ),
                title: Text(
                  'Editar Perfil',
                  style: TextStyle(fontWeight: pesosDeFonte['medium']),
                ),
              ),
              Divider(
                height: 2,
                color: ThemeColors.dividerColor,
              ),
              ListTile(
                leading: const Icon(
                  Icons.place_outlined,
                ),
                title: Text(
                  'Meus Endereços',
                  style: TextStyle(fontWeight: pesosDeFonte['medium']),
                ),
              ),
              Divider(
                height: 2,
                color: ThemeColors.dividerColor,
              ),
              ListTile(
                leading: const Icon(
                  Icons.shopping_basket_outlined,
                ),
                title: Text(
                  'Meus Pedidos',
                  style: TextStyle(fontWeight: pesosDeFonte['medium']),
                ),
              ),
              Divider(
                height: 2,
                color: ThemeColors.dividerColor,
              ),
              ListTile(
                leading: Icon(
                  Icons.chat_bubble_outline,
                  color: ThemeColors.primary,
                ),
                title: Text(
                  'Converse Conosco',
                  style: TextStyle(fontWeight: pesosDeFonte['medium']),
                ),
              ),
              Divider(
                height: 2,
                color: ThemeColors.dividerColor,
              ),
              ListTile(
                leading: Icon(
                  Icons.call_outlined,
                  color: ThemeColors.secondary,
                ),
                title: Text(
                  'Fale com o nosso suporte',
                  style: TextStyle(fontWeight: pesosDeFonte['medium']),
                ),
              ),
              Divider(
                height: 2,
                color: ThemeColors.dividerColor,
              ),
              ListTile(
                leading: const Icon(
                  Icons.mail_outline,
                ),
                title: Text(
                  'Envie um e-mail',
                  style: TextStyle(fontWeight: pesosDeFonte['medium']),
                ),
              ),
              Divider(
                height: 2,
                color: ThemeColors.dividerColor,
              ),
              ListTile(
                leading: Icon(
                  Icons.power_settings_new_outlined,
                  color: ThemeColors.secondary,
                ),
                title: Text(
                  'Sair',
                  style: TextStyle(fontWeight: pesosDeFonte['medium']),
                ),
                onTap: () =>
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen())),
              ),
            ],
          ),
        )
      ],
    );
  }
}
