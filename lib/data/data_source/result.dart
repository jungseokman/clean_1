abstract class Result<T> {
  factory Result.success(T data) = Success<T>;
  factory Result.error(String message) = Error<T>;

  R when<R>({
    required R Function(T data) success,
    required R Function(String message) error,
  });
}

class Success<T> implements Result<T> {
  final T data;
  const Success(this.data);

  @override
  R when<R>({
    required R Function(T data) success,
    required R Function(String message) error,
  }) {
    return success(data);
  }
}

class Error<T> implements Result<T> {
  final String message;
  const Error(this.message);

  @override
  R when<R>({
    required R Function(T data) success,
    required R Function(String message) error,
  }) {
    return error(message);
  }
}
