import 'package:Food/model/home/meal_model.dart';
import 'package:Food/utility/enum.dart';
import 'package:equatable/equatable.dart';

 class HomeState extends Equatable{
  final MealsModelClass? mealsModelClass;
   final ResponseStatus status;
   final String error;

   const HomeState({this.mealsModelClass, this.status=ResponseStatus.loading,this.error=''});

   HomeState compyWith({MealsModelClass? mealsModelClass, ResponseStatus? status, String? error}){
     return HomeState(
       mealsModelClass: mealsModelClass,
       status: status??this.status,
       error: error?? this.error
     );
   }
  @override
  List<Object?> get props => [mealsModelClass,status,error];

}