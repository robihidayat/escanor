class UserPrinciple{
   String username;
   String email;

  UserPrinciple(this.username, this.email);

  UserPrinciple.fromJson(Map<dynamic, dynamic> json)
      : username = json['username'],
        email = json['email'];

  Map<dynamic, dynamic> toJson() =>
    {
      'username': username,
      'email': email,
    };

}