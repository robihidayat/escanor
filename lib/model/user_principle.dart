


class UserPrinciple{
   String username;
   String email;

  UserPrinciple(this.username, this.email);

  UserPrinciple.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        email = json['email'];

  Map<String, dynamic> toJson() =>
    {
      'name': username,
      'email': email,
    };

}