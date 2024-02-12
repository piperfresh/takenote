import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entities/note_entity.dart';

class SharedPrefService {
  void saveNotes(List state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> notesJson = state.map((note) => jsonEncode(note.toJson())).toList();
    print('Note list $notesJson');
    prefs.setStringList('notes', notesJson);
  }

  // Load notes from shared preferences
  void loadNotes(List state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? notesJson = prefs.getStringList('notes');
    if (notesJson != null) {
      state = notesJson.map((json) => NoteEntity.fromJson(jsonDecode(json))).toList();
    }
  }
}