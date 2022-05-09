class AuthException implements Exception {
  final String errorMessage;

  AuthException([this.errorMessage = "Some error  happened"]);

  factory AuthException.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return AuthException('Email is not valid or badly formatted');
      case 'missing-fields':
        return AuthException('Please, fill in all the fields');
      case "user-exist":
        return AuthException("User already exist");
      case "invalid-credentials":
        return AuthException("Email/password doesn't match");
      default:
        return AuthException();
    }
  }
}
