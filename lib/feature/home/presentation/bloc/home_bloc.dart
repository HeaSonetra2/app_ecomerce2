import 'package:ecomerce_app/feature/home/domain/usecase/get_feed_detail_usecase.dart';
import 'package:ecomerce_app/feature/home/domain/usecase/home_usecase.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_event.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetFeedDetailUsecase getFeedDetailUsecase;
  final HomeUsecase homeUsecase;

  HomeBloc(this.getFeedDetailUsecase, this.homeUsecase)
    : super(HomeInitial()) {
    on<LoadHomeDataEvent>((event, emit) async {
      emit(HomeLoading());
      try {
        final homeData = await homeUsecase();
        emit(
          HomeLoaded(homeData: homeData)    
        );
      } catch (e) {
        emit(HomeError(message: e.toString()));
      }
    });

    on<LoadFeedDetailEvent>((event, emit) async {
      try {
        final feedDetail = await getFeedDetailUsecase(event.Id);

        emit(FeedDetailLoaded(productDetail: feedDetail));
      } catch (e) {
        emit(HomeError(message: e.toString()));
      }
    });
  }
}
