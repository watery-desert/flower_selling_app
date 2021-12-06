import 'package:bloc/bloc.dart';



class ThemeCubit extends Cubit<bool> {
  ThemeCubit() : super(true);

  void changeToDark() {
    emit(false);
  }

  void changeToLight() {
    emit(true);
  }
}
