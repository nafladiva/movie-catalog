import 'package:bloc/bloc.dart';

class NavbarCubit extends Cubit<int> {
  NavbarCubit() : super(0);

  void changeIndex(int index) => emit(index);

  void getMoviePage() => emit(0);

  void getTVShowPage() => emit(1);

  void getWatchlistPage() => emit(2);
}
