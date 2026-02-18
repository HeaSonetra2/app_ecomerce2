
import 'package:ecomerce_app/feature/account/data/model/profile_model.dart';

abstract class ProfileRepo {
   Future<ProfileModel> getProfile();
}