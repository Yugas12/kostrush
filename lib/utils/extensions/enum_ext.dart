import 'package:kostrushapp/data/enum/dorm_gender_enum.dart';
import 'package:kostrushapp/data/enum/transaction_status_enum.dart';

import '../../data/enum/gender_enum.dart';

/// Extension ini digunakan untuk memperluas fungsionalitas dari [DormGenderEnum]
extension DormGenderEnumExtension on DormGenderEnum {
  
  /// Mengembalikan nilai string yang sesuai dengan nilai enum.
  ///
  /// - `DormGenderEnum.MALE` akan mengembalikan "Putra".
  /// - `DormGenderEnum.FEMALE` akan mengembalikan "Putri".
  /// - `DormGenderEnum.UNISEX` akan mengembalikan "Campur".
  String get value {
    switch (this) {
      case DormGenderEnum.MALE:
        return "Putra";
      case DormGenderEnum.FEMALE:
        return "Putri";
      case DormGenderEnum.UNISEX:
        return "Campur";
    }
  }
}

extension TransactionStatusEnumExtension on TransactionStatusEnum {
  /// Mengembalikan nilai string yang sesuai dengan nilai enum.
  /// 
  /// - `TransactionStatusEnum.pending` akan mengembalikan "Menunggu".
  /// - `TransactionStatusEnum.processing` akan mengembalikan "Diproses".
  /// - `TransactionStatusEnum.done` akan mengembalikan "Selesai".
  String get value {
    switch (this) {
      case TransactionStatusEnum.pending:
        return "Menunggu";
      case TransactionStatusEnum.processing:
        return "Diproses";
      case TransactionStatusEnum.done:
        return "Selesai";
    }
  }

  /// Mengembalikan pesan yang sesuai dengan nilai enum saat ini.
  ///
  /// - [TransactionStatusEnum.pending]: "Terima kasih atas pesanan Anda. Mohon ditunggu beberapa saat untuk proses konfirmasi."
  /// - [TransactionStatusEnum.processing]: "Transaksi Anda sedang diproses. Harap datang sesuai tanggal pengajuan sewa untuk melakukan pembayaran."
  /// - [TransactionStatusEnum.done]: "Transaksi Anda telah berhasil. Harap ingat tanggal pengajuan sewa Anda. Terima kasih."
  String get message {
    switch (this) {
      case TransactionStatusEnum.pending:
        return "Terima kasih atas pesanan Anda. Mohon ditunggu beberapa saat untuk proses konfirmasi.";
      case TransactionStatusEnum.processing:
        return "Transaksi Anda sedang diproses. Harap datang sesuai tanggal pengajuan sewa untuk melakukan pembayaran.";
      case TransactionStatusEnum.done:
        return "Transaksi Anda telah berhasil. Harap ingat tanggal pengajuan sewa Anda. Terima kasih.";
    }
  }
}

extension GenderEnumExtension on GenderEnum {
  /// Mengembalikan nilai string yang sesuai dengan nilai enum.
  ///
  /// - Jika nilai enum adalah [GenderEnum.Male], maka akan mengembalikan "laki-laki".
  /// - Jika nilai enum adalah [GenderEnum.Female], maka akan mengembalikan "perempuan".
  /// - Jika nilai enum tidak sesuai dengan nilai yang ada, maka akan mengembalikan string kosong.
  String get value {
    switch (this) {
      case GenderEnum.Male:
        return "laki-laki";
      case GenderEnum.Female:
        return "perempuan";
      default:
        return "";
    }
  }
}
