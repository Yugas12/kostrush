import './int_ext.dart';


extension StringExtension on String {

  String? toRupiah() {
    var n = int.tryParse(this);

    return n?.toRupiah();
  }

}