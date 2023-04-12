class ViewState<T> {
  ViewState.initial()
      : isLoading = false,
        isError = false,
        data = null,
        message = null;

  ViewState.loading()
      : isLoading = true,
        isError = false,
        data = null,
        message = null;

  ViewState.success({this.data})
      : isLoading = false,
        isError = false,
        message = null;

  ViewState.failed({this.message})
      : isLoading = false,
        isError = true,
        data = null;

  final bool? isLoading;
  final bool? isError;
  final T? data;
  final String? message;
}
