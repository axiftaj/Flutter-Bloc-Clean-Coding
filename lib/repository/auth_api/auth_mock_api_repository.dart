import '../../model/user/user_model.dart';
import 'auth_api_repository.dart';

/// Mock implementation of [AuthApiRepository] for simulating login requests.
class AuthMockApiRepository implements AuthApiRepository {

  @override
  Future<UserModel> loginApi(dynamic data) async {
    // Simulate a delay to mimic network latency
    await Future.delayed(const Duration(seconds: 2));
    // Mock response data
    var responseData = {'token': 'a23z345xert'};
    return UserModel.fromJson(responseData);
  }




}
