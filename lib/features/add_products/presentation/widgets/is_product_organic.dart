import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_styles.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/widgets/custom_check_box.dart';

class IsOrganicProduct extends StatefulWidget {
  const IsOrganicProduct({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<IsOrganicProduct> createState() => _IsOrganicProductState();
}

class _IsOrganicProductState extends State<IsOrganicProduct> {
  bool isOrganic = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCheckBox(
          isChecked: isOrganic,
          onChecked: (value) {
            setState(() {
              isOrganic = value;
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
                  text: 'Is Organic Product ?',
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
