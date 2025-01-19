import 'package:Food/model/home/meal_model.dart';

abstract class FavoritesEvent {}

class InitializeFavorites extends FavoritesEvent {}

class AddFavorite extends FavoritesEvent {
  final MealsModelClass meal;

  AddFavorite(this.meal);
}

class RemoveFavorite extends FavoritesEvent {
  final String mealId;

  RemoveFavorite(this.mealId);
}
