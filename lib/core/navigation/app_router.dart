import 'package:flutter/material.dart';
import 'package:test_project/features/item/presentation/pages/item_page.dart';
import 'package:test_project/core/constants/strings.dart';

import '../../features/item/presentation/pages/form_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppStrings.itemPageRoute:
        return MaterialPageRoute(builder: (_) => const ItemPage());
      case AppStrings.itemFormRoute:
        return MaterialPageRoute(builder: (_) => const ItemFormPage());
      default:
        return null;
    }
  }
}
