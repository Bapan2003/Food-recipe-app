
import 'package:Food/blocs/favourites/favourites_state.dart';
import 'package:Food/model/home/meal_model.dart';
import 'package:Food/utility/app_settings.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'favourites_event.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavouritesState> {
  FavoritesBloc():super(const FavouritesState()){

    on<InitializeFavorites>(_initializeFavorites);
    on<AddFavorite>(_addFavorite);
    on<RemoveFavorite>(_removeFavorite);

  }

  void _initializeFavorites(InitializeFavorites event, Emitter<FavouritesState> emit) async {
    final cachedFavorites = await AppSettings.getAllFavourites();
    emit(state.copyWith(favoriteMeals: cachedFavorites));
  }

  Future<void> _addFavorite(AddFavorite event, Emitter<FavouritesState> emit) async {

    try {
      // Get the current list of favorites or initialize a new list
      final currentFavorites = state.favoriteMeals ?? [];
      final updatedFavorites = List<MealsModelClass>.from(currentFavorites)..add(event.meal);

      // Save the updated list to SharedPreferences
      await AppSettings.saveFavorites(updatedFavorites);
      Fluttertoast.showToast(msg: 'Meal added to favorites!',backgroundColor: Colors.green);

      // Emit the updated state
      emit(state.copyWith(
        favoriteMeals: updatedFavorites,
        message: 'Meal added to favorites!',
      ));
    } catch (e) {
      emit(state.copyWith(
        message: 'Failed to add meal to favorites.',
      ));
    }
  }

  Future<void> _removeFavorite(RemoveFavorite event, Emitter<FavouritesState> emit) async {

     try{
       // Get the current list of favorites
       final currentFavorites = state.favoriteMeals ?? [];
       final updatedFavorites = currentFavorites.where((meal) => meal.idMeal != event.mealId).toList();

       // Save the updated list to SharedPreferences
       await AppSettings.saveFavorites(updatedFavorites);
       Fluttertoast.showToast(msg: 'Meal removed from favorites!',backgroundColor: Colors.green);
       // Emit the updated state
       emit(state.copyWith(
         favoriteMeals: updatedFavorites,
         message: 'Meal removed from favorites!',
       ));
     }catch(e,stackTrace){
       debugPrintStack(stackTrace: stackTrace);
       emit(state.copyWith(
         message: 'Failed to add meal to favorites.',
       ));
     }

  }





}

