import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:notetake/core/enums.dart';
import 'package:notetake/note/domain/entities/note_entity.dart';

import '../provider/use_case_provider.dart';

class AddNoteScreen extends ConsumerStatefulWidget {
  AddNoteScreen({super.key, this.screenType});

  ScreenType? screenType;

  @override
  ConsumerState<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends ConsumerState<AddNoteScreen> {

  final TextEditingController _titleTextEditingController = TextEditingController();

  final TextEditingController _descriptionTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add A Note'),
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
          final newNote = NoteEntity(
              title: _titleTextEditingController.text,
              description: _descriptionTextEditingController.text,
              dateTime: DateFormat('dd-MM-yyyy').format(DateTime.now()));

          switch (widget.screenType) {
            case ScreenType.personalNote:
              ref
                  .read(personalNoteRepositoryProvider.notifier)
                  .addNote(newNote);
              break;
            case ScreenType.academicNote:
              ref
                  .read(academicNoteRepositoryProvider.notifier)
                  .addNote(newNote);
              break;
            // Add more cases if needed for other ScreenType values
            case ScreenType.workNote:
              ref.read(workNoteRepositoryProvider.notifier).addNote(newNote);
              break;
            case ScreenType.othersNote:
              ref.read(othersNoteRepositoryProvider.notifier).addNote(newNote);
              break;
            default:
              // Handle default case if necessary
              break;
          }

          Navigator.pop(context);
          print(_descriptionTextEditingController.text.length);
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


