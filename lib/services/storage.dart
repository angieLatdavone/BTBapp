// ignore_for_file: non_constant_identifier_names, unused_local_variable, unused_import, avoid_print, avoid_function_literals_in_foreach_calls

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Storage {
  ///uload image
  // final firebase_storage = FirebaseStorage.instance;

  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<void> Uploadimage(
    String filepath,
    String filename,
  ) async {
    File file = File(filepath);
    try {
      await storage.ref('images/$filename').putFile(file);
    } on firebase_core.FirebaseException catch (e) {
      print(e);
    }
  }

  Future<firebase_storage.ListResult> listFiles() async {
    firebase_storage.ListResult results = await storage.ref('images').listAll();

    results.items.forEach((firebase_storage.Reference ref) {
      print('Found file: $ref');
    });
    return results;
  }
  Future<String> downloadURL(String imageName) async {
    String downloadURL = await storage.ref('images/$imageName').getDownloadURL();
    return downloadURL;
  }
}
