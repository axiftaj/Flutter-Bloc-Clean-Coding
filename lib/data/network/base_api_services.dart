

abstract class BaseApiServices {

  Future<dynamic> getApi(String url);

  Future<dynamic> postApi(String url , dynamic data);

}