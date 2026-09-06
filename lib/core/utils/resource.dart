enum ApiStatus { initial, success, loading, error }

class Resource<T> {
  T? data;
  String? errorMessage;
  ApiStatus? status;

  Resource({
    required this.status,
    required this.errorMessage,
    required this.data,
  });

  Resource.initial() {
    status = ApiStatus.initial;
  }
  Resource.loading() {
    status = ApiStatus.loading;
  }
  Resource.success({required this.data}) {
    status = ApiStatus.success;
  }
  Resource.error({required this.errorMessage}) {
    status = ApiStatus.error;
  }
  bool get isSuccess => status == ApiStatus.success;
  bool get isError => status == ApiStatus.error;
  bool get isLoading => status == ApiStatus.loading;
}
