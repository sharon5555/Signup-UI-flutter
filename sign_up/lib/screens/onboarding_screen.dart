import 'package:flutter/material.dart';
import 'package:sign_up/screens/login.dart';
import 'package:sign_up/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal, // Set scroll direction to horizontal
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
                onboardingPage(
                  "assets/board.webp",
                  "Welcome to Our App",
                  "This is the first onboarding screen",
                ),
                onboardingPage(
                  "assets/transport.webp",
                  "Discover Features",
                  "Explore the cool features of our app",
                ),
                onboardingPage(
                  "assets/handshake.png",
                  "Stay Connected Anytime, Anywhere",
                  "Stay connected with timely updates, and 24/7 support making your journey seamless",
                ),
                onboardingPage(
                  "assets/gstarted.webp",
                  "Get Started",
                  "Let's help you get started now!",
                ),
              ],
            ),
          ),
          // Show Get Started button only on the last page
          if (_currentIndex == 3) ...[
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                print('Get Started button tapped'); // Debug print
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Container(
                width: 300, // Adjust the button width
                padding: const EdgeInsets.symmetric(vertical: 20), // Add some vertical padding
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: nPrimaryColor, // Use your primary color
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(color: Colors.white, fontSize: 16), // Adjust text style as needed
                ),
              ),
            ),
            const SizedBox(height: 150), // Add bottom spacing
          ],
          // Smooth Page Indicator positioned slightly above the bottom
          Padding(
            padding: const EdgeInsets.only(bottom: 150.0), // Adjust this value as needed
            child: SmoothPageIndicator(
              controller: _pageController,
              count: 4,
              effect: const ExpandingDotsEffect(
                activeDotColor: nPrimaryColor,
                dotColor: Colors.grey,
                dotHeight: 10,
                dotWidth: 10,
                spacing: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to build onboarding page
  Widget onboardingPage(String imagePath, String title, String description) {
    return SingleChildScrollView( // Added SingleChildScrollView here to fix overflow
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, height: 300),
            const SizedBox(height: 32),
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
