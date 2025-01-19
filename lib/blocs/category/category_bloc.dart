import 'package:Food/blocs/category/category_event.dart';
import 'package:Food/blocs/category/category_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../repository/dashboard/category_repository.dart';
import '../../utility/enum.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState>{
  final CategoryRepository _mealListByCategory =CategoryRepository();

  CategoryBloc():super(const CategoryState()){
    on<GetAllMealByCategory>(_getAllMealsByCategory);
  }

  void _getAllMealsByCategory(GetAllMealByCategory event,Emitter<CategoryState> emit)async{
    await _mealListByCategory.getMealListByCategoryName(event.strCategory).then((response){
      emit(state.copyWith(status: ResponseStatus.success,mealListByCategory: response));

    }).onError((error,stackTrace){
      debugPrintStack(stackTrace: stackTrace);
      emit(state.copyWith(status: ResponseStatus.failure,error: error.toString()));
    });

  }

}