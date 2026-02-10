import 'package:appwrite/models.dart' as models;

class User {
  final String id;
  final String email;

  User({
    required this.id,
    required this.email,
  });

  factory User.fromAppwriteUser(models.User appwriteUser) {
    return User(
      id: appwriteUser.$id,
      email: appwriteUser.email,
    );
  }
}
