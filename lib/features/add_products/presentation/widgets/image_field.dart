import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onImagePicked});
  final ValueChanged<File?> onImagePicked;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () async {
        setState(() {
          isLoading = true;
        });
        try {
          await pickImage();
        } catch (e) {
          setState(() {
            isLoading = false;
          });
        }
        setState(() {
          isLoading = false;
        });
      },
      child: Skeletonizer(
        enabled: isLoading,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(16),
              ),
              child: imageFile != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(imageFile!, fit: BoxFit.cover),
                    )
                  : Icon(Icons.image_outlined, size: 180),
            ),
            Visibility(
              visible: imageFile != null,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    imageFile = null;
                    widget.onImagePicked(imageFile);
                  });
                },
                icon: Icon(Icons.delete, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    imageFile = File(image!.path);
    widget.onImagePicked(imageFile);
  }
}
