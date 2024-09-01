import 'package:flutter/material.dart';
import 'package:test_project/features/item/domain/entities/item_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/features/item/presentation/bloc/item_bloc.dart';

import '../../../../core/constants/spacing.dart';
import 'empty_state_widget.dart';
import 'item_card.dart';

class ItemListWidget extends StatelessWidget {
  final List<ItemEntity> items;

  const ItemListWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final spacing = ResponsiveSpacing(context);

    if (items.isEmpty) {
      return Center(
        child: EmptyStateWidget(spacing: spacing),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.all(spacing.mediumSpacing),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ItemCard(
          item: item,
          spacing: spacing,
          onDelete: () {
            BlocProvider.of<ItemBloc>(context).add(DeleteItemEvent(item.id));
          },
        );
      },
    );
  }
}
