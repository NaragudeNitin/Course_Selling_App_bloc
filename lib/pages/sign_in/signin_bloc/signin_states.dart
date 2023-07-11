class SignInState {
  final String email;
  final String password;

  SignInState({this.email = '', this.password = ''});

  SignInState copyWith({
    //if we have curly braces with optional field then it is called as optional named parameters
    String? email,
    String? password,
  }) {
    return SignInState(
        email: email ?? this.email, password: password ?? this.password);
  }
}
