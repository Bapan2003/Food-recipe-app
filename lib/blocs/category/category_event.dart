import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable{

}

class GetAllMealByCategory extends CategoryEvent{
  final String strCategory;
  GetAllMealByCategory({required this.strCategory});
  @override
  // TODO: implement props
  List<Object?> get props =>[strCategory];

}