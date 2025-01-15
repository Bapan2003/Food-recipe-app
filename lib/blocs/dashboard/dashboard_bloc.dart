import 'package:Food/blocs/dashboard/dashboard_event.dart';
import 'package:Food/blocs/dashboard/dashboard_state.dart';
import 'package:bloc/bloc.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState>{
  DashboardBloc():super(const DashboardState()){
     on<SetTabIndex>(_setTabIndex);
  }

  void _setTabIndex(SetTabIndex event,Emitter<DashboardState> emit){
    emit(state.copyWith(index: event.index));
  }

}