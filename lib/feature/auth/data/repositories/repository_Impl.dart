import 'package:ecomerce_app/feature/auth/data/datasource/auth_remote_datasource.dart';
import 'package:ecomerce_app/feature/auth/data/model/user_model.dart';
import 'package:ecomerce_app/feature/auth/domain/entities/user.dart';
import 'package:ecomerce_app/feature/auth/domain/repositories/auth_repository.dart';

class RepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remote;

  RepositoryImpl(this.remote);

  @override
  Future<User> login({required String phone, required String password}) async {
    final json = await remote.login(phone, password);
    return UserModel.fromJson(json);
  }

  @override
  Future<User> register({
    required String phone,
    required String password,
    required String name,
  }) async {
    final json = await remote.register(phone, password, name);
    return UserModel.fromJson(json);
  }

  @override
  Future<void> sendOtp(String phone) async{} //Logic SMS

  @override
  Future<bool> verifyOtp(String phone, String Otp) async => Otp == '1234';
}
