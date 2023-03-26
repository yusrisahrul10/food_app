import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/list_meal/presentation/bloc/category/category_bloc.dart';
import 'package:food_app/features/list_meal/presentation/bloc/meal/meal_bloc.dart';
import 'package:food_app/features/list_meal/presentation/ui/home_screen.dart';

import 'core/network/api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      theme: ThemeData(
        fontFamily: 'lato',
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CategoryBloc(apiService: ApiService())),
          BlocProvider(create: (context) => MealBloc(apiService: ApiService())),
        ],
        child: const HomeScreen(),
      ),
    );
  }
}