import 'package:ecomerce_app/feature/account/domain/entities/profile_entities.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Profile profile;

  ProfileLoaded({required this.profile});
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});
}
