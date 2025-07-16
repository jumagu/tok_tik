import 'package:intl/intl.dart';

class Formatters {
  // As a static method, no need to create an instance of Formatters to be able to use the method
  static String shortNumber(double number) {
    final formattedNumber =
        NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
            .format(number);
    return formattedNumber;
  }
}
