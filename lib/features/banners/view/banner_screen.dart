import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:traktor_family_gastro_bar_admin_panel/core/ui/database_constants.dart';
import 'package:traktor_family_gastro_bar_admin_panel/features/banners/services/image_picker_service.dart';

class BannerScreen extends StatefulWidget {
  const BannerScreen({super.key});

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
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
        showAlertDialog('Data has been sent successfully');
        titleController.clear();
        contentController.clear();
        appBarTitleController.clear();
      } else {
        showAlertDialog("Text fields must be full and image must be loaded");
      }
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                label: Text('Title'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: contentController,
              decoration: const InputDecoration(
                label: Text('Content'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: appBarTitleController,
              decoration: const InputDecoration(
                label: Text('AppBar Title'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButtonWidget(
                  text: "Gallery",
                  onPressed: () async {
                    selectedImage =
                        await imagePickerService.pickImageFromGallery();
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
            ),
            const SizedBox(height: 30),
            const DataListWidget(),
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
          shape: WidgetStateProperty.all(
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

class DataListWidget extends StatefulWidget {
  const DataListWidget({super.key});

  @override
  State<DataListWidget> createState() => _DataListWidgetState();
}

class _DataListWidgetState extends State<DataListWidget> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _deleteItem(String id) async {
    await _firestore
        .collection(DatabaseCollections.bannersCollection)
        .doc(id)
        .delete();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore
          .collection(DatabaseCollections.bannersCollection)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text('Error fetching data.'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No data available.'));
        }

        final banners = snapshot.data!.docs;

        return ListView.builder(
          shrinkWrap: true, 
          physics:
              const NeverScrollableScrollPhysics(),
          itemCount: banners.length,
          itemBuilder: (context, index) {
            final banner = banners[index];
            final data = banner.data() as Map<String, dynamic>;

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(data['title']),
                subtitle: Text(data['content']),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _deleteItem(banner.id);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
