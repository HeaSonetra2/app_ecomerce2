import 'package:ecomerce_app/feature/account/domain/entities/profile_entities.dart';
import 'package:ecomerce_app/feature/account/domain/repository/profile_repo.dart';

class GetProfileUsecase {
  final ProfileRepo profileRepo;

  GetProfileUsecase({required this.profileRepo});

  Future<Profile> execute() async {
    final profileModel = await profileRepo.getProfile();
    return Profile(
      id: profileModel.id,
      phoneNumber: profileModel.phoneNumber,
      name: profileModel.name,
      gender: profileModel.gender,
      dob: profileModel.dob,
      email: profileModel.email,
      address: profileModel.address,
    );
  }
}
