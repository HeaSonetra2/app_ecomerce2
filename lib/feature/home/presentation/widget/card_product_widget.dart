import 'package:ecomerce_app/core/theme/app_colors.dart';
import 'package:ecomerce_app/core/theme/text_style.dart';
import 'package:ecomerce_app/feature/home/presentation/bloc/home_state.dart';
import 'package:flutter/material.dart';

Widget _buildCardProduct(HomeLoaded state, int i) {
  return Container(
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
              image: NetworkImage(state.feeds[i].imageUrl),
              fit: BoxFit.fill,
            ),
          ),
        ),

        Text(
          state.feeds[i].name,
          style: AppTextStyle.heading3.copyWith(fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            Text(
              '${state.feeds[i].qty}',
              style: AppTextStyle.heading3.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(state.feeds[i].type),
          ],
        ),
        SizedBox(height: 24),
        Row(
          children: [
            Text(
              '${state.feeds[i].price}\$',
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
  );
}
