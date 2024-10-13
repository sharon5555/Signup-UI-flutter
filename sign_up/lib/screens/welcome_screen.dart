import 'package:flutter/material.dart';
import 'package:sign_up/screens/login.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Calculate the button width
    double buttonWidth = MediaQuery.of(context).size.width / 2 - 24;
    double screenHeight = MediaQuery.of(context).size.height; // Get the height of the screen

    return Scaffold(
      backgroundColor: const Color(0xFF01012B), // Cetacean Blue background color
      body: SizedBox(
        height: screenHeight,  // Set the container height to the full screen height
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the text vertically
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Adjust text color for visibility
                ),
              ),
              const SizedBox(height: 30), // Add some space between the text and button
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20), // Add margin around the button
                width: buttonWidth,  // Set button width dynamically
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to Sign Up with Email
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8CBED6),  // Dark Sky Blue button color
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),  // Set vertical padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),  // Set the border radius to 24
                    ),
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,  // Make the text bold
                      color: Colors.white,  // Set text color to white
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
