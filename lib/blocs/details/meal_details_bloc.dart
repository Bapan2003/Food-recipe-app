import 'package:Food/blocs/details/meal_details_event.dart';
import 'package:Food/blocs/details/meal_details_state.dart';
import 'package:Food/repository/details/meal_details_repository.dart';
import 'package:Food/utility/enum.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

class MealDetailsBloc extends Bloc<MealDetailsEvent, MealDetailsState>{
  final MealDetailsRepository _mealDetailsRepository =MealDetailsRepository();

  MealDetailsBloc():super(const MealDetailsState()){
    on<GetMealDetails>(_getMealDetailsById);
  }

  void _getMealDetailsById(GetMealDetails event,Emitter<MealDetailsState> emit)async{
    await _mealDetailsRepository.getMealDetailsById(event.id).then((response){
      emit(state.copyWith(status: ResponseStatus.success,mealsModelClass: response));

    }).onError((error,stackTrace){
      debugPrintStack(stackTrace: stackTrace);
      emit(state.copyWith(status: ResponseStatus.failure,error: error.toString()));
    });

  }

}