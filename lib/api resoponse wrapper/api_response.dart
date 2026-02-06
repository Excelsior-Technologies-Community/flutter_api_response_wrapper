import 'api_status.dart';

class ApiResponse<T> {
  final ApiStatus status;
  final T? data;
  final String? message;
  final int? statusCode;

  const ApiResponse._({
    required this.status,
    this.data,
    this.message,
    this.statusCode,
  });

  factory ApiResponse.initial() {
    return const ApiResponse._(status: ApiStatus.initial);
  }

  factory ApiResponse.loading() {
    return const ApiResponse._(status: ApiStatus.loading);
  }

  factory ApiResponse.success(
      T data, {
        int? statusCode,
      }) {
    return ApiResponse._(
      status: ApiStatus.success,
      data: data,
      statusCode: statusCode,
    );
  }

  factory ApiResponse.error(
      String message, {
        int? statusCode,
      }) {
    return ApiResponse._(
      status: ApiStatus.error,
      message: message,
      statusCode: statusCode,
    );
  }

  bool get isLoading => status == ApiStatus.loading;
  bool get isSuccess => status == ApiStatus.success;
  bool get isError => status == ApiStatus.error;
}
