import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar_admin_panel/image_picker_service.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final appBarTitleController = TextEditingController();
  final imagePickerService = ImagePickerService();

  Uint8List? selectedImage;

  @override
  Widget build(BuildContext context) {
    Future<T?> showAlertDialog<T>(String text) {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(text),
        ),
      );
    }

    void sendDataToDB() async {
      if (titleController.text.trim() != "" &&
          contentController.text.trim() != "" &&
          appBarTitleController.text.trim() != "" &&
          selectedImage != null) {
        await imagePickerService.saveToDatabase(
          title: titleController.text.trim(),
          content: contentController.text.trim(),
          appBarTitle: appBarTitleController.text.trim(),
          image: selectedImage!,
        );
        showAlertDialog('Data has been sent successfuly');
      } else {
        showAlertDialog("Text fields must be full and image must be loaded");
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                label: Text('title'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(
                label: Text('content'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: appBarTitleController,
              decoration: const InputDecoration(
                label: Text('appBarTitle'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButtonWidget(
                  text: "Galery",
                  onPressed: () async {
                    selectedImage =
                        await imagePickerService.pickImageFromGalery();
                    setState(() {});
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: selectedImage != null
                  ? SizedBox(width: 300, child: Image.memory(selectedImage!))
                  : const Text("There is no image selected"),
            ),
            const SizedBox(height: 30),
            OutlinedButtonWidget(
              onPressed: sendDataToDB,
              text: "Send",
              width: 200,
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}

class OutlinedButtonWidget extends StatelessWidget {
  const OutlinedButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    this.width = 100,
    this.height = 100,
  });

  final String text;
  final void Function()? onPressed;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
