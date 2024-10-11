import 'package:flutter/material.dart';
import 'package:sign_up/screens/sign_up_email.dart';



class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate the button width
    double buttonWidth = MediaQuery.of(context).size.width / 2 - 24;
    double screenHeight = MediaQuery.of(context).size.height; // Get the height of the screen

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent, // Set the background color
      body: SizedBox(
        height: screenHeight,  // Set the container height to the full screen height
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between text and button
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 80.0), // Add top padding to move text down
                child: Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Adjust text color for visibility
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0), // Add bottom padding for the button
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20), // Add margin around the button
                  width: buttonWidth,  // Set button width dynamically
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to Sign Up with Email
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpEmail()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,  // Set button background color to purple
                      padding: const EdgeInsets.symmetric(vertical: 15),  // Set vertical padding
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),  // Set the border radius to jcButtonRadius (24 in this case)
                      ),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,  // Make the text bold
                        color: Colors.white,  // Set text color to white
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
