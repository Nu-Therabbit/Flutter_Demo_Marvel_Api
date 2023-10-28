class Result<T> {
  Status status;
  T? data;
  Exception? exception;

  Result.loading(this.exception) : status = Status.LOADING;

  Result.completed(this.data) : status = Status.COMPLETED;

  Result.error(this.exception) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : ${exception.toString()} \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }
