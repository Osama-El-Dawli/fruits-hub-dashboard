import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/product_repo_impl.dart';
import 'package:fruits_hub_dashboard/core/services/data_service.dart';
import 'package:fruits_hub_dashboard/core/services/fire_storage_service.dart';
import 'package:fruits_hub_dashboard/core/services/firestore_sevice.dart';
import 'package:fruits_hub_dashboard/core/services/storage_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageService>(FireStorageService());
  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(storageService: getIt<StorageService>()),
  );
  getIt.registerSingleton<DatabaseService>(FireStoreService());
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(databaseService: getIt<DatabaseService>()),
  );
}
