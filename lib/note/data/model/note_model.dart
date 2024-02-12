import 'package:notetake/note/domain/entities/note_entity.dart';

class NoteModel extends NoteEntity {
  NoteModel({
    String? title,
    String? description,
    DateTime? dateTime,
    String? id,
  }) : super(
          title: title,
          description: description,
          id: id,
          dateTime: dateTime,
        );

  factory NoteModel.fromEntity(NoteEntity noteEntity) {
    return NoteModel(
      title: noteEntity.title,
      description: noteEntity.description,
      dateTime: noteEntity.dateTime,
      id: noteEntity.id,
    );
  }
}
