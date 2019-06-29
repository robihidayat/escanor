class ResponseAuthentication{
  final String token;
  final bool statusAccount;
  final bool setProfile;
  final bool requstCSA;

  ResponseAuthentication({this.token, this.statusAccount, this.setProfile, this.requstCSA});

factory ResponseAuthentication.fromJson(Map<dynamic, dynamic> json) {
    return ResponseAuthentication(
      token: json['token'],
      statusAccount: json['statusAccount'],
      setProfile: json['setProfile'],
      requstCSA: json['requstCSA'],
    );
  }

}

