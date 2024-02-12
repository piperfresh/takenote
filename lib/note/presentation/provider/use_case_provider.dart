import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notetake/note/data/repository/note_repository_impl.dart';
import 'package:notetake/note/domain/entities/note_entity.dart';
import 'package:notetake/note/domain/repository/note_repository.dart';
import 'package:notetake/note/domain/usecases/note_use_case.dart';

// final noteRepositoryProvider = Provider<NoteRepository>((ref) => NoteRepositoryImpl());
//
//
// final noteUseCaseProvider = Provider<NoteUseCase>((ref) {
//   return NoteUseCase(noteRepository: ref.read(noteRepositoryProvider));
// });


final noteRepositoryProvider = StateNotifierProvider<NoteRepositoryImpl, List<NoteEntity>>((ref) => NoteRepositoryImpl());
