import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/features/item/presentation/bloc/item_bloc.dart';
import 'package:test_project/features/item/data/models/item_model.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/spacing.dart';
import '../../../../core/constants/text_styles.dart';
import '../widgets/app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_form_field.dart';

class ItemFormPage extends StatefulWidget {
  const ItemFormPage({super.key});

  @override
  ItemFormPageState createState() => ItemFormPageState();
}

class ItemFormPageState extends State<ItemFormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final spacing = ResponsiveSpacing(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: ResponsiveAppBar(
        title: 'Add Item',
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: MediaQuery.of(context).size.width * 0.06,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(spacing.mediumSpacing),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        offset: Offset(0, 1),
                        blurRadius: 2,
                      ),
                    ],
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.borderColor,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '*',
                              style: AppTextStyles.star(context),
                            ),
                            TextSpan(
                              text: ' Indicates required fields',
                              style: AppTextStyles.italic12(context).copyWith(
                                color: AppColors.textColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: spacing.smallSpacing),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Item Title ',
                              style: AppTextStyles.title14(context).copyWith(
                                color: AppColors.textColor,
                              ),
                            ),
                            TextSpan(
                              text: '*',
                              style: AppTextStyles.star(context),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: spacing.smallSpacing),
                      CustomTextFormField(
                        controller: _titleController,
                        hintText: 'Enter a title for the item',
                        isTitle: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Title is required';
                          }
                          if (value.length < 3) {
                            return 'Title must be at least 3 characters long';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: spacing.smallSpacing),
                      Text(
                        "Description",
                        style: AppTextStyles.title14(context).copyWith(
                          color: AppColors.textColor,
                        ),
                      ),
                      SizedBox(height: spacing.smallSpacing),
                      CustomTextFormField(
                        controller: _descriptionController,
                        hintText: 'Add description',
                        maxLines: 5,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Description is required';
                          }
                          if (value.length < 10) {
                            return 'Description must be at least 10 characters long';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: spacing.largeSpacing),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      text: 'Cancel',
                      backgroundColor: Colors.white,
                      textColor: AppColors.cancelButtonBorderColor,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    CustomButton(
                      text: 'Add Items',
                      backgroundColor: AppColors.addButtonColor,
                      textColor: AppColors.addButtonTextColor,
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          final item = ItemModel(
                            id: 0,
                            title: _titleController.text,
                            description: _descriptionController.text,
                          );

                          BlocProvider.of<ItemBloc>(context)
                              .add(AddItemEvent(item));
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
