import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notetake/note/presentation/pages/academic_note_screen.dart';
import 'package:notetake/note/presentation/pages/others_note_screen.dart';
import 'package:notetake/note/presentation/pages/personal_note_screen.dart';
import 'package:notetake/note/presentation/pages/work_note_screen.dart';

import '../provider/use_case_provider.dart';
import '../widget/folder_type.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final personalNotes = ref.watch(personalNoteRepositoryProvider);
          final academicNotes = ref.watch(academicNoteRepositoryProvider);
          final workNotes = ref.watch(workNoteRepositoryProvider);
          final otherNotes = ref.watch(othersNoteRepositoryProvider);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: FolderType(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const PersonalNoteScreen();
                          },
                        ));
                      },
                      folderType: 'Personal',
                      imagePath: 'personal',
                      numberOfFiles: personalNotes.length,
                      numberOfDocuments: personalNotes.length.toString(),
                    ),
                  ),
                  Expanded(
                    child: FolderType(
                      numberOfFiles: academicNotes.length,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const AcademicNoteScreen();
                          },
                        ));
                      },
                      folderType: "Academic",
                      imagePath: 'academic',
                      numberOfDocuments: academicNotes.length.toString(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: FolderType(
                      numberOfFiles: workNotes.length,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const WorkNoteScreen();
                          },
                        ));
                      },
                      folderType: 'Work',
                      imagePath: 'work',
                      numberOfDocuments: workNotes.length.toString(),
                    ),
                  ),
                  Expanded(
                    child: FolderType(
                      numberOfFiles: otherNotes.length,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const OthersNoteScreen();
                          },
                        ));
                      },
                      folderType: 'Others',
                      imagePath: 'others',
                      numberOfDocuments: otherNotes.length.toString(),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
