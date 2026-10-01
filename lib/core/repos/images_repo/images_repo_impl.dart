import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/core/errors/failures.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:fruits_hub_dashboard/core/utils/backend_endpoints.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageService _storageService;

  new({required this._storageService});
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url = await _storageService.uploadFile(
        file: image,
        path: BackendEndPoints.images,
      );
      return Right(url);
    } catch (e) {
      return Left(ServerFailure('Failed to upload image'));
    }
  }
}
