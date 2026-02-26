import 'package:ecomerce_app/feature/order/data/model/cart_item_model.dart';
import 'package:ecomerce_app/feature/order/data/model/cart_model.dart';
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
  List<CartItemModel> _localCartItems = [];
  CartModel? _originalCart;
  bool _hasLocalChanges = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetCartBloc>().add(GetCartDetailEvent());
  }

  void _updateLocalCartItems(int productId, int delta) {
    setState(() {
      final index = _localCartItems.indexWhere((item) => item.id == productId);
      if (index != -1) {
        final item = _localCartItems[index];
        final newQuantity = item.quantity + delta;
        if (newQuantity > 0) {
          //Update qty in local list
          _localCartItems[index] = CartItemModel(
            id: item.id,
            name: item.name,
            quantity: newQuantity,
            price: item.price,
            subtotal: item.price * newQuantity,
            inStock: item.inStock,
          );
          _hasLocalChanges = true;
        } else {
          //Remove item from local list
          _localCartItems.removeAt(index);
          _hasLocalChanges = true;
        }
      }
    });
  }

  double _calculateLocalCartTotal() {
    return _localCartItems.fold(0, (sum, item) => sum + item.subtotal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart'), backgroundColor: Colors.green),
      body: BlocBuilder<GetCartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartLoaded) {
            final cartDetail = state.cartDetail;
             
            if (!_hasLocalChanges && _localCartItems.isEmpty) {
              _localCartItems = List.from(cartDetail.items);
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartDetail.items.length,
                    itemBuilder: (context, index) {
                      final item = cartDetail.items[index];
                      final isAvailable = item.quantity > 0;

                      final newItem = _localCartItems[index];
                      return Padding(
                        padding: const EdgeInsets.all(12),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Price: \$${item.price.toStringAsFixed(2)}',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  _buildQuantityControl(newItem, isAvailable),
                                  SizedBox(height: 4),
                                  Text(
                                    '\$${item.subtotal.toStringAsFixed(2)}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Subtotal', style: TextStyle(fontSize: 16)),
                            Text(
                              '\$${cartDetail.cartTotal.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery Fee',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '\$${cartDetail.deliveryFee.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tax', style: TextStyle(fontSize: 16)),
                            Text(
                              '\$${cartDetail.tax.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (state is CartError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('Your cart is empty'));
        },
      ),
    );
  }

  Widget _buildQuantityControl(CartItemModel item, bool isAvalable) {
    final isDecrementEnabled = item.quantity > 0;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: isDecrementEnabled
                ? () {
                    // Handle decrease quantity
                    _updateLocalCartItems(item.id, -1);
                    print(
                      '============================Decreased quantity of ${item.name} ${item.quantity}',
                    );
                  }
                : null,
          ),
          Text(item.quantity.toString(), style: const TextStyle(fontSize: 16)),
          IconButton(
            icon: const Icon(Icons.add_circle_outline),
            onPressed: isAvalable
                ? () {
                    // Handle increase quantity
                    _updateLocalCartItems(item.id, 1);
                    print(
                      '============================Increased quantity of ${item.name}',
                    );
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
