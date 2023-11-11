import 'package:flutter/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MasksFormaters {
  final maskCpf = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );
  final maskCNPJ = MaskTextInputFormatter(
    mask: "##.###.###/####-##",
    filter: {"#": RegExp(r'[0-9]')},
  );
  final dateMask = MaskTextInputFormatter(
    mask: "##/##/####",
    filter: {"#": RegExp(r'[0-9]')},
  );
  final phoneMask = MaskTextInputFormatter(
    mask: "+## (##) #-####-####",
    filter: {"#": RegExp(r'[0-9]')},
  );
  final maskCep = MaskTextInputFormatter(mask: '#####-###', filter: {'#': RegExp(r'[0-9]')});
}

class CpfCnpjFormatter extends MaskTextInputFormatter {
  static String maskCpf = "###.###.###-##";
  static String maskCnpj = "##.###.###/####-##";

  CpfCnpjFormatter({super.initialText}) : super(mask: maskCpf, filter: {"#": RegExp('[0-9]')});

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (getUnmaskedText().length <= 11) {
      if (getMask() != maskCpf) {
        updateMask(mask: maskCpf);
      }
    } else {
      if (getMask() != maskCnpj) {
        updateMask(mask: maskCnpj);
      }
    }
    return super.formatEditUpdate(oldValue, newValue);
  }
}
