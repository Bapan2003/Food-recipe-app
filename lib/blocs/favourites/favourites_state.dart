import 'package:Food/model/home/meal_model.dart';
import 'package:equatable/equatable.dart';

class FavouritesState extends Equatable{
  final List<MealsModelClass>? favoriteMeals;
  final String? message;


  const FavouritesState({this.favoriteMeals,this.message='',});

  FavouritesState copyWith({List<MealsModelClass>? favoriteMeals,String? message,}){
    return FavouritesState(
        favoriteMeals: favoriteMeals??this.favoriteMeals,
        message: message??this.message,
    );
}

  @override
  // TODO: implement props
  List<Object?> get props => [favoriteMeals,message];

}


