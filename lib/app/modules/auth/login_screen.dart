import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:assigment2/app/config/app_routes.dart'; 
import 'package:assigment2/app/controllers/auth_controller.dart'; 

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authC = Get.put(AuthController());

    return Scaffold(
      body: Column( 
        children: [
          Expanded(
            flex: 2, 
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/cinema.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container( 
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.2),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            flex: 3, 
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: SafeArea( 
                child: Center(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Login",
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Let's get started",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Colors.white70,
                              ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 40),
                        // Email
                        TextFormField(
                          controller: authC.emailC,
                          style: const TextStyle(color: Colors.black),
                          decoration: const InputDecoration(
                            hintText: "Email",
                            prefixIcon: Icon(Icons.email_outlined),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 16),
                        // Password
                        Obx(() => TextFormField(
                              controller: authC.passwordC,
                              obscureText: authC.isPasswordHidden.value,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: const Icon(Icons.lock_outline),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    authC.isPasswordHidden.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.grey[600],
                                  ),
                                  onPressed: authC.togglePasswordVisibility,
                                ),
                              ),
                            )),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Tombol Login
                        ElevatedButton(
                          onPressed: () => authC.login(context),
                          child: const Text("Login"),
                        ),
                        const SizedBox(height: 24),
                        const Text(
                          "Or",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white70),
                        ),
                        const SizedBox(height: 24),
                        // Social Logins
                        _buildSocialButton(
                          text: "Login With Google",
                          icon: FontAwesomeIcons.google,
                          onPressed: () => authC.loginWithGoogle(context),
                          color: Colors.white,
                          textColor: Colors.black,
                        ),
                        const SizedBox(height: 16),
                        _buildSocialButton(
                          text: "Login With Facebook",
                          icon: FontAwesomeIcons.facebook,
                          onPressed: () => authC.loginWithFacebook(context),
                          color: const Color(0xFF1877F2),
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: 40),
                        // Link ke Sign-up
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? ",
                                style: TextStyle(color: Colors.white70)),
                            GestureDetector(
                              onTap: () => context.push(AppRoutes.signup),
                              child: Text(
                                "Register here",
                                style: TextStyle(
                                  color: Colors.blue[300],
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
    required Color textColor,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      icon: FaIcon(icon, size: 20),
      label: Text(text),
      onPressed: onPressed,
    );
  }
}