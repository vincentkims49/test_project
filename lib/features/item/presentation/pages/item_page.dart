import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/features/item/presentation/bloc/item_bloc.dart';
import 'package:test_project/features/item/presentation/widgets/item_list_widget.dart';
import 'package:test_project/core/constants/strings.dart';

import '../../../../core/constants/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/custom_button.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: ResponsiveAppBar(
        title: 'Test App',
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            size: MediaQuery.of(context).size.width * 0.07,
          ),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CustomButton(
              text: '+ New',
              backgroundColor: AppColors.cancelButtonBorderColor,
              textColor: Colors.white,
              onPressed: () =>
                  Navigator.pushNamed(context, AppStrings.itemFormRoute),
            ),
          ),
        ],
      ),
      body: BlocBuilder<ItemBloc, ItemState>(
        builder: (context, state) {
          if (state is ItemLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ItemLoaded) {
            return ItemListWidget(items: state.items);
          } else if (state is ItemError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No items available'));
          }
        },
      ),
    );
  }
}
