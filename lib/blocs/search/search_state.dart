
import 'package:equatable/equatable.dart';

import '../../model/home/meal_model.dart';
import '../../utility/enum.dart';

class SearchState extends Equatable{
  final List<MealsModelClass>? mealList;
  final ResponseStatus? status;
  final String error;

  const SearchState({this.mealList,this.status=ResponseStatus.loading,this.error=''});

  SearchState copyWith({List<MealsModelClass>? mealList,ResponseStatus? status,String? error}){
    return SearchState(
        mealList: mealList??this.mealList,
        status: status??this.status,
        error: error??this.error
    );
  }


  @override
  // TODO: implement props
  List<Object?> get props => [mealList,status,error];
}