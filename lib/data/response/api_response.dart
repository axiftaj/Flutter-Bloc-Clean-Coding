import 'package:bloc_clean_coding/data/response/status.dart';




class ApiResponse<T> {
  final Status status;
  final T? data;
  final String? message;

  const ApiResponse._({required this.status, this.data, this.message});

  const ApiResponse.loading() : this._(status: Status.loading);

  const ApiResponse.completed(T data) : this._(status: Status.completed, data: data);

  const ApiResponse.error(String message) : this._(status: Status.error, message: message);

  @override
  String toString() {
    return "Status: $status\nMessage: $message\nData: $data";
  }
}

// class ApiResponse<T> {
//   Status? status;
//   T? data;
//   String? message;
//
//   ApiResponse(this.status, this.data, this.message);
//
//   ApiResponse.loading() : status = Status.loading;
//
//   ApiResponse.completed(this.data) : status = Status.completed;
//
//   ApiResponse.error(this.message) : status = Status.error;
//
//   @override
//   String toString() {
//     return "Status : $status \n Message : $message \n Data: $data";
//   }
// }
