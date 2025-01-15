import 'package:equatable/equatable.dart';

class DashboardState extends Equatable{
  final int selectedTabIndex;
  const DashboardState({this.selectedTabIndex=0});

  DashboardState copyWith({int? index}){
    return DashboardState(
      selectedTabIndex: index??selectedTabIndex
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [selectedTabIndex];

}

