import 'package:get/get.dart';

enum Status { initial, loading, loaded, empty, error }

class ScreenStatus {
  Rx<Status> _status = Status.initial.obs;

  void setScreenStatus(Status status) {
    _status.value = status;
  }

  Status getScreenStatus() {
    return _status.value;
  }
}

mixin GetDataWithScreen on ScreenStatus {
  Future<T?> getDataWithScreenStatus<T>(Function getData) async {
    setScreenStatus(Status.loading);
    try {
      return await getData();
    } catch (e) {
      setScreenStatus(Status.error);
      return null;
    }
  }

  void checkEmptyWithScreenStatus<S>(List<S> result) {
    if (result.length == 0) {
      setScreenStatus(Status.empty);
    } else {
      setScreenStatus(Status.loaded);
    }
  }
}