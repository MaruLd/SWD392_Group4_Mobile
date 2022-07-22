// class Response<T> {
//   Status status;
//   T data;
//   String message;

//   Response.loading(this.message, this.data) : status = Status.LOADING;
//   Response.completed(this.data, this.message) : status = Status.COMPLETED;
//   Response.error(this.message, this.data) : status = Status.ERROR;

//   @override
//   String toString() {
//     return "Status : $status \n Message : $message \n Data : $data";
//   }
// }

// enum Status { LOADING, COMPLETED, ERROR }
