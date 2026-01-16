import 'package:ecomerce_app/feature/home/domain/usecase/get_banner_usecase.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_event.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetBannersUseCase getBannersUseCase;

  HomeBloc( this.getBannersUseCase):super(HomeInitial()){
    on<LoadHomeDataEvent>((event,emit) async{
      try{
          final banners=await getBannersUseCase();

          emit(HomeLoaded(banners: banners));
      }catch(e){
            emit(HomeError(message: e.toString()));
      }
    });
  }
}
