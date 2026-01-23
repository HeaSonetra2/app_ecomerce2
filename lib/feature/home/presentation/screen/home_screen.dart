import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce_app/core/theme/app_colors.dart';
import 'package:ecomerce_app/core/theme/text_style.dart';
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
                            _showBanner(state.banners),
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
                                  state.feeds.length,
                                  (i) => _buildCardProduct(context,state.feeds[i]),
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
                                  state.bestSeller.length,
                                  (i) => _buildCardProduct(context,state.bestSeller[i]),
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
    );
  }
}

Widget _buildCardProduct(BuildContext context, Product item) {
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

// Widget _showBanner(List<BannerPoster> banner) {
//   return CarouselSlider(
//     items: List.generate(banner.length, (index) {
//       return Container(
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(12),
//           child: Image.network(banner[index].imageUrl),
//         ),
//       );
//     }),
//     options: CarouselOptions(
//       height: 180,
//       aspectRatio: 16 / 8,
//       viewportFraction: 1,
//       initialPage: 0,
//       enableInfiniteScroll: true,
//       reverse: false,
//       autoPlay: true,
//       autoPlayInterval: Duration(seconds: 3),
//       autoPlayAnimationDuration: Duration(milliseconds: 800),
//       enlargeCenterPage: false,
//       enlargeFactor: 0.3,
//       scrollDirection: Axis.horizontal,
//     ),
//   );
// }
Widget _showBanner(List<BannerPoster> banner) {
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
