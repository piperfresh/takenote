import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notetake/note/presentation/pages/personal_note_screen.dart';

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
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Consumer(
      //     builder: (context, ref, child) {
      //       final notes = ref.watch(noteRepositoryProvider);
      //       return notes.isEmpty
      //           ? const Center(child: Text('No Note Yet'))
      //           : Padding(
      //               padding: const EdgeInsets.only(bottom: 50.0),
      //               child: StaggeredGridView.countBuilder(
      //                 padding: EdgeInsets.zero,
      //                 crossAxisCount: 2,
      //                 crossAxisSpacing: 20,
      //                 mainAxisSpacing: 16,
      //                 scrollDirection: Axis.vertical,
      //                 // to display different size of tile
      //                 staggeredTileBuilder: (index) {
      //                   final note = notes[index];
      //                   final descriptionLength = note.description?.length;
      //
      //                   double tileHeight = descriptionLength! > 110
      //                       ? 240
      //                       : descriptionLength > 50 && descriptionLength < 89
      //                           ? descriptionLength.toDouble() + 110
      //                           : descriptionLength > 90
      //                               ? descriptionLength.toDouble() + 120
      //                               : descriptionLength > 18
      //                                   ? descriptionLength.toDouble() + 100
      //                                   : descriptionLength < 10
      //                                       ? descriptionLength.toDouble() + 95
      //                                       : descriptionLength.toDouble() +
      //                                           note.dateTime!.length +
      //                                           85;
      //                   return StaggeredTile.extent(
      //                       (index % 2 == 0) ? 1 : 1, tileHeight);
      //                 },
      //                 itemCount: notes.length,
      //                 itemBuilder: (context, index) {
      //                   final note = notes[index];
      //                   return GestureDetector(
      //                     onTap: () {
      //                       Navigator.push(
      //                         context,
      //                         MaterialPageRoute(
      //                           builder: (context) =>
      //                               EditNoteScreen(noteIndex: index),
      //                         ),
      //                       );
      //                     },
      //                     onLongPress: () {
      //                       ref
      //                           .read(noteRepositoryProvider.notifier)
      //                           .deleteNote(index);
      //                     },
      //                     child: StaggerTile(
      //                       title: note.title!,
      //                       description: note.description!,
      //                       dateTime:
      //                           DateFormat('dd-MM-yyyy').format(DateTime.now()),
      //                     ),
      //                   );
      //                 },
      //               ),
      //             );
      //     },
      //   ),
      // ),
      body: Consumer(
        builder: (context, ref, child) {
          final notes = ref.watch(noteRepositoryProvider);
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
                      numberOfFiles: notes.length,
                      numberOfDocuments: notes.length.toString(),
                    ),
                  ),
                  Expanded(
                    child: FolderType(
                      numberOfFiles: 5,
                      onTap: () {},
                      folderType: "Academic",
                      imagePath: 'academic',
                      numberOfDocuments: '30',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: FolderType(
                      numberOfFiles: 6,
                      onTap: () {},
                      folderType: 'Work',
                      imagePath: 'work',
                      numberOfDocuments: '5',
                    ),
                  ),
                  Expanded(
                    child: FolderType(
                      numberOfFiles: 5,
                      onTap: () {},
                      folderType: 'Others',
                      imagePath: 'others',
                      numberOfDocuments: '25',
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
      // floatingActionButton: GestureDetector(
      //   onTap: () {
      //     Navigator.push(context, MaterialPageRoute(
      //       builder: (context) {
      //         return const AddNoteScreen();
      //       },
      //     ));
      //   },
      //   child: Container(
      //     height: 56,
      //     width: 177,
      //     decoration: const BoxDecoration(
      //       color: Color(0xff6B4EFF),
      //       borderRadius: BorderRadius.all(
      //         Radius.circular(20),
      //       ),
      //     ),
      //     child: const Center(
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Icon(
      //             Icons.add,
      //             color: Colors.white,
      //           ),
      //           Text(
      //             'Add New Note',
      //             style: TextStyle(color: Colors.white),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
