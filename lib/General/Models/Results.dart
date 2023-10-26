class LogInResult{
  bool result;
  String message;
  int id;

  LogInResult(this.result, this.message, this.id);
}

class SignInResult {
  bool result;
  String message;

  SignInResult(this.result, this.message);
}

class DeleteUserResult {
  bool result;
  String message;

  DeleteUserResult(this.result, this.message);
}

class UpdatePasswordResult{
  bool result;
  String message;

  UpdatePasswordResult(this.result, this.message);
}