import 'package:Food/blocs/search/search_event.dart';
import 'package:Food/blocs/search/search_state.dart';
import 'package:Food/repository/search/search_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

import '../../utility/enum.dart';
import '../details/meal_details_event.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState>{
  final SearchRepository _searchRepository =SearchRepository();

  SearchBloc():super(const SearchState()){
    on<GetSearchMealList>(_getMealListBySearchKey);
    on<ClearSearchMealList>(_clearSearchMealList);
  }

  void _getMealListBySearchKey(GetSearchMealList event,Emitter<SearchState> emit)async{

    await _searchRepository.getMealListBySearchKey(event.searchKey).then((response){
      emit(state.copyWith(status: ResponseStatus.success,mealList: response));

    }).onError((error,stackTrace){
      debugPrintStack(stackTrace: stackTrace);
      emit(state.copyWith(status: ResponseStatus.failure,error: error.toString()));
    });
  }


  void _clearSearchMealList(ClearSearchMealList event, Emitter<SearchState> emit){
    emit(state.copyWith(status: ResponseStatus.loading,mealList: []));
  }

}