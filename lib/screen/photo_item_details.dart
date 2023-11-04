import 'package:flutter/material.dart';

class PhotoItemScreen extends StatefulWidget {
  final String title, url;
  final int id;
  const PhotoItemScreen(
      {super.key, required this.title, required this.url, required this.id});

  @override
  State<PhotoItemScreen> createState() => _PhotoItemScreenState();
}

class _PhotoItemScreenState extends State<PhotoItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.network(widget.url),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Title : ${widget.title}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
                child: Text(
              "ID : ${widget.id}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
