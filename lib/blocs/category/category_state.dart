import 'package:Food/utility/enum.dart';
import 'package:equatable/equatable.dart';

import '../../model/category/meal_by_category.dart';

class CategoryState extends Equatable{
  final List<MealByCategoryModel>? mealListByCategory;
  final ResponseStatus? status;
  final String? error;

  const CategoryState({this.mealListByCategory,this.status=ResponseStatus.loading,this.error=''});

  CategoryState copyWith({List<MealByCategoryModel>? mealListByCategory,ResponseStatus? status,String? error}){
    return CategoryState(
        mealListByCategory:mealListByCategory??this.mealListByCategory,
        status: status??this.status,
        error: error?? this.error
    );
  }


  @override
  // TODO: implement props
  List<Object?> get props => [mealListByCategory,status,error];

}