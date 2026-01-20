import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce_app/core/theme/app_colors.dart';
import 'package:ecomerce_app/core/theme/text_style.dart';
import 'package:ecomerce_app/feature/home/domain/entities/banner.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_event.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_state.dart';
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
                              context.read<HomeBloc>().add(LoadHomeDataEvent());
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
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for(var i=0;i<state.feeds.length;i++)
                              Container(
                                width: 200,
                                height: 300,
                                margin: EdgeInsets.only(right: 24),
                                decoration: BoxDecoration(
                                  color: AppColors.background,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(width: 1,color: AppColors.borderColor)
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 134,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12)
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image(image: NetworkImage(state.feeds[i].imageUrl),fit: BoxFit.fill,)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
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
    );
  }
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

Widget _showBanner(List<BannerPoster> banner) {
  return CarouselSlider(
    items: List.generate(banner.length, (index) {
      return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(banner[index].imageUrl),
        ),
      );
    }),
    options: CarouselOptions(
      height: 180,
      aspectRatio: 16 / 8,
      viewportFraction: 0.9,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      //autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      enlargeFactor: 0.3,
      //onPageChanged: callbackFunction,
      scrollDirection: Axis.horizontal,
    ),
  );
}
