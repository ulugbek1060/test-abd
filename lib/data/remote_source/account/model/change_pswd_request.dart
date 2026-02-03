class ChangePswdRequest {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  ChangePswdRequest({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
  });

  factory ChangePswdRequest.fromJson(Map<String, dynamic> json) {
    return ChangePswdRequest(
      oldPassword: json['old_password'] as String,
      newPassword: json['new_password'] as String,
      confirmPassword: json['confirm_password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'old_password': oldPassword,
      'new_password': newPassword,
      'confirm_password': confirmPassword,
    };
  }
}
