import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/widgets/image_field.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/widgets/is_featured_product.dart';

class AddProductsViewBody extends StatefulWidget {
  const new({super.key});

  @override
  State<AddProductsViewBody> createState() => _AddProductsViewBodyState();
}

class _AddProductsViewBodyState extends State<AddProductsViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product name',
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Price',
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Code',
                textInputType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                hintText: 'Product Description',
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              const SizedBox(height: 16),
              IsFeaturedProduct(onChanged: (value) {}),
              const SizedBox(height: 16),
              ImageField(onImagePicked: (image) {}),
            ],
          ),
        ),
      ),
    );
  }
}
