import 'package:ecomerce_app/feature/order/domain/usecase/get_cart_usecase.dart';
import 'package:ecomerce_app/feature/order/presentation/bloc/cart_event.dart';
import 'package:ecomerce_app/feature/order/presentation/bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCartBloc extends Bloc<CartEvent, CartState> {
  final GetCartUseCase getCartUseCase;

  GetCartBloc(this.getCartUseCase) : super(CartInitial()) {
    on<GetCartDetailEvent>((event, emit) async {
      emit(CartLoading());
      try {
        final cartDetail = await getCartUseCase();
        emit(CartLoaded(cartDetail: cartDetail));
      } catch (e) {
        emit(CartError(message: e.toString()));
      }
    });
  }
}