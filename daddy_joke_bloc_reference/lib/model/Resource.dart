class Resource<T> {
  final Status status;
  final T data;
  final String message;

  bool get hasData => data != null;

  Resource.success(this.data)
      : status = Status.SUCCESS,
        message = null;

  Resource.loading()
      : status = Status.LOADING,
        data = null,
        message = null;

  Resource.error(this.message)
      : status = Status.ERROR,
        data = null;

  Resource.idle()
      : status = Status.IDLE,
        data = null,
        message = "Hello World!";
}

enum Status { LOADING, SUCCESS, ERROR, IDLE }
