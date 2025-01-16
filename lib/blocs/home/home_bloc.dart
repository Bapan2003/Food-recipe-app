import 'package:Food/blocs/home/home_event.dart';
import 'package:Food/blocs/home/home_state.dart';
import 'package:Food/model/home/meal_model.dart';
import 'package:Food/repository/home_repo.dart';
import 'package:Food/utility/enum.dart';
import 'package:bloc/bloc.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
  final HomeRepository _homeRepository =HomeRepository();
  HomeBloc():super(const HomeState()){
    on<GetRandomMeal>(_getRandomMeal);
  }


  void _getRandomMeal(GetRandomMeal event,Emitter<HomeState> emit) async{
      await _homeRepository.getMealList().then((List<MealsModelClass>mealsList){
          emit(state.compyWith(
            mealsModelClass: mealsList[0],
            status: ResponseStatus.success
          ));
      }).onError((error, stackTrace){
        emit(state.compyWith(
            status: ResponseStatus.failure,
            error: error.toString()));
      });
  }
}