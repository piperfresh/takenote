import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  Future<SharedPreferences> _getSharedPreferencesInstance() async {
    return await SharedPreferences.getInstance();
  }

  Future<void> addNote(String note) async {
    SharedPreferences prefs = await _getSharedPreferencesInstance();
    await prefs.setString('note', note);
  }

  Future<String?> getNote() async {
    SharedPreferences prefs = await _getSharedPreferencesInstance();
    return prefs.getString('note');
  }

  Future<void> updateNote(String newNote) async {
    SharedPreferences prefs = await _getSharedPreferencesInstance();
    await prefs.setString('note', newNote);
  }

  Future<void> deleteNote() async {
    SharedPreferences prefs = await _getSharedPreferencesInstance();
    await prefs.remove('note');
  }
}