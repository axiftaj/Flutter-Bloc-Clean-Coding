/// Abstract class for defining base API services.
abstract class BaseApiServices {
  /// Fetches data from the API using a GET request.
  ///
  /// Takes a [url] parameter representing the endpoint URL.
  Future<dynamic> getApi(String url);

  /// Sends data to the API using a POST request.
  ///
  /// Takes a [url] parameter representing the endpoint URL and a [data] parameter
  /// representing the data to be sent.
  Future<dynamic> postApi(String url, dynamic data);
}
