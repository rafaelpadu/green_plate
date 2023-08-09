import 'package:flutter/material.dart';
import 'package:green_plate/src/config/theme_colors.dart';
import 'package:green_plate/src/presentation/features/authentication/views/reset_password/password_confirmation_screen.dart';

class CodeConfirmationScreen extends StatefulWidget {
  const CodeConfirmationScreen({super.key});

  @override
  State<CodeConfirmationScreen> createState() => _CodeConfirmationScreenState();
}

class _CodeConfirmationScreenState extends State<CodeConfirmationScreen> {
  final TextEditingController number1 = TextEditingController();
  final TextEditingController number2 = TextEditingController();
  final TextEditingController number3 = TextEditingController();
  final TextEditingController number4 = TextEditingController();
  final TextEditingController number5 = TextEditingController();

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
                    'Código de verificação',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: pesosDeFonte['medium'],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Enviamos um SMS para:'),
                  ),
                  const Text(
                    "+55 (XX) XXXXX-XXXX",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    child: TextField(
                      controller: number1,
                      style: TextStyle(fontSize: 24, fontWeight: pesosDeFonte['bold']),
                      decoration: InputDecoration(
                        fillColor: ThemeColors.textFieldBackGround,
                        filled: true,
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 0, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 0, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 0, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: const EdgeInsets.only(left: 18, top: 24),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        FocusScope.of(context).nextFocus();
                      },
                    ),
                  ),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    child: TextField(
                      controller: number2,
                      decoration: InputDecoration(
                        fillColor: ThemeColors.textFieldBackGround,
                        filled: true,
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 0, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 0, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 0, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: const EdgeInsets.only(left: 18, top: 24),
                      ),
                      style: TextStyle(fontSize: 24, fontWeight: pesosDeFonte['bold']),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        FocusScope.of(context).nextFocus();
                      },
                    ),
                  ),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    child: TextField(
                      controller: number3,
                      decoration: InputDecoration(
                        fillColor: ThemeColors.textFieldBackGround,
                        filled: true,
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 0, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 0, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 0, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: const EdgeInsets.only(left: 18, top: 24),
                      ),
                      style: TextStyle(fontSize: 24, fontWeight: pesosDeFonte['bold']),
                      keyboardType: TextInputType.number,
                      onChanged: (_) => FocusScope.of(context).nextFocus(),
                    ),
                  ),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    child: TextField(
                      controller: number4,
                      decoration: InputDecoration(
                        fillColor: ThemeColors.textFieldBackGround,
                        filled: true,
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 0, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 0, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 0, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: const EdgeInsets.only(left: 18, top: 24),
                      ),
                      style: TextStyle(fontSize: 24, fontWeight: pesosDeFonte['bold']),
                      keyboardType: TextInputType.number,
                      onChanged: (_) => FocusScope.of(context).nextFocus(),
                    ),
                  ),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: ShapeDecoration(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    child: TextField(
                      controller: number5,
                      decoration: InputDecoration(
                        fillColor: ThemeColors.textFieldBackGround,
                        filled: true,
                        border: InputBorder.none,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 0, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 0, color: Colors.redAccent),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 0, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        contentPadding: const EdgeInsets.only(left: 18, top: 24),
                      ),
                      style: TextStyle(fontSize: 24, fontWeight: pesosDeFonte['bold']),
                      keyboardType: TextInputType.number,
                      onChanged: (_) => FocusScope.of(context).nextFocus(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Re-Enviar',
                        style: TextStyle(color: ThemeColors.secondary),
                      ),
                    ),
                    const Text('Corrigir número de Telefone')
                  ],
                ),
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
    Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswordConfirmationScreen()));
  }
}
