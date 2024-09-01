import 'package:flutter/material.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/constants/text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final double?
      customWidth; // Added optional customWidth to allow for default width

  const CustomButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.customWidth,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double buttonWidth = customWidth ?? screenWidth * 0.25;
    final double buttonHeight = screenWidth * 0.1;

    return Container(
      width: buttonWidth,
      height: buttonHeight,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(buttonHeight / 2),
        border: Border.all(
          color: AppColors.cancelButtonBorderColor,
          width: 1.0,
        ),
      ),
      child: Center(
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: backgroundColor,
          ),
          child: Text(
            text,
            style: AppTextStyles.bold14(context).copyWith(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
