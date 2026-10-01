import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/functions/custom_toast_message.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_loading_progress_hud.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/manager/cubit/add_products_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/widgets/add_products_view_body.dart';

class AddProductsViewBodyBlocConsumer extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductsCubit, AddProductsState>(
      listener: (context, state) {
        if (state is AddProductsSuccess) {
          toastMsg(msg: 'Product Added Successfully');
        }
        if (state is AddProductsFailure) {
          toastMsg(msg: state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomLoadingProgressHud(
          isLoading: state is AddProductsLoading,
          child: AddProductsViewBody(),
        );
      },
    );
  }
}
