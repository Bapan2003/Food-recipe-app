import 'package:Food/model/api_response/api_response.dart';
import 'package:Food/model/home/meal_category_model.dart';
import 'package:Food/model/home/meal_model.dart';
import 'package:Food/model/home/popular_meal_model.dart';
import 'package:Food/utility/enum.dart';
import 'package:equatable/equatable.dart';

 class HomeState extends Equatable{
  final MealsModelClass? mealsModelClass;
  final List<MealCategoryModel>? mealCategoryList;
  final List<PopularMealModel>? popularMealList;
   final ResponseStatus? randomMealStatus;
   final String randomMealError;
  final ResponseStatus? popularMealStatus;
  final String popularMealError;
  final ResponseStatus? mealCategoryStatus;
  final String mealCategoryError;

   const HomeState({
    this.mealsModelClass,
    this.mealCategoryList=const [],
    this.popularMealList=const [],
    this.randomMealStatus=ResponseStatus.loading,
    this.randomMealError='',
    this.popularMealStatus=ResponseStatus.loading,
    this.popularMealError='',
    this.mealCategoryStatus=ResponseStatus.loading,
    this.mealCategoryError=''
   });

   HomeState copyWith({MealsModelClass? mealsModelClass,List<MealCategoryModel>? mealCategoryList,List<PopularMealModel>?popularMealList, ResponseStatus? randomMealStatus, String? randomMealError,
    ResponseStatus? popularMealStatus, String? popularMealError,ResponseStatus? mealCategoryStatus, String? mealCategoryError
   }){
     return HomeState(
       mealsModelClass: mealsModelClass?? this.mealsModelClass,
       mealCategoryList: mealCategoryList?? this.mealCategoryList,
       popularMealList: popularMealList??this.popularMealList,
       randomMealStatus: randomMealStatus?? this.randomMealStatus,
       randomMealError: randomMealError?? this.randomMealError,
       popularMealStatus: popularMealStatus??this.popularMealStatus,
       popularMealError: popularMealError??this.popularMealError,
       mealCategoryStatus: mealCategoryStatus??this.mealCategoryStatus,
       mealCategoryError: mealCategoryError??this.mealCategoryError,
     );
   }
  @override
  List<Object?> get props => [mealsModelClass,randomMealStatus,randomMealError,mealCategoryList,popularMealStatus,popularMealError,mealCategoryStatus,mealCategoryError];

}