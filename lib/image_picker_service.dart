import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:traktor_family_gastro_bar_admin_panel/core/ui/database_constants.dart';

class ImagePickerService {
  final _imagePicker = ImagePicker();
  final _storage = FirebaseStorage.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<Uint8List> pickImageFromGallery() async {
    final selectedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    return await selectedImage!.readAsBytes();
  }

  Future<String> uploadImageToStorage(String child, Uint8List? image) async {
    final ref = _storage.ref().child(child);
    final uploadTask = ref.putData(image!);
    final downloadedURL = await (await uploadTask).ref.getDownloadURL();
    return downloadedURL;
  }

  Future<void> saveToDatabase({
    required String title,
    required String content,
    required String appBarTitle,
    required Uint8List image,
  }) async {
    String imageURL = await uploadImageToStorage('banners/${image.hashCode}', image);
    await _firestore.collection(DatabaseCollections.bannersCollection).add({
      'title': title,
      'content': content,
      'appBarTitle': appBarTitle,
      'imageURL': imageURL
    });
  }
}
