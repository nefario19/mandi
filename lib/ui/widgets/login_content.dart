import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:mandi/i18n/strings.g.dart';
import '../../core/viewmodels/auth_view_model.dart';

class LoginContent extends StatefulWidget {
  final AuthViewModel viewModel;

  const LoginContent({
    super.key,
    required this.viewModel,
  });

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  bool _obscurePassword = true;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    final primaryColor = theme.colorScheme.primary;

    return Stack(
      children: [
        // ✨ Subtle blur background
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? [
                        Color(0xFF1a1a2e),
                        Color(0xFF16213e),
                      ]
                    : [
                        colorScheme.surface,
                        colorScheme.surface.withOpacity(0.95),
                      ],
              ),
            ),
          ),
        ),

        // Decorative blur circles
        Positioned(
          top: -80,
          right: -80,
          child: Container(
            width: 350,
            height: 350,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  primaryColor.withOpacity(0.15),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        Positioned(
          bottom: -100,
          left: -100,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  colorScheme.primary.withOpacity(0.1),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),

        // Main content
        SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: LayoutBuilder(builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Header
                        Text(
                          'Welkom terug',
                          style: theme.textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                          textAlign: TextAlign.center,
                        ),

                        Gap(12),

                        Text(
                          'Log in om verder te gaan',
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onSurface.withOpacity(0.6),
                          ),
                          textAlign: TextAlign.center,
                        ),

                        Gap(60),

                        // Form fields
                        _buildLabel(t.auth.email, theme, colorScheme),
                        Gap(8),
                        _buildTextField(
                          controller: widget.viewModel.emailController,
                          icon: Icons.email_outlined,
                          keyboardType: TextInputType.emailAddress,
                          theme: theme,
                          colorScheme: colorScheme,
                        ),

                        Gap(20),

                        _buildLabel(t.auth.password, theme, colorScheme),
                        Gap(8),
                        _buildTextField(
                          controller: widget.viewModel.passwordController,
                          icon: Icons.lock_outline,
                          obscureText: _obscurePassword,
                          theme: theme,
                          colorScheme: colorScheme,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: colorScheme.onSurface.withOpacity(0.4),
                              size: 22,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),

                        Gap(8),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // TODO: Implement forgot password
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Wachtwoord vergeten?',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurface.withOpacity(0.6),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),

                        Gap(32),

                        // Login button
                        ValueListenableBuilder<bool>(
                          valueListenable: widget.viewModel.isBusy,
                          builder: (context, isBusy, child) {
                            return Container(
                              height: 56,
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: primaryColor.withOpacity(0.3),
                                    blurRadius: 12,
                                    offset: Offset(0, 6),
                                  ),
                                ],
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(16),
                                  onTap: isBusy ? null : widget.viewModel.loginWithCredentials,
                                  child: Center(
                                    child: isBusy
                                        ? SizedBox(
                                            width: 24,
                                            height: 24,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2.5,
                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                Colors.white,
                                              ),
                                            ),
                                          )
                                        : Text(
                                            t.auth.login,
                                            style: theme.textTheme.titleMedium?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                        Gap(24),

                        // Error message
                        ValueListenableBuilder<String?>(
                          valueListenable: widget.viewModel.errorMessage,
                          builder: (context, error, child) {
                            if (error == null) return SizedBox.shrink();

                            return Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: colorScheme.errorContainer,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    color: colorScheme.error,
                                    size: 20,
                                  ),
                                  Gap(12),
                                  Expanded(
                                    child: Text(
                                      error,
                                      style: theme.textTheme.bodyMedium?.copyWith(
                                        color: colorScheme.onErrorContainer,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                        Gap(32),

                        // Register link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Nog geen account? ',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onSurface.withOpacity(0.6),
                              ),
                            ),
                            TextButton(
                              onPressed: () => context.go('/register'),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                t.auth.registerHere,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),

                        Gap(40),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String text, ThemeData theme, ColorScheme colorScheme) {
    return Text(
      text,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: colorScheme.onSurface.withOpacity(0.7),
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required IconData icon,
    required ThemeData theme,
    required ColorScheme colorScheme,
    TextInputType? keyboardType,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? colorScheme.surface.withOpacity(0.5)
            : colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: colorScheme.outline.withOpacity(0.1),
        ),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: theme.textTheme.bodyLarge?.copyWith(
          color: colorScheme.onSurface,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: colorScheme.onSurface.withOpacity(0.4),
            size: 22,
          ),
          suffixIcon: suffixIcon,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
        ),
      ),
    );
  }
}
