import 'package:equatable/equatable.dart';

class NoteEntity extends Equatable {
  String? id;
  String? title;
  String? description;
  String? dateTime;

  NoteEntity({
    this.title,
    this.description,
    this.dateTime,
    this.id,
  });

  // Convert NoteEntity to a Map
  Map<String, dynamic> toJson() {
    return {'title': title, 'description': description, 'dateTime': dateTime, 'id': id};
  }

  // Create a NoteEntity from a Map
  factory NoteEntity.fromJson(Map<String, dynamic> json) {
    return NoteEntity(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      id: json['id'] ?? '',
      dateTime: json['dateTime'] ?? '',
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
