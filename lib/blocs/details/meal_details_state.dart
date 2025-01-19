import 'package:Food/utility/enum.dart';
import 'package:equatable/equatable.dart';

import '../../model/home/meal_model.dart';


class MealDetailsState extends Equatable{
  final MealsModelClass? mealsModelClass;
  final ResponseStatus? status;
  final String error;

  const MealDetailsState({this.mealsModelClass,this.status=ResponseStatus.loading,this.error=''});

  MealDetailsState copyWith({MealsModelClass? mealsModelClass,ResponseStatus? status,String? error}){
    return MealDetailsState(
      mealsModelClass: mealsModelClass??this.mealsModelClass,
      status: status??this.status,
      error: error??this.error
    );
  }


  @override
  // TODO: implement props
  List<Object?> get props => [mealsModelClass,status,error];
}