import 'package:ecomerce_app/core/theme/app_colors.dart';
import 'package:ecomerce_app/core/theme/text_style.dart';
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
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: 300,
                            height: 400,
                            child: Image.network('${state.banners.toString()}'),
                          ),
                        ],
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
              ),
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

// Widget _showBanner(){
//       return Container(
//         child: B,
//     );
// }
