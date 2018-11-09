abstract class ApiResponse<T> {}

class SuccessApiResponse<T> extends ApiResponse<T> {

  final T data;

  SuccessApiResponse(this.data);
}

class ErrorApiResponse<T> extends ApiResponse<T> {
  final String message;

  ErrorApiResponse(this.message);
}