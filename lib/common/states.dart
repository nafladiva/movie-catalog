class ViewState<T> {
  ViewState.initial()
      : isLoading = false,
        isSuccess = false,
        isError = false,
        data = null,
        message = null;

  ViewState.loading()
      : isLoading = true,
        isSuccess = false,
        isError = false,
        data = null,
        message = null;

  ViewState.success({this.data, this.message})
      : isLoading = false,
        isSuccess = true,
        isError = false;

  ViewState.failed({this.message})
      : isLoading = false,
        isSuccess = false,
        isError = true,
        data = null;

  final bool? isLoading;
  final bool? isError;
  final bool? isSuccess;
  final T? data;
  final String? message;
}
