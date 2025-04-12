import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  final SharedPreferences _prefs;

  SharedPreferencesHelper(this._prefs);

  static const String _userIdKey = 'user_id';
  static const String _usernameKey = 'username';
  static const String _emailKey = 'email';

  // Sauvegarder les données utilisateur
  Future<void> saveUserData({
    required int id,
    required String username,
    required String email,
  }) async {
    await _prefs.setInt(_userIdKey, id);
    await _prefs.setString(_usernameKey, username);
    await _prefs.setString(_emailKey, email);
  }

  // Récupérer ID utilisateur
  int? get userId => _prefs.getInt(_userIdKey);

  // Récupérer username utilisateur
  String? get username => _prefs.getString(_usernameKey);

  // Récupérer email utilisateur
  String? get email => _prefs.getString(_emailKey);

  // Vérifier si utilisateur connecté
  bool get isLoggedIn => userId != null;

  // Supprimer données utilisateur (logout)
  Future<void> clearUserData() async {
    await _prefs.remove(_userIdKey);
    await _prefs.remove(_usernameKey);
    await _prefs.remove(_emailKey);
  }
}
