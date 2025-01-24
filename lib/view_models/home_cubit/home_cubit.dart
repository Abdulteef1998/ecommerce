import 'package:bloc/bloc.dart';
import 'package:ecomerece/models/home_carosel_item_model.dart';

import '../../models/prudact_item_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  void getHomeData() {
    emit(HomeLoading());
    Future.delayed(const Duration(seconds: 1), () {
      emit(HomeLoaded(
          carouselItems: dummyHomeCarouselItems, products: dummyPrudactIs));
    });
  }
}
