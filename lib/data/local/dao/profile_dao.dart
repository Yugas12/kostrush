import 'package:kostrushapp/data/model/profile_model.dart';
import 'package:sqflite/sqflite.dart';

class ProfileDao {
  ProfileDao(this._database);

  final Database _database;

  // Input data ke tabel users
  Future<void> insertProfile(ProfileModel profile) async {
    await _database.insert('users', profile.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Mendapatkan data dari tabel users
  Future<ProfileModel?> getProfile() async {
    final List<Map<String, dynamic>> maps = await _database.query('users');
    if (maps.isNotEmpty) {
      return ProfileModel.fromMap(maps.first);
    }
    return null;
  }

  // Update data di tabel users
  Future<void> updateProfile(ProfileModel profile) async {
    await _database.update(
      'users',
      profile.toMap(),
      where: 'id = ?',
      whereArgs: [profile.id],
    );
  }

  // Hapus data di tabel users
  Future<void> deleteProfile() async {
    await _database.delete('users');
  }
}
