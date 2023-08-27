import 'package:flutter/material.dart';
import 'package:image_grid_demo_app/common/string_management.dart';
import 'package:image_grid_demo_app/view/image_viewer.dart';

class ImageDetailView extends StatelessWidget {
  final dynamic imageItem;

  const ImageDetailView({Key? key, required this.imageItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var hashTag = StringManagement.addHashtags(imageItem['galSearchKeyword']);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              imageItem['galTitle'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageViewer(
                      imageItem: imageItem,
                    ),
                  ),
                );
              },
              child: Image.network(
                imageItem['galWebImageUrl'],
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              imageItem['galPhotographyLocation'],
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              hashTag,
              style: const TextStyle(color: Colors.lightBlue),
            ),
          ],
        ),
      ),
    );
  }
}
