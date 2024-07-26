import 'package:intl/intl.dart';

extension PriceFormat on num {
  String toPriceFormat() {
    final formatCurrency = NumberFormat.simpleCurrency();
    return formatCurrency.format(this);
  }

    // Indian price format
  String toIndianPriceFormat() {
    final formatCurrency = NumberFormat.currency(locale: 'en_IN', symbol: '₹ ');
    return formatCurrency.format(this);
  }
}