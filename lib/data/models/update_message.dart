class UpdatedMessage {
  bool? error;
  String? message;

  UpdatedMessage({
    required this.error,
    required this.message
  });

  UpdatedMessage.fromJson(Map<String, dynamic> json){
    error = json['error'];
    message = json['message'];
  }
}
