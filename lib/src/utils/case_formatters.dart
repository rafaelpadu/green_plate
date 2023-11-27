import 'package:intl/intl.dart';

class CaseFormatters {
  firstLetterUpperCase(String? text) {
    if (text != null && text.isNotEmpty) {
      List<String> words = text.toLowerCase().split(' ');
      for (var i = 0; i < words.length; i++) {
        List<String> letters = words[i].toString().split('');
        String word = letters[0].toString().toUpperCase() + letters.sublist(1).join();
        words.fillRange(i, i + 1, word);
      }
      return words.join(' ');
    } else {
      return '';
    }
  }

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    return htmlText.replaceAll(exp, '');
  }

  String currencyBRLFormatter(double value) {
    final formatter = NumberFormat("#,##0.00", "pt_BR");
    return "R\$ ${formatter.format(value)}";
  }

  String formatarCPF(String cpf) {
    return cpf.replaceAllMapped(RegExp(r'^(\d{3})(\d{3})(\d{3})(\d{2})$'), (match) {
      return '${match[1]}.${match[2]}.${match[3]}-${match[4]}';
    });
  }

  String desformatarCPF(String cpf) {
    return cpf.replaceAll(RegExp(r'[^0-9]'), '');
  }
}
