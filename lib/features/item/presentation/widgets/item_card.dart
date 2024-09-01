import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/constants/text_styles.dart';
import '../../domain/entities/item_entity.dart';

class ItemCard extends StatelessWidget {
  final ItemEntity item;
  final ResponsiveSpacing spacing;
  final VoidCallback onDelete;

  const ItemCard({
    super.key,
    required this.item,
    required this.spacing,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  item.title,
                  style: AppTextStyles.title14(context).copyWith(
                    color: AppColors.textColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onDelete,
                child: SvgPicture.asset(
                  'lib/assets/icons/delete.svg',
                  width: 20,
                  height: 20,
                ),
              ),
            ],
          ),
          Text(
            item.description,
            style: AppTextStyles.regular12(context).copyWith(
              color: AppColors.textColor,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}
