import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/note_entity.dart';
import '../provider/use_case_provider.dart';

class EditNoteScreen extends ConsumerStatefulWidget {
  final int noteIndex;
  const EditNoteScreen({super.key, required this.noteIndex});

  @override
  ConsumerState<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends ConsumerState<EditNoteScreen> {
  late NoteEntity originalNote;
  final TextEditingController _titleTextEditingController = TextEditingController();
  final TextEditingController _descriptionTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    originalNote = ref.read(noteRepositoryProvider.notifier).state[widget.noteIndex];
    _titleTextEditingController.text = originalNote.title!;
    _descriptionTextEditingController.text = originalNote.description!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Note'),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Title'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: _titleTextEditingController,
              decoration: const InputDecoration(
                hintText: 'Add a title',
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text('Description'),
            const SizedBox(
              height: 5,
            ),
            TextField(
              controller: _descriptionTextEditingController,
              decoration: const InputDecoration(
                hintText: 'Add a Description',
              ),
              maxLines: 6,
              minLines: 1,
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          log('title ${_titleTextEditingController.text}');
          log('description ${_descriptionTextEditingController.text}');
          final editedNote = NoteEntity(
            title: _titleTextEditingController.text,
            description: _descriptionTextEditingController.text,
            dateTime: DateFormat('dd-MM-yyyy').format(DateTime.now()) // Update the timestamp if needed
          );
          ref.read(noteRepositoryProvider.notifier).editNote(editedNote, widget.noteIndex);
          Navigator.pop(context);
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: const BoxDecoration(
            color: Color(0xff6B4EFF),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
