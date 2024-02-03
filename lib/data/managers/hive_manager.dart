// ignore_for_file: library_private_types_in_public_api

import 'package:gitclic/data/models/user_model.dart';
import 'package:hive/hive.dart';

final _HiveManager hiveManager = _HiveManager();

class _HiveManager {
  final Box _userBox = Hive.box<UserModel>("user");
  final Box _authBox = Hive.box("auth");

  UserModel? get user => _userBox.get("user");
  set user(UserModel? current) => _userBox.put("user", current);

  String? get token => _authBox.get("token");
  set token(String? current) => _authBox.put("token", current);

  signOut() {
    _authBox.clear();
    _userBox.clear();
  }
}
