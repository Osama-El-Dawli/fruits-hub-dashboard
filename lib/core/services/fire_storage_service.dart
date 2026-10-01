import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as p;

class FireStorageService implements StorageService {
  final _storageReference = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile({required File file, required String path}) async {
    String fileName = p.basename(file.path);
    String extensionName = p.extension(file.path);
    var fileReference = _storageReference.child(
      '$path/$fileName.$extensionName',
    );
    await fileReference.putFile(file);
    final fileUrl = await fileReference.getDownloadURL();
    return fileUrl;
  }
}
