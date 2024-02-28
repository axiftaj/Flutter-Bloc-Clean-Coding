import '../../model/user/user_model.dart';

abstract class AuthApiRepository {

  Future<UserModel> loginApi(dynamic data);

}