import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/product_repo.dart';
import 'package:fruits_hub_dashboard/core/services/get_it.dart';
import 'package:fruits_hub_dashboard/core/widgets/build_app_bar.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/manager/cubit/add_products_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/widgets/add_products_view_body_bloc_consumer.dart';

class AddProductView extends StatelessWidget {
  const new({super.key});

  static const String routeName = '/add_product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Add Products'),
      body: BlocProvider(
        create: (context) => AddProductsCubit(
          imagesRepo: getIt<ImagesRepo>(),
          productRepo: getIt<ProductRepo>(),
        ),
        child: AddProductsViewBodyBlocConsumer(),
      ),
    );
  }
}
