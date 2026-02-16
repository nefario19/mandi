import 'package:mandi/core/locator.dart';
import 'package:mandi/core/models/user.dart';
import 'package:mandi/core/services/user_service.dart';
import 'package:mandi/core/viewmodels/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  final UserService _userService = locator<UserService>();

  User? get currentUser => _userService.currentUser.value;
}
