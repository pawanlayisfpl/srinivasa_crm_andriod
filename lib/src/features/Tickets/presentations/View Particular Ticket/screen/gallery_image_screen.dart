import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:srinivasa_crm_new/src/config/locator/locator.dart';
import 'package:srinivasa_crm_new/src/core/core.dart';
import '../../../../../config/constants/key_value_strings.dart';

class ImageGalleryPage extends StatefulWidget {
  final List<String> imageUrls; // List of image URLs
  final int initialIndex; // The index of the image to display initially

  const ImageGalleryPage({
    required this.imageUrls,
    this.initialIndex = 0,
    super.key,
  });

  @override
  State<ImageGalleryPage> createState() => _ImageGalleryPageState();
}

class _ImageGalleryPageState extends State<ImageGalleryPage> {
  final PageController _pageController = PageController();
  final List<Uint8List> _images = []; // List to hold image bytes
  bool _isLoading = true; // State to show loading indicator

  @override
  void initState() {
    super.initState();
    _fetchAllImages(); // Fetch all images when the widget is initialized
  }

  Future<Uint8List> fetchImageWithToken(String url) async {
    String? token = locator.get<KeyValueStorage>().getString(KeyValueStrings.token);
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to load image');
    }
  }

  Future<void> _fetchAllImages() async {
    try {
      for (String url in widget.imageUrls) {
        final bytes = await fetchImageWithToken(url);
        _images.add(bytes); // Add image bytes to the list
      }
    } catch (e) {
      // Handle errors if needed
      debugPrint('Error fetching images: $e');
    } finally {
      setState(() {
        _isLoading = false; // Hide the loading indicator
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal, // Horizontal scrolling
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return InteractiveViewer(
                  clipBehavior: Clip.none,
                  panEnabled: true,
                  scaleEnabled: true,
                  minScale: 1.0,
                  maxScale: 4.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Image.memory(
                        _images[index],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
