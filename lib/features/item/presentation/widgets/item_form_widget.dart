import 'package:flutter/material.dart';
import 'package:test_project/features/item/domain/entities/item_entity.dart';

class ItemFormWidget extends StatefulWidget {
  final ItemEntity? item;

  const ItemFormWidget({super.key, this.item});

  @override
  ItemFormWidgetState createState() => ItemFormWidgetState();
}

class ItemFormWidgetState extends State<ItemFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _description;

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      _title = widget.item!.title;
      _description = widget.item!.description;
    } else {
      _title = '';
      _description = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: _title,
            decoration: const InputDecoration(labelText: 'Title'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a title';
              }
              return null;
            },
            onSaved: (value) {
              _title = value!;
            },
          ),
          TextFormField(
            initialValue: _description,
            decoration: const InputDecoration(labelText: 'Description'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a description';
              }
              return null;
            },
            onSaved: (value) {
              _description = value!;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // Handle form submission (e.g., call BLoC to add or update item)
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
