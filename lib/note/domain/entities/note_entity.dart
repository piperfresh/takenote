import 'package:equatable/equatable.dart';

class NoteEntity extends Equatable {
  String? id;
  String? title;
  String? description;
  DateTime? dateTime;

  NoteEntity({
    this.title,
    this.description,
    this.dateTime,
    this.id,
  });

  // Convert NoteEntity to a Map
  Map<String, dynamic> toJson() {
    return {'title': title, 'description': description};
  }

  // Create a NoteEntity from a Map
  factory NoteEntity.fromJson(Map<String, dynamic> json) {
    return NoteEntity(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        title,
        description,
        dateTime,
        id,
      ];
}
