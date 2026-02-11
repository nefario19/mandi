import 'package:go_router/go_router.dart';
import 'package:mandi/core/locator.dart';
import 'package:mandi/core/viewmodels/auth_view_model.dart';
import 'package:mandi/ui/views/home_view.dart';
import 'package:mandi/ui/views/login_view.dart';
import 'package:mandi/ui/views/profile_view.dart';
import 'package:mandi/ui/views/registration_view.dart';
import 'package:mandi/ui/views/shell_view.dart';

class AppRouter {
  final AuthViewModel _authViewModel = locator<AuthViewModel>();

  late final GoRouter router;

  AppRouter() {
    router = GoRouter(
      initialLocation: '/login',
      refreshListenable: _authViewModel.currentUser,
      routes: [
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => LoginView(),
        ),
        GoRoute(
          path: '/register',
          name: 'register',
          builder: (context, state) => RegistrationView(),
        ),

        ShellRoute(
          builder: (context, state, child) => ShellView(child: child),
          routes: [
            GoRoute(
              path: '/home',
              name: 'home',
              builder: (context, state) => HomeView(),
            ),
            GoRoute(
              path: '/profile',
              name: 'profile',
              builder: (context, state) => ProfileView(),
            ),
          ],
        ),
      ],
      redirect: (context, state) {
        final isLoggedIn = _authViewModel.currentUser.value != null;
        final isGoingToLogin = state.matchedLocation == '/login';
        final isGoingToRegister = state.matchedLocation == '/register';

        if (!isLoggedIn && !isGoingToLogin && !isGoingToRegister) {
          return '/login';
        }

        if (isLoggedIn && (isGoingToLogin || isGoingToRegister)) {
          return '/home';
        }

        return null;
      },
    );
  }
}
