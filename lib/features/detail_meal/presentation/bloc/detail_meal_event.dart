import 'package:equatable/equatable.dart';

class DetailMealEvent extends Equatable {

  const DetailMealEvent();

  @override
  List<Object?> get props => [];
}

class GetDetailMeal extends DetailMealEvent {
  final String idMeal;

  const GetDetailMeal({ required this.idMeal});
}