import 'package:bloc/bloc.dart';
import 'package:ecomerce_app/feature/account/domain/usecase/get_profile_usecase.dart';
import 'package:ecomerce_app/feature/account/presentation/bloc/profile_event.dart';
import 'package:ecomerce_app/feature/account/presentation/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUsecase getProfileUsecase;

  ProfileBloc({required this.getProfileUsecase}) : super(ProfileInitial()) {
    on<LoadProfile>(_onLoadProfile);
  }

  Future<void> _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());
    try {
      final profile = await getProfileUsecase.execute();
      emit(ProfileLoaded(profile: profile));
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }
}
