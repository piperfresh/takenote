import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notetake/note/domain/entities/note_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';


class PersonalNoteRepositoryImpl extends StateNotifier<List<NoteEntity>> {
  PersonalNoteRepositoryImpl() : super([]) {
    // Load saved notes when the repository is created.
    _loadNotes();
  }

  void addNote(NoteEntity note) {
    state = [...state, note];
    _saveNotes();
  }

  void deleteNote(int index) {
    state = List.from(state)..removeAt(index);
    _saveNotes();
  }

  void editNote(NoteEntity note, int index) {
    state = List.from(state)..[index] = note;
    _saveNotes();
  }

  // Save notes to shared preferences
  void _saveNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> notesJson = state.map((note) => jsonEncode(note.toJson())).toList();
    print('Note list $notesJson');
    prefs.setStringList('notes', notesJson);
  }

  // Load notes from shared preferences
  void _loadNotes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? notesJson = prefs.getStringList('notes');
    if (notesJson != null) {
      state = notesJson.map((json) => NoteEntity.fromJson(jsonDecode(json))).toList();
    }
  }
}



