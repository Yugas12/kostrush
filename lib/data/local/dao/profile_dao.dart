import 'package:kostrushapp/data/model/profile_model.dart';
import 'package:sqflite/sqflite.dart';

/// Kelas `ProfileDao` adalah kelas yang bertanggung jawab untuk mengakses dan memanipulasi data profil pengguna dalam database lokal.
class ProfileDao {
  ProfileDao(this._database);

  final Database _database;

  /// Memasukkan data profil ke dalam tabel `users`.
  ///
  /// Parameter `profile` adalah objek `ProfileModel` yang akan dimasukkan ke dalam tabel.
  Future<void> insertProfile(ProfileModel profile) async {
    await _database.insert('users', profile.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  /// Mendapatkan data profil dari tabel `users`.
  ///
  /// Jika data tersedia, fungsi ini akan mengembalikan objek `ProfileModel`.
  /// Jika tidak ada data, fungsi ini akan mengembalikan `null`.
  Future<ProfileModel?> getProfile() async {
    final List<Map<String, dynamic>> maps = await _database.query('users');
    if (maps.isNotEmpty) {
      return ProfileModel.fromMap(maps.first);
    }
    return null;
  }

  /// Memperbarui data profil di tabel `users`.
  ///
  /// Parameter `profile` adalah objek `ProfileModel` yang akan diperbarui.
  Future<void> updateProfile(ProfileModel profile) async {
    await _database.update(
      'users',
      profile.toMap(),
      where: 'id = ?',
      whereArgs: [profile.id],
    );
  }

  /// Menghapus data profil dari tabel `users`.
  Future<void> deleteProfile() async {
    await _database.delete('users');
  }
}
