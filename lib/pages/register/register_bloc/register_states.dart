class RegisterStates {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;

  //optional named parameters
  const RegisterStates({
    this.userName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '  ',
  });

  RegisterStates copyWith({
    String? userName,
    String? email,
    String? password,
    String? confirmPassword,
  }) {
    return RegisterStates(
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword);
  }
}


//thread safe because we made it as immutable
//if we have immutable classes it always good to go with copy with method 
//because each while calling copy with method we will create a new object 