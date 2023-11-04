import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/screen/photo_item_details.dart';
import 'package:http/http.dart' as http;

class PhotoGalleryListScreen extends StatefulWidget {
  const PhotoGalleryListScreen({super.key});

  @override
  State<PhotoGalleryListScreen> createState() => _PhotoGalleryListScreenState();
}

class _PhotoGalleryListScreenState extends State<PhotoGalleryListScreen> {
  List<Photos> listOfPhotos = [];

  Future<List<Photos>> getPhotos() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        for (Map photoData in data) {
          Photos photos = Photos(
              title: photoData["title"],
              id: photoData['id'],
              url: photoData["url"]);
          listOfPhotos.add(photos);
        }
        return listOfPhotos;
      } else {
        throw Exception('Failed to load images');
      }
    } catch (e) {
      print('Error Type: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Gallery App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getPhotos(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    return ListView.separated(
                      itemCount: listOfPhotos.length,
                      separatorBuilder: (context, index) => const Divider(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PhotoItemScreen(
                                          title: snapshot.data![index].title
                                              .toString(),
                                          url: snapshot.data![index].url
                                              .toString(),
                                          id: snapshot.data![index].id,
                                        )));
                          },
                          leading:
                              Image.network(listOfPhotos[index].url.toString()),
                          title: Text(
                            listOfPhotos[index].title.toString(),
                            style: const TextStyle(fontSize: 18),
                          ),
                        );
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class Photos {
  final String title, url;
  final int id;
  Photos({
    required this.title,
    required this.id,
    required this.url,
  });
}
