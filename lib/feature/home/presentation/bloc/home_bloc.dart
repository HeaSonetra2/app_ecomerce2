import 'package:ecomerce_app/feature/home/domain/usecase/get_banner_usecase.dart';
import 'package:ecomerce_app/feature/home/domain/usecase/get_best_seller.dart';
import 'package:ecomerce_app/feature/home/domain/usecase/get_feed_detail_usecase.dart';
import 'package:ecomerce_app/feature/home/domain/usecase/get_feed_usecase.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_event.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBannersUseCase getBannersUseCase;
  final GetFeedUsecase getFeedUsecase;
  final GetBestSellerUsecase getBestSellerUsecase;
  final GetFeedDetailUsecase getFeedDetailUsecase;

  HomeBloc(
    this.getBannersUseCase,
    this.getFeedUsecase,
    this.getBestSellerUsecase,
    this.getFeedDetailUsecase,
  ) : super(HomeInitial()) {
    on<LoadHomeDataEvent>((event, emit) async {
      try {
        final banners = await getBannersUseCase();
        final feeds = await getFeedUsecase();
        final bestSellers = await getBestSellerUsecase();

        emit(
          HomeLoaded(banners: banners, feeds: feeds, bestSeller: bestSellers),
        );
        print('FEEDS: ${feeds.length}');
        print('BEST SELLER: ${bestSellers.length}');
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
