import 'package:kostrushapp/data/enum/dorm_gender_enum.dart';
import 'package:kostrushapp/data/enum/transaction_status_enum.dart';

import '../../data/enum/gender_enum.dart';

/// Extension ini digunakan untuk memperluas fungsionalitas dari [DormGenderEnum]
extension DormGenderEnumExtension on DormGenderEnum {
  /// Mengubah [DormGenderEnum] menjadi [String]
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
