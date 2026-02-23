

import 'package:ecomerce_app/feature/order/presentation/bloc/cart_bloc.dart';
import 'package:ecomerce_app/feature/order/presentation/bloc/cart_event.dart';
import 'package:ecomerce_app/feature/order/presentation/bloc/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetCartBloc>().add(GetCartDetailEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: BlocBuilder<GetCartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartLoaded) {
            final cartDetail = state.cartDetail;
            return ListView.builder(
              itemCount: cartDetail.items.length,
              itemBuilder: (context, index) {
                final item = cartDetail.items[index];
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text('Quantity: ${item.quantity}'),
                  trailing: Text('\$${item.price}'),
                );
              },
            );
          } else if (state is CartError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Your cart is empty'));
        },
      ),
    );
  }
}