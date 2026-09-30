import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/widgets/custom_check_box.dart';

class IsFeaturedProduct extends StatefulWidget {
  const IsFeaturedProduct({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<IsFeaturedProduct> createState() => _IsFeaturedProductState();
}

class _IsFeaturedProductState extends State<IsFeaturedProduct> {
  bool isFeatured = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCheckBox(
          isChecked: isFeatured,
          onChecked: (value) {
            setState(() {
              isFeatured = value;
              widget.onChanged(value);
            });
          },
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Is Featured Product ?',
                  style: AppTextStyles.semiBold13.copyWith(
                    color: AppColors.lightPrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
