import 'package:flutter_bloc/flutter_bloc.dart';

enum BottomNavState { store, myBooks, listening, reading }

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavState.store);

  void selectItem(BottomNavState item) {
    emit(item);
  }
}
