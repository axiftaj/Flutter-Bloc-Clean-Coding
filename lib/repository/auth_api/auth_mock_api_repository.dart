import '../../model/user/user_model.dart';
import 'auth_api_repository.dart';


class AuthMockApiRepository implements AuthApiRepository  {

  @override
  Future<UserModel> loginApi(dynamic data )async{
    await Future.delayed(const Duration(seconds: 2));
    var data = {
      'token' : 'a23z345xert'
    };
    return UserModel.fromJson(data) ;
  }

}