import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/shared/utils/result_data.dart';
import 'package:food_app/features/detail_meal/presentation/bloc/detail_meal_bloc.dart';
import 'package:food_app/features/detail_meal/presentation/bloc/detail_meal_event.dart';
import 'package:food_app/features/detail_meal/presentation/bloc/detail_meal_state.dart';
import 'package:food_app/features/detail_meal/presentation/widget/share_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widget/arrow_back_button.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.idMeal}) : super(key: key);
  final String idMeal;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  void _loadDetailMeal(BuildContext context) {
    context.read<DetailMealBloc>().add(GetDetailMeal(idMeal: widget.idMeal));
  }

  @override
  void initState() {
    super.initState();
    _loadDetailMeal(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          BlocBuilder<DetailMealBloc, DetailMealState>(
              builder: (context, state) {
            final status = state.detailMealState.status;
            if (status.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (status.isError) {
              return Center(child: Text(state.detailMealState.message));
            } else if (status.isEmpty) {
              return Center(child: Text(state.detailMealState.message));
            } else if (status.isLoaded) {
              final detailMeal = state.detailMealState.data?.meals ?? [];
              List<dynamic> ingredient =
                  state.detailMealState.data!.meals.isNotEmpty
                      ? [
                          state.detailMealState.data!.meals[0].strIngredient1,
                          state.detailMealState.data!.meals[0].strIngredient2,
                          state.detailMealState.data!.meals[0].strIngredient3,
                          state.detailMealState.data!.meals[0].strIngredient4,
                          state.detailMealState.data!.meals[0].strIngredient5,
                          state.detailMealState.data!.meals[0].strIngredient6,
                          state.detailMealState.data!.meals[0].strIngredient7,
                          state.detailMealState.data!.meals[0].strIngredient8,
                          state.detailMealState.data!.meals[0].strIngredient9,
                          state.detailMealState.data!.meals[0].strIngredient10,
                          state.detailMealState.data!.meals[0].strIngredient11,
                          state.detailMealState.data!.meals[0].strIngredient12,
                          state.detailMealState.data!.meals[0].strIngredient13,
                          state.detailMealState.data!.meals[0].strIngredient14,
                          state.detailMealState.data!.meals[0].strIngredient15,
                          state.detailMealState.data!.meals[0].strIngredient16,
                          state.detailMealState.data!.meals[0].strIngredient17,
                          state.detailMealState.data!.meals[0].strIngredient18,
                          state.detailMealState.data!.meals[0].strIngredient19,
                          state.detailMealState.data!.meals[0].strIngredient20,
                        ]
                      : [];

              List<dynamic> measure =
                  state.detailMealState.data!.meals.isNotEmpty
                      ? [
                          state.detailMealState.data!.meals[0].strMeasure1,
                          state.detailMealState.data!.meals[0].strMeasure2,
                          state.detailMealState.data!.meals[0].strMeasure3,
                          state.detailMealState.data!.meals[0].strMeasure4,
                          state.detailMealState.data!.meals[0].strMeasure5,
                          state.detailMealState.data!.meals[0].strMeasure6,
                          state.detailMealState.data!.meals[0].strMeasure7,
                          state.detailMealState.data!.meals[0].strMeasure8,
                          state.detailMealState.data!.meals[0].strMeasure9,
                          state.detailMealState.data!.meals[0].strMeasure10,
                          state.detailMealState.data!.meals[0].strMeasure11,
                          state.detailMealState.data!.meals[0].strMeasure12,
                          state.detailMealState.data!.meals[0].strMeasure13,
                          state.detailMealState.data!.meals[0].strMeasure14,
                          state.detailMealState.data!.meals[0].strMeasure15,
                          state.detailMealState.data!.meals[0].strMeasure16,
                          state.detailMealState.data!.meals[0].strMeasure17,
                          state.detailMealState.data!.meals[0].strMeasure18,
                          state.detailMealState.data!.meals[0].strMeasure19,
                          state.detailMealState.data!.meals[0].strMeasure20,
                        ]
                      : [];

              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Container(
                          height: 250,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: detailMeal.isNotEmpty
                                ? DecorationImage(
                                    image: NetworkImage(
                                      detailMeal[0].strMealThumb,
                                    ),
                                    fit: BoxFit.cover)
                                : null,
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          detailMeal[0].strMeal,
                                          maxLines: 5,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                      ShareButton(
                                        MealTitle: detailMeal[0].strMeal,
                                        shareLink: detailMeal[0].strYoutube,
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        detailMeal[0].strCategory,
                                        style: const TextStyle(
                                          color: Color(0xffC3211A),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '-',
                                        style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        detailMeal[0].strArea,
                                        style: const TextStyle(
                                          color: Color(0xffC3211A),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Instruction',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    detailMeal[0].strInstructions,
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Divider(
                                      height: 1,
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    'Ingredient & Measure',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: 20,
                                    itemBuilder: (context, index) {
                                      return ingredient[index] != "" &&
                                              ingredient[index] != null
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    ' - ' + ingredient[index],
                                                    style: TextStyle(
                                                      color:
                                                          Colors.grey.shade800,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  measure[index] != "" &&
                                                          measure[index] != null
                                                      ? Text(
                                                          ': ' + measure[index],
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey.shade600,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w200,
                                                          ),
                                                        )
                                                      : Container(),
                                                ],
                                              ),
                                            )
                                          : Container();
                                    },
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  detailMeal[0].strTags != null
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: Divider(
                                                  height: 1,
                                                  color: Colors.grey.shade200,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              const Text(
                                                'Tags',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                ' - ' + detailMeal[0].strTags,
                                                style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ])
                                      : Container(),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 40),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(-1, 1),
                            blurRadius: 5,
                            color: Color.fromARGB(117, 0, 0, 0),
                          )
                        ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                final String url =
                                detailMeal[0].strYoutube;

                                await launch(
                                  url,
                                  forceSafariVC:
                                  false, // false : launching your url in another Browser of iOS
                                  forceWebView:
                                  false, //  false :launching your url in another Browser of Android
                                  enableJavaScript: true, // Android
                                );
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color(0xffC3211A),
                                    boxShadow: const [
                                      BoxShadow(
                                        offset: Offset(0, 2),
                                        blurRadius: 5,
                                        color: Color.fromARGB(117, 0, 0, 0),
                                      )
                                    ]),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Watch it Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              );
            } else {
              return const SizedBox();
            }
          }),
          const ArrowBackButton(),
        ],
      ),
    );
  }
}
