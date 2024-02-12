import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:notetake/core/enums.dart';

import '../../domain/entities/note_entity.dart';
import '../provider/use_case_provider.dart';

class EditNoteScreen extends ConsumerStatefulWidget {
  final int noteIndex;
  ScreenType? screenType;

  EditNoteScreen({super.key, required this.noteIndex, this.screenType});

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
    switch (widget.screenType) {
      case ScreenType.personalNote:
        originalNote = ref
            .read(personalNoteRepositoryProvider.notifier)
            .state[widget.noteIndex];
        break;
      case ScreenType.academicNote:
        originalNote = ref
            .read(academicNoteRepositoryProvider.notifier)
            .state[widget.noteIndex];
        break;
      case ScreenType.workNote:
        originalNote = ref
            .read(workNoteRepositoryProvider.notifier)
            .state[widget.noteIndex];
        break;
      // Add more cases if needed for other ScreenType values
      case ScreenType.othersNote:
        originalNote = ref
            .read(othersNoteRepositoryProvider.notifier)
            .state[widget.noteIndex];
        break;
      default:
        // Handle default case if necessary
        break;
    }

    // originalNote = ref
    //     .read(personalNoteRepositoryProvider.notifier)
    //     .state[widget.noteIndex];
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
              dateTime: DateFormat('dd-MM-yyyy')
                  .format(DateTime.now()) // Update the timestamp if needed
              );
          switch (widget.screenType) {
            case ScreenType.personalNote:
              ref
                  .read(personalNoteRepositoryProvider.notifier)
                  .editNote(editedNote, widget.noteIndex);
              break;
            case ScreenType.academicNote:
              ref
                  .read(academicNoteRepositoryProvider.notifier)
                  .editNote(editedNote, widget.noteIndex);
              break;
            case ScreenType.workNote:
              ref
                  .read(workNoteRepositoryProvider.notifier)
                  .editNote(editedNote, widget.noteIndex);
              break;
            // Add more cases if needed for other ScreenType values
            case ScreenType.othersNote:
              ref
                  .read(othersNoteRepositoryProvider.notifier)
                  .editNote(editedNote, widget.noteIndex);
            default:
              // Handle default case if necessary
              break;
          }

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
