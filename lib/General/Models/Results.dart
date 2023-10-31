import 'package:natty_fit/General/Models/User.dart';

class LogInResult{
  bool result;
  String message;
  int id;

  LogInResult(this.result, this.message, this.id);
}

class ExerciseResult{
  bool result;
  String message;

  ExerciseResult(this.result, this.message);
}

class ExerciseSelectResult{
  bool result;
  String message;

  ExerciseSelectResult(this.result, this.message);
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

class GetUserFromIdResult{
  bool result;
  String message;
  User? user;

  GetUserFromIdResult(this.result, this.message, this.user);
}