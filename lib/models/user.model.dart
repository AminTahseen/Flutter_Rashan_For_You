final String userTableName = 'Users';

class UserTableFields {
  static final String id = 'userId';
  static final String userName = 'userName';
  static final String userEmail = 'userEmail';
  static final String userAccType = 'userAccType';
  static final String userPassword = 'userPassword';
}

class User {
  final int id;
  final String user_name;
  final String user_email;
  final String account_type;
  final String user_password;

  const User({
    this.id,
    this.user_name,
    this.user_email,
    this.account_type,
    this.user_password,
  });

  Map<String, Object> toJson() => {
        UserTableFields.id: id,
        UserTableFields.userName: user_name,
        UserTableFields.userEmail: user_email,
        UserTableFields.userAccType: account_type,
        UserTableFields.userPassword: user_password
      };
  User copy({
    int id,
    final String user_name,
    final String user_email,
    final String account_type,
    final String user_password,
  }) =>
      User(
        id: id ?? this.id,
        user_name: user_name ?? this.user_name,
        user_email: user_email ?? this.user_email,
        account_type: account_type ?? this.account_type,
        user_password: user_password ?? this.user_password,
      );

  static fromJson(Map<String, Object> json) => User(
      id: json[UserTableFields.id] as int,
      user_name: json[UserTableFields.userName] as String,
      user_email: json[UserTableFields.userEmail] as String,
      user_password: json[UserTableFields.userPassword] as String,
      account_type: json[UserTableFields.userAccType] as String);
}
