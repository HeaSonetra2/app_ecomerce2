import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce_app/core/routing/app_route.dart';
import 'package:ecomerce_app/core/theme/app_colors.dart';
import 'package:ecomerce_app/core/theme/text_style.dart';
import 'package:ecomerce_app/feature/home/data/models/home_data_model.dart';
import 'package:ecomerce_app/feature/home/data/models/product_model.dart';
import 'package:ecomerce_app/feature/home/domain/entities/banner.dart';
import 'package:ecomerce_app/feature/home/domain/entities/product.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_event.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_state.dart';
import 'package:ecomerce_app/feature/home/presentation/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadHomeDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<HomeBloc>().add(LoadHomeDataEvent());

            // Wait until your data is loaded (optional small delay)
            await Future.delayed(const Duration(seconds: 1));
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Image.asset('assets/logo/logo2.png')],
                  ),
                  SizedBox(height: 24),
                  _buildInputField(),
                  SizedBox(height: 24),

                  BlocBuilder<HomeBloc, HomeState>(
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
                                    LoadHomeDataEvent(),
                                  );
                                },
                                child: Text('Retry'),
                              ),
                            ],
                          ),
                        );
                      }

                      if (state is HomeLoaded) {
                        return Column(
                          children: [
                            _showBanner(state.homeData.banner),
                            SizedBox(height: 24),

                            Row(
                              children: [
                                Text(
                                  'Exclusive Offer',
                                  style: AppTextStyle.heading2,
                                ),
                                Spacer(),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'See All',
                                    style: AppTextStyle.title.copyWith(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  state.homeData.feed.length,
                                  (i) => _buildCardProduct(
                                    context,
                                    state.homeData.feed[i],
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Best Seller',
                                  style: AppTextStyle.heading2,
                                ),
                                Spacer(),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'See All',
                                    style: AppTextStyle.title.copyWith(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                  state.homeData.bestSeller.length,
                                  (i) => _buildCardProduct(
                                    context,
                                    state.homeData.bestSeller[i],
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
                  SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          switch (value) {
            case 0:
              Navigator.pushNamed(context, AppRoute.home);
            case 1:
              Navigator.pushNamed(context, AppRoute.home);
            case 2:
              Navigator.pushNamed(context, AppRoute.home);
            case 3:
              Navigator.pushNamed(context, AppRoute.home);
            case 4:
              Navigator.pushNamed(context, AppRoute.account);
          }
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Acount'),
        ],
      ),
    );
  }
}

Widget _buildCardProduct(BuildContext context, ProductModel item) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DetailScreen(productId: item.id)),
      );
    },
    child: Container(
      width: 200,
      height: 280,
      margin: EdgeInsets.only(right: 24),
      padding: EdgeInsets.only(left: 14, right: 14),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 134,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                image: NetworkImage(item.imageUrl),
                fit: BoxFit.fill,
              ),
            ),
          ),

          Text(
            item.name,
            style: AppTextStyle.heading3.copyWith(fontWeight: FontWeight.w600),
          ),
          Row(
            children: [
              Text(
                '${item.qty}',
                style: AppTextStyle.heading3.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(item.type),
            ],
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Text(
                '${item.price}\$',
                style: AppTextStyle.heading3.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(child: Icon(Icons.add, color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _buildInputField() {
  return Container(
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: AppColors.colorbgFieldInput,
    ),
    child: Row(
      children: [
        SizedBox(width: 8),
        Icon(Icons.search),
        SizedBox(width: 8),
        Text('Search store', style: AppTextStyle.smallGrey),
      ],
    ),
  );
}

Widget _showBanner(List banner) {
  return CarouselSlider(
    items: banner.map((item) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          item.imageUrl,
          width: double.infinity,
          fit: BoxFit.cover,

          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: double.infinity,
              color: Colors.grey.shade300,
              child: Center(child: CircularProgressIndicator()),
            );
          },

          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: double.infinity,
              color: Colors.grey.shade300,
              child: Center(child: Icon(Icons.broken_image)),
            );
          },
        ),
      );
    }).toList(),
    options: CarouselOptions(
      height: 180,
      viewportFraction: 1,
      enlargeCenterPage: false,
      autoPlay: false,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
    ),
  );
}
