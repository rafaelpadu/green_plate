import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_plate/firebase_options.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/data/providers/cart_provider.dart';
import 'package:green_plate/src/domain/model/DTOs/pedido_dto.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'src/presentation/features/main/green_plate_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Intl.defaultLocale = 'pt_BR';
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider(pedido: PedidoDTO.emptyPedido()))],
    child: const GreenPlateApp(),
  ));
}

class GreenPlateApp extends StatelessWidget {
  const GreenPlateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeColors().lightThemeData(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: true,
      home: const GreenPlateScreen(),
    );
  }
}
