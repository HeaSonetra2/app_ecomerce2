import 'package:ecomerce_app/feature/order/domain/usecase/add_cart_usecase.dart';
import 'package:ecomerce_app/feature/order/domain/usecase/get_cart_usecase.dart';
import 'package:ecomerce_app/feature/order/domain/usecase/update_qty_cart_usecase.dart';
import 'package:ecomerce_app/feature/order/presentation/bloc/cart_event.dart';
import 'package:ecomerce_app/feature/order/presentation/bloc/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCartBloc extends Bloc<CartEvent, CartState> {
  final AddCartUseCase addCartUseCase;
  final GetCartUseCase getCartUseCase;
  final UpdateQtyCartUseCase updateQtyCartUseCase;

  GetCartBloc(this.addCartUseCase, this.getCartUseCase, this.updateQtyCartUseCase) : super(CartInitial()) {
    on<GetCartDetailEvent>((event, emit) async {
      emit(CartLoading());
      try {
        final cartDetail = await getCartUseCase();
        emit(CartLoaded(cartDetail: cartDetail));
      } catch (e) {
        emit(CartError(message: e.toString()));
      }
    });

      on<UpdateCartQtyEvent>((event, emit) async {
        emit(CartLoading());
        try {
          final cartDetail = await updateQtyCartUseCase(event.productId, event.quantity);
          emit(CartLoaded(cartDetail: cartDetail));
        } catch (e) {
          emit(CartError(message: e.toString()));
        }
      });
      on<AddCartEvent>((event, emit) async {
        emit(CartLoading());
        try {
          final cartDetail = await addCartUseCase(event.productId, event.quantity);
          emit(CartLoaded(cartDetail: cartDetail));
        } catch (e) {
          emit(CartError(message: e.toString()));
        }
      });
  }
}