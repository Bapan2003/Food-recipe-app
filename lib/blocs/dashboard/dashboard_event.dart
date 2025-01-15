import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable{
   @override
   // TODO: implement props
   List<Object?> get props => [];
}

class SetTabIndex extends DashboardEvent{
   final int index;
   SetTabIndex({required this.index});


   @override
   // TODO: implement props
   List<Object?> get props => [index];
}