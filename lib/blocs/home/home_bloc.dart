import 'package:Food/blocs/home/home_event.dart';
import 'package:Food/blocs/home/home_state.dart';
import 'package:Food/model/home/meal_category_model.dart';
import 'package:Food/model/home/meal_model.dart';
import 'package:Food/model/home/popular_meal_model.dart';
import 'package:Food/repository/dashboard/home_repo.dart';
import 'package:Food/utility/enum.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  final HomeRepository _homeRepository =HomeRepository();
  HomeBloc():super(const HomeState()){
    on<GetRandomMeal>(_getRandomMeal);
    on<GetPopularMealList>(_getPopularMealList);
    on<GetMealCategory>(_getMealCategory);
  }


  void _getRandomMeal(GetRandomMeal event,Emitter<HomeState> emit) async{
      await _homeRepository.getMealList().then((MealsModelClass mealsList){
          emit(state.copyWith(
            randomMealStatus: ResponseStatus.success,
            mealsModelClass: mealsList,
          ));
      }).onError((error, stackTrace){
        debugPrint(stackTrace.toString());
        emit(state.copyWith(
            randomMealStatus: ResponseStatus.failure,
            randomMealError: error.toString()));
      });
  }

  void _getPopularMealList(GetPopularMealList event,Emitter<HomeState> emit) async{
      await _homeRepository.getPopularMealsList().then((List<PopularMealModel>mealsList){
          emit(state.copyWith(
            popularMealStatus: ResponseStatus.success,
            popularMealList: mealsList,
          ));
      }).onError((error, stackTrace){
        debugPrint(stackTrace.toString());
        emit(state.copyWith(
            popularMealStatus: ResponseStatus.failure,
            popularMealError: error.toString()));
      });
  }



  void _getMealCategory(GetMealCategory event,Emitter<HomeState> emit) async{
      await _homeRepository.getCategoryMealsList().then((List<MealCategoryModel>mealsList){
          emit(state.copyWith(
            mealCategoryList: mealsList,
            mealCategoryStatus: ResponseStatus.success
          ));
      }).onError((error, stackTrace){
        debugPrint(stackTrace.toString());
        emit(state.copyWith(
            mealCategoryStatus: ResponseStatus.failure,
            mealCategoryError: error.toString()));
      });
  }
}