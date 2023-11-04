import 'package:flutter/material.dart';
import 'package:flutter_assignment/screen/photo_list_screen.dart';

void main() {
  runApp(const GalleryApp());
}

class GalleryApp extends StatelessWidget {
  const GalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PhotoGalleryListScreen(),
    );
  }
}
