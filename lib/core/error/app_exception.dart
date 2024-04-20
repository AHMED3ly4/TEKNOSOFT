class AppException implements Exception{
  final String message;
  AppException([this.message = 'field']);
}

class LocalException extends AppException{
  LocalException([super.message]);
}
class RemoteException extends AppException{
  RemoteException([super.message]);
}