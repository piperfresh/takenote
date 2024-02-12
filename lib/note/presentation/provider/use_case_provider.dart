import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notetake/note/data/repository/academic_note_repository_impl.dart';
import 'package:notetake/note/data/repository/others_note_repository_impl.dart';
import 'package:notetake/note/data/repository/personal_note_repository_impl.dart';
import 'package:notetake/note/data/repository/work_note_repository_impl.dart';
import 'package:notetake/note/domain/entities/note_entity.dart';


final personalNoteRepositoryProvider =
    StateNotifierProvider<PersonalNoteRepositoryImpl, List<NoteEntity>>(
        (ref) => PersonalNoteRepositoryImpl());
final academicNoteRepositoryProvider =
    StateNotifierProvider<AcademicNoteRepositoryImpl, List<NoteEntity>>(
        (ref) => AcademicNoteRepositoryImpl());
final workNoteRepositoryProvider =
    StateNotifierProvider<WorkNoteRepositoryImpl, List<NoteEntity>>(
        (ref) => WorkNoteRepositoryImpl());
final othersNoteRepositoryProvider =
    StateNotifierProvider<OthersNoteRepositoryImpl, List<NoteEntity>>(
        (ref) => OthersNoteRepositoryImpl());
