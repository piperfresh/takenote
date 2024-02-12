import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';
import 'package:notetake/note/presentation/provider/use_case_provider.dart';

import '../../../core/enums.dart';
import '../widget/staggered_tile.dart';
import 'add_note_screen.dart';
import 'edit_note_screen.dart';

class OthersNoteScreen extends StatefulWidget {
  const OthersNoteScreen({super.key});

  @override
  State<OthersNoteScreen> createState() => _OthersNoteScreenState();
}

class _OthersNoteScreenState extends State<OthersNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer(
          builder: (context, ref, child) {
            final notes = ref.watch(othersNoteRepositoryProvider);
            return notes.isEmpty
                ? const Center(child: Text('No Note Yet'))
                : Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: StaggeredGridView.countBuilder(
                padding: EdgeInsets.zero,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 16,
                scrollDirection: Axis.vertical,
                // to display different size of tile
                staggeredTileBuilder: (index) {
                  final note = notes[index];
                  final descriptionLength = note.description?.length;

                  double tileHeight = descriptionLength! > 110
                      ? 240
                      : descriptionLength > 50 && descriptionLength < 89
                      ? descriptionLength.toDouble() + 110
                      : descriptionLength > 90
                      ? descriptionLength.toDouble() + 120
                      : descriptionLength > 18
                      ? descriptionLength.toDouble() + 100
                      : descriptionLength < 10
                      ? descriptionLength.toDouble() + 95
                      : descriptionLength.toDouble() +
                      note.dateTime!.length +
                      85;
                  return StaggeredTile.extent(
                      (index % 2 == 0) ? 1 : 1, tileHeight);
                },
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  final note = notes[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditNoteScreen(
                            noteIndex: index,
                            screenType: ScreenType.othersNote,
                          ),
                        ),
                      );
                    },
                    onLongPress: () {
                      ref
                          .read(othersNoteRepositoryProvider.notifier)
                          .deleteNote(index);
                    },
                    child: StaggerTile(
                      title: note.title!,
                      description: note.description!,
                      dateTime:
                      DateFormat('dd-MM-yyyy').format(DateTime.now()),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return AddNoteScreen(
                screenType: ScreenType.othersNote,
              );
            },
          ));
        },
        child: Container(
          height: 56,
          width: 177,
          decoration: const BoxDecoration(
            color: Color(0xff6B4EFF),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                Text(
                  'Add New Note',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
