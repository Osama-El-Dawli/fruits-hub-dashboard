import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/build_app_bar.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/widgets/add_products_view_body.dart';

class AddProductView extends StatelessWidget {
  const new({super.key});

  static const String routeName = '/add_product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Add Products'),
      body: AddProductsViewBody(),
    );
  }
}
