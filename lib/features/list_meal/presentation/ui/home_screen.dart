import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/features/detail_meal/presentation/bloc/detail_meal_bloc.dart';
import 'package:food_app/features/detail_meal/presentation/ui/detail_screen.dart';
import 'package:food_app/features/list_meal/presentation/bloc/category/category_bloc.dart';
import 'package:food_app/features/list_meal/presentation/bloc/category/category_event.dart';
import 'package:food_app/features/list_meal/presentation/bloc/meal/meal_bloc.dart';
import 'package:food_app/features/list_meal/presentation/bloc/meal/meal_event.dart';
import 'package:food_app/features/list_meal/presentation/bloc/meal/meal_state.dart';
import 'package:food_app/shared/utils/result_data.dart';

import '../../../../core/network/api_service.dart';
import '../bloc/category/category_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _loadCategory(BuildContext context) {
    context.read<CategoryBloc>().add(GetCategory());
  }

  void _loadMealByCategory(BuildContext context, String category) {
    context.read<MealBloc>().add(GetMeal(categoryMeal: category));
  }

  @override
  void initState() {
    super.initState();
    _loadCategory(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<CategoryBloc, CategoryState>(
                    builder: (context, state) {
                  final status = state.categoryState.status;
                  if (status.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (status.isError) {
                    return Center(child: Text(state.categoryState.message));
                  } else if (status.isEmpty) {
                    return Center(child: Text(state.categoryState.message));
                  } else if (status.isLoaded) {
                    final mealItems = state.categoryState.data?.meals ?? [];
                    _loadMealByCategory(context, mealItems[0].strCategory);
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: DropdownButtonFormField2(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        isExpanded: true,
                        hint: Text(
                          mealItems[0].strCategory,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w800),
                        ),
                        items: mealItems
                            .map((item) => DropdownMenuItem<String>(
                                  value: item.strCategory,
                                  child: Text(
                                    item.strCategory,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          //Do something when changing the item if you want.
                          _loadMealByCategory(context, value.toString());
                        },
                        onSaved: (value) {

                        },
                        buttonStyleData: const ButtonStyleData(
                          height: 60,
                          padding: EdgeInsets.only(left: 20, right: 10),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 30,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
                BlocBuilder<MealBloc, MealState>(builder: (context, state) {
                  final status = state.mealState.status;
                  if (status.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (status.isError) {
                    return Center(child: Text(state.mealState.message));
                  } else if (status.isEmpty) {
                    return Center(child: Text(state.mealState.message));
                  } else if (status.isLoaded) {
                    final mealItems = state.mealState.data?.meals ?? [];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: mealItems.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BlocProvider<DetailMealBloc>(
                                          create: (context) => DetailMealBloc(apiService: ApiService()),
                                          child: DetailScreen(
                                              idMeal: mealItems[index].idMeal),
                                        )));
                              },
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 5, top: 5, bottom: 5, right: 5),
                                width: 160,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 2),
                                        blurRadius: 5,
                                        color: Color.fromARGB(76, 0, 0, 0),
                                      )
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          color: Colors.grey.shade300,
                                          image: mealItems.isNotEmpty
                                              ? DecorationImage(
                                                  image: NetworkImage(
                                                    mealItems[index]
                                                        .strMealThumb,
                                                  ),
                                                  fit: BoxFit.cover)
                                              : null,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 8),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            mealItems[index].strMeal,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    );
                  } else {
                    return const SizedBox();
                  }
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
