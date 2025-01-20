import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable{

}

class GetSearchMealList extends SearchEvent{
  final String searchKey;
  GetSearchMealList({required this.searchKey});
  @override
  // TODO: implement props
  List<Object?> get props =>[searchKey];

}

class ClearSearchMealList extends SearchEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}