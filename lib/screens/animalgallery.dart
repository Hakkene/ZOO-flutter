import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class AnimalGallery extends StatefulWidget {
  const AnimalGallery({super.key});
  @override
  _AnimalGalleryState createState() => _AnimalGalleryState();
}

class _AnimalGalleryState extends State<AnimalGallery> {
  List<String>? imagePaths; // Nullable list

  @override
  void initState() {
    super.initState();
    loadImages();
  }

  Future<void> loadImages() async {
    try {
      final manifestContent = await rootBundle.loadString('AssetManifest.json');
      final manifestMap =
          Map<String, dynamic>.from(jsonDecode(manifestContent));
      final imagePathList = manifestMap.keys
          .where((String key) => key.contains('assets/images/animals'))
          .toList();
      setState(() {
        imagePaths = imagePathList;
      });
    } catch (e) {
      print('Error loading images: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galeria'),
      ),
      body: imagePaths != null &&
              imagePaths!
                  .isNotEmpty // Check if imagePaths is not null and not empty
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 140 / 140,
              ),
              itemCount: imagePaths!.length,
              itemBuilder: (context, index) {
                final imagePath = imagePaths![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      print("${imagePath}");
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              child:
                  CircularProgressIndicator(), // Placeholder for loading indicator
            ),
    );
  }
}
