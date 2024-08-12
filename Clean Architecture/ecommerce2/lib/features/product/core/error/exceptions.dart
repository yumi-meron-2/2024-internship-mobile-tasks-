class ServerException implements Exception {
  final String message;

  ServerException([this.message = 'An unknown server error occurred']);

  @override 
  String toString() {
    return message;
  }
}
class NetworkException implements Exception {
  final String message;

  NetworkException([this.message = 'An unknown server error occurred']);

  @override 
  String toString() {
    return message;
  }
}