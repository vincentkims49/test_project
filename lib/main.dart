import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/features/item/presentation/bloc/item_bloc.dart';
import 'package:test_project/injection_container.dart' as di;

import 'core/constants/strings.dart';
import 'core/navigation/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init(); // Initialize the dependency injection container
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ItemBloc>(
          create: (context) => di.sl<ItemBloc>()..add(GetItemsEvent()),
        ),
        // Add other BLoCs here if needed
      ],
      child: MaterialApp(
        title: 'Test Project',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // Optionally, include theme customization
        ),
        onGenerateRoute:
            AppRouter().onGenerateRoute, // Use AppRouter for routing
        initialRoute: AppStrings.itemPageRoute, // Set initial route
      ),
    );
  }
}
