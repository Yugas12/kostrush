class HttpErrorHandler {
  HttpErrorHandler._();

  static String parseErrorResponse(dynamic data) {
    if (data is Map<String, dynamic> && data.containsKey('message')) {
      List<dynamic> messages = data['message'];
      if (messages is List) {
        return messages.join('\n');
      }
    }
    return "An unknown error occurred.";
  }
}
