import 'dart:async';
import 'package:dio/dio.dart';
import 'package:food_app/features/detail_meal/data/model/detail_meal_response.dart';

import '../../features/list_meal/data/model/category_response.dart';
import '../../features/list_meal/data/model/meal_response.dart';

class ApiService {
  final Dio _dio = Dio();

  static const String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/';

  Future<CategoryResponse?> getListCategory() async {
    Response? result;
      try {
        result = await _dio.get("${_baseUrl}list.php?c=list");
      } on DioError catch (e) {
        print(e.toString());
      }
      if (result != null) {
        return CategoryResponse.fromJson(result.data);
      }
      return null;
  }

  Future<MealResponse?> getListMealByCategory(String category) async {
    Response? result;
    try {
      result = await _dio.get("${_baseUrl}filter.php?c=$category");
    } on DioError catch (e) {
      print(e.toString());
    }
    if (result != null) {
      return MealResponse.fromJson(result.data);
    }
    return null;
  }

  Future<DetailMealResponse?> getDetailMealById(String idMeal) async {
    Response? result;
    try {
      result = await _dio.get("${_baseUrl}lookup.php?i=$idMeal");
    } on DioError catch (e) {
      print(e.toString());
    }
    if (result != null) {
      return DetailMealResponse.fromJson(result.data);
    }
    return null;
  }


}