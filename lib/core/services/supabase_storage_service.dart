import 'dart:io';

import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:path/path.dart' as p;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService implements StorageService {
  final _supabase = Supabase.instance.client;
  @override
  Future<String> uploadFile({required File file, required String path}) async {
    String fileName = p.basename(file.path);
    String fileExtenstion = p.extension(file.path);
    await _supabase.storage
        .from('fruits_images')
        .upload('$path/$fileName.$fileExtenstion', file);

    var url = _supabase.storage
        .from('fruits_images')
        .getPublicUrl('$path/$fileName.$fileExtenstion');
    return url;
  }
}
