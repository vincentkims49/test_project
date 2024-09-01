import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/constants/text_styles.dart';

class EmptyStateWidget extends StatelessWidget {
  final ResponsiveSpacing spacing;

  const EmptyStateWidget({super.key, required this.spacing});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(spacing.mediumSpacing),
      margin: EdgeInsets.only(bottom: spacing.smallSpacing),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            offset: Offset(0, 1),
            blurRadius: 2,
          ),
        ],
        border: Border.all(
          color: AppColors.borderColor,
          width: 1.0,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(spacing.mediumSpacing),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.info_outline,
              size: 50,
              color: AppColors.textColor,
            ),
            SizedBox(height: spacing.mediumSpacing),
            Text(
              'No items available',
              style: AppTextStyles.title14(context).copyWith(
                color: AppColors.textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
