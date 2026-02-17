import 'package:ecomerce_app/core/theme/app_colors.dart';
import 'package:ecomerce_app/core/theme/text_style.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_event.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_state.dart';
import 'package:ecomerce_app/feature/home/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatefulWidget {
  final int productId;
  const DetailScreen({super.key, required this.productId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var counter = 1;
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadFeedDetailEvent(Id: widget.productId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is HomeError) {
            return Center(
              child: Column(
                children: [
                  Text('Error:${state.message}'),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(
                        LoadFeedDetailEvent(Id: widget.productId),
                      );
                    },
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          }
          if (state is FeedDetailLoaded) {
            var star = state.productDetail.review;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 380,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(31, 208, 8, 8),
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(34),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(34),
                        ),
                        child: Image.network(
                          state.productDetail.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      right: 20,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.save_alt_rounded),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Text(
                        state.productDetail.name,
                        style: AppTextStyle.heading1,
                      ),
                      Spacer(),
                      state.productDetail.isFav
                          ? Icon(Icons.favorite, color: Colors.red)
                          : Icon(Icons.favorite_border_outlined),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Text(
                        '${state.productDetail.qty}',
                        style: AppTextStyle.smallGrey,
                      ),
                      Text('kg', style: AppTextStyle.smallGrey),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Divider(color: Colors.grey[400]),
                ),
                SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (counter > 1) {
                              counter--;
                            }
                          });
                        },
                        icon: Icon(Icons.remove),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(child: Text('${counter}')),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (counter < state.productDetail.qty) {
                              counter++;
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: ScaffoldMessenger(
                                    child: Text('Low stock'),
                                  ),
                                ),
                              );
                            }
                          });
                        },
                        icon: Icon(Icons.add),
                      ),
                      Spacer(),
                      Text(
                        '\$${state.productDetail.price}',
                        style: AppTextStyle.heading1,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    'Product Description',
                    style: AppTextStyle.heading2,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    state.productDetail.desc,
                    style: AppTextStyle.smallGrey,
                  ),
                ),
                SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Divider(color: Colors.grey[400]),
                ),
                SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Text('Nutritions', style: AppTextStyle.heading2),
                      Spacer(),
                      Container(
                        width: 80,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[500],
                        ),
                        child: Center(
                          child: Text('${state.productDetail.nutrition}'),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Divider(color: Colors.grey[400]),
                ),
                SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Text('Review', style: AppTextStyle.heading2),
                      Spacer(),
                      for (var i = 0; i < star; i++)
                        Icon(Icons.star, color: Colors.amber),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: AppColors.primary,
                    ),
                    child: Center(
                      child: Text(
                        'Add to cart',
                        style: AppTextStyle.heading2.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
