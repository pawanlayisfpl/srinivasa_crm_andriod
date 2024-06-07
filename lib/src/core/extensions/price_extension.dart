import 'package:intl/intl.dart';

extension PriceFormat on num {
  String toPriceFormat() {
    final formatCurrency = NumberFormat.simpleCurrency();
    return formatCurrency.format(this);
  }
}