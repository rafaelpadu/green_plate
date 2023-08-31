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
}
