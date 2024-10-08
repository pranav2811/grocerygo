import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoOrderPage extends StatefulWidget {
  const PhotoOrderPage({super.key});

  @override
  _PhotoOrderPageState createState() => _PhotoOrderPageState();
}

class _PhotoOrderPageState extends State<PhotoOrderPage> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85, // Adjust quality if needed
    );
    if (photo != null) {
      setState(() {
        _imageFile = File(photo.path);
      });
    }
  }

  void _placeOrder() {
    if (_imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please capture a photo before placing the order.')),
      );
      return;
    }
    // Implement the logic to send the photo to the backend and place the order
    // For example, upload the image file to the server

    // Show confirmation message
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Order Placed'),
        content: const Text('Your order has been placed successfully!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Optionally, navigate back or reset the state
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoPreview() {
    return _imageFile == null
        ? Container(
            height: 300,
            color: Colors.grey[200],
            child: const Center(
              child: Text(
                'No image captured',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          )
        : Image.file(
            _imageFile!,
            height: 300,
            fit: BoxFit.cover,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order by Photo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildPhotoPreview(),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _takePhoto,
              icon:const Icon(Icons.camera_alt),
              label: const Text('Capture Order Photo'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                minimumSize: const Size(double.infinity, 50),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: _placeOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
