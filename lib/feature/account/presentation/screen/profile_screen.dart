import 'package:ecomerce_app/core/routing/app_route.dart';
import 'package:ecomerce_app/core/storage/token_storage.dart';
import 'package:ecomerce_app/core/theme/app_colors.dart';
import 'package:ecomerce_app/core/theme/text_style.dart';
import 'package:ecomerce_app/feature/account/domain/entities/profile_entities.dart';
import 'package:ecomerce_app/feature/account/presentation/bloc/profile_bloc.dart';
import 'package:ecomerce_app/feature/account/presentation/bloc/profile_event.dart';
import 'package:ecomerce_app/feature/account/presentation/bloc/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

TokenStorage tokenStorage = TokenStorage();

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(LoadProfile());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Profile',
          style: AppTextStyle.heading3.copyWith(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileLoaded) {
            return _buildProfileContent(state.profile);
          } else if (state is ProfileError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.message}'),
                  ElevatedButton(
                    onPressed: () {
                      context.read<ProfileBloc>().add(LoadProfile());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }
          return const Center(child: Text('Welcome to Profile'));
        },
      ),
    );
  }

  Widget _buildProfileContent(Profile profile) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Header
          Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColors.primary.withOpacity(0.1),
                  child: Icon(Icons.person, size: 50, color: AppColors.primary),
                ),
                const SizedBox(height: 16),
                Text(profile.name, style: AppTextStyle.heading2),
                const SizedBox(height: 8),
                Text(profile.email, style: AppTextStyle.smallGrey),
              ],
            ),
          ),
          const SizedBox(height: 32),

          // Profile Details
          Text('Personal Information', style: AppTextStyle.heading3),
          const SizedBox(height: 16),

          _buildInfoCard('Phone Number', profile.phoneNumber),
          _buildInfoCard('Gender', profile.gender),
          _buildInfoCard('Date of Birth', profile.dob),
          _buildInfoCard('Address', profile.address),

          const SizedBox(height: 32),

          // Logout Button
          Center(
            child: ElevatedButton(
              onPressed: () {
                tokenStorage.clearCache();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AppRoute.login,
                  (route) => false,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
              ),
              child: const Text('Logout'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String label, String value) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: AppTextStyle.title.copyWith(fontWeight: FontWeight.w500),
            ),
            Text(
              value.isEmpty ? 'Not provided' : value,
              style: AppTextStyle.smallGrey.copyWith(fontStyle: value.isEmpty ? FontStyle.italic : FontStyle.normal),
            ),
          ],
        ),
      ),
    );
  }
}
