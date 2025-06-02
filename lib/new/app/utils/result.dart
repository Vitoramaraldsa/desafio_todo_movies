sealed class Result<T> {
  const Result();

  const factory Result.ok(T value) = Ok._;

  const factory Result.error(Exception error) = Error._;

  bool get isOk => this is Ok<T>;

  bool get isError => this is Error<T>;

  T? get value => null;

  Exception? get error => null;

  R fold<R>({
    required R Function(T value) onOk,
    required R Function(Exception error) onError,
  }) {
    return switch (this) {
      Ok<T> ok => onOk(ok.value),
      Error<T> error => onError(error.error),
    };
  }
}

final class Ok<T> extends Result<T> {
  final T _value;

  const Ok._(this._value);

  @override
  T get value => _value;
}

final class Error<T> extends Result<T> {
  final Exception _error;

  const Error._(this._error);

  @override
  Exception get error => _error;
}
