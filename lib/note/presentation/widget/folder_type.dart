import 'package:flutter/material.dart';
import 'package:notetake/core/extensions.dart';

class FolderType extends StatelessWidget {
  const FolderType({
    super.key,
    required this.imagePath,
    required this.folderType,
    required this.numberOfDocuments,
    this.onTap,
    required this.numberOfFiles,
  });

  final String imagePath, folderType, numberOfDocuments;
  final void Function()? onTap;
  final int numberOfFiles;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Image.asset('assets/images/folder.png'),
          Positioned(
            top: 50,
            left: 60,
            child: Image.asset(
              imagePath.png,
            ),
          ),
          Positioned(
            top: 130,
            left: 60,
            child: Text(
              folderType,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: 150,
            left: 60,
            child: numberOfFiles > 1
                ? Text('$numberOfDocuments Files')
                : Text('$numberOfDocuments File'),
          ),
        ],
      ),
    );
  }
}
