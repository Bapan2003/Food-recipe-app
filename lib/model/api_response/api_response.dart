import '../../utility/enum.dart';

class ApiResponse<T> {
  final ResponseStatus status; // Status of the response
  final String error;          // Error message if any
  final T? data;               // Generic data type

  const ApiResponse({
    required this.status,
    this.error = '',
    this.data,
  });

  // Method to copy the instance with updated values
  ApiResponse<T> copyWith({
    ResponseStatus? status,
    String? error,
    T? data,
  }) {
    return ApiResponse<T>(
      status: status ?? this.status,
      error: error ?? this.error,
      data: data ?? this.data,
    );
  }

  @override
  String toString() {
    return 'ApiResponse(status: $status, error: $error, data: $data)';
  }
}