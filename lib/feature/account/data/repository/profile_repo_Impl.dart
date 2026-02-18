import 'package:ecomerce_app/feature/account/data/datasource/remote_datasource.dart';
import 'package:ecomerce_app/feature/account/data/model/profile_model.dart';
import 'package:ecomerce_app/feature/account/domain/repository/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepoImpl({required this.remoteDataSource});

  @override
  Future<ProfileModel> getProfile() {
    final data = remoteDataSource.getProfile();
    return data.then((response) {
      final inner = response['data'];
      return ProfileModel.fromJson(inner as Map<String, dynamic>);
    });
  }
}
