import 'package:appwrite/models.dart' as models;

class User {
  final String id;
  final String email;
  final String name;

  User({
    required this.id,
    required this.email,
    required this.name,
  });

  factory User.fromAppwriteUser(models.User appwriteUser) {
    return User(
      id: appwriteUser.$id,
      email: appwriteUser.email,
      name: appwriteUser.name,
    );
  }
}
