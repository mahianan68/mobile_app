import 'package:flutter/material.dart';
import 'package:mobile_app/components/my_textfield.dart';
import 'package:mobile_app/components/my_button.dart'; // Import your custom button widget
import 'package:mobile_app/components/square_tile.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}); // Fixed 'super.key' syntax

  // Text editing controllers
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Method to sign the user in
  void signUserIn() {
    // Implement the logic to sign the user in
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            // Logo
            const Icon(
              Icons.lock,
              size: 100,
              color: Colors.white,
            ),

            const SizedBox(height: 50),

            // Welcome back
            const Text(
              'Welcome back to Q Study',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            // Username textfield
            MyTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),

            const SizedBox(height: 25),

            // Password textfield
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

            const SizedBox(height: 25),

            // Forgot password button or link
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Implement forgot password logic
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Sign-in button
            ElevatedButton(
              onPressed: signUserIn,
              child: MyButton(
                onTap: signUserIn,
                text: 'Sign In',
              ),
            ),

            const SizedBox(height: 50),

            // Or continue with Google + Apple sign-in buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: const Text(
                      'Or Continue with',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            // Register link or button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              // google button
                SquareTile(imagePath: 'assets/Google.png'),

                const SizedBox(width: 10),

                //apple button
                SquareTile(imagePath: 'assets/Apple.png'),
              ],
            ),
            // Implement the register button or link
            const SizedBox( height: 25),

            // not a member? Register now

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Not a member?',
                    style: TextStyle(color: Colors.grey[300]),
                ),
                const SizedBox(width: 4),
                Text('Register now',
                style: TextStyle(
                  color: Colors.amber,
                    fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
