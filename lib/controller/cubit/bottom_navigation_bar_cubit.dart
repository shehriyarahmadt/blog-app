import 'package:bloc/bloc.dart';


class BottomNavigationBarCubit extends Cubit<int> {
  BottomNavigationBarCubit(int initialState) : super(initialState);


  changeIndex({required index}){
    emit(index);
  }


}
