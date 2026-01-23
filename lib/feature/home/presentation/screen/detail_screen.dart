import 'package:ecomerce_app/feature/home/presentation/bloc/home_bloc.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_event.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailScreen extends StatefulWidget {
  final String productId;
  const DetailScreen({super.key, required this.productId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
            return Image.network(state.productDetail.imageUrl);
          }
          return Center(child: Text('No data'));
        },
      ),
    );
  }
}
