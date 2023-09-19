
import 'package:intl/intl.dart';

class FormartterHelper {
  static final _currencyFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: r'R$'
  );

  FormartterHelper._();

  static String formatCurrencyDouble(double value) {
    return _currencyFormat.format(value);
  }
}