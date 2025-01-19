
import 'package:equatable/equatable.dart';

abstract class MealDetailsEvent extends Equatable{

}

class GetMealDetails extends MealDetailsEvent{
  final int id;
  GetMealDetails({required this.id});
  @override
  // TODO: implement props
  List<Object?> get props =>[id];

}