// Import necessary Flutter packages
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

// Main application entry point
void main() {
  // Run the app with the SnackBarShowcaseApp widget
  runApp(const SnackBarShowcaseApp());
}

// Main application widget
class SnackBarShowcaseApp extends StatelessWidget {
  const SnackBarShowcaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SnackBar Showcase by Wilsons Navid',
      debugShowCheckedModeBanner: false, // Remove debug banner
      // Define the app's light theme
      theme: ThemeData(
        primarySwatch: Colors.deepPurple, // Primary color scheme
        fontFamily: 'Poppins', // Custom font for the app
        scaffoldBackgroundColor: Colors.grey[50], // Light background color
        cardTheme: CardTheme(
          elevation: 2, // Card shadow depth
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded card corners
          ),
        ),
      ),
      home: const SnackBarShowcaseHome(), // Set the home screen
    );
  }
}

// Home screen widget that showcases different SnackBar types
class SnackBarShowcaseHome extends StatelessWidget {
  const SnackBarShowcaseHome({super.key});

  // Method to show a basic SnackBar
  void _showBasicSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('This is a basic SnackBar notification'),
        behavior:
            SnackBarBehavior.floating, // Makes SnackBar float above content
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8), // Rounded corners
        ),
      ),
    );
  }

  // Method to show a SnackBar with an action button
  void _showActionSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Item moved to trash'),
        duration: const Duration(seconds: 3), // How long SnackBar stays visible
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: 'UNDO',
          textColor: Colors.amber[300], // Custom action button color
          onPressed: () {
            // Action to perform when UNDO is pressed
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Action undone!')),
            );
          },
        ),
      ),
    );
  }

  // Method to show a success-themed SnackBar
  void _showSuccessSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green[300]), // Success icon
            const SizedBox(width: 12), // Spacing between icon and text
            const Text('Successfully saved!'),
          ],
        ),
        backgroundColor: Colors.green[800]?.withOpacity(0.9), // Success color
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  // Method to show an error-themed SnackBar
  void _showErrorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.error_outline, color: Colors.red[300]), // Error icon
            const SizedBox(width: 12),
            const Text('Error: Could not connect'),
          ],
        ),
        backgroundColor: Colors.red[800]?.withOpacity(0.9), // Error color
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  // Method to show a floating SnackBar with custom margin
  void _showFloatingSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('This is a floating SnackBar'),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20), // Margin from screen edges
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  // Method to show a fully custom-styled SnackBar
  void _showCustomSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor:
            Colors.transparent, // Make SnackBar background transparent
        elevation: 0, // Remove default shadow
        content: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              // Gradient background
              colors: [Colors.purple[800]!, Colors.blue[800]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                // Custom shadow
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Row(
            children: [
              Icon(Icons.star, color: Colors.amber), // Decorative icon
              SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Premium feature unlocked!',
                  style: TextStyle(fontWeight: FontWeight.bold), // Bold text
                ),
              ),
            ],
          ),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar showcase - Wilsons Navid'),
        centerTitle: true, // Center the title
        elevation: 0, // Remove app bar shadow
      ),
      body: SingleChildScrollView(
        // Make content scrollable
        padding: const EdgeInsets.all(24), // Padding around content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Full width children
          children: [
            // Header section
            const Text(
              'SnackBar Gallery',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8), // Spacing between header and subtitle
            Text(
              'Choose a SnackBar style to display',
              style: TextStyle(
                color: Colors.grey[600], // Subdued text color
              ),
            ),
            const SizedBox(height: 24), // Spacing before cards

            // Card for Basic SnackBar
            _buildSnackBarCard(
              context,
              title: 'Basic SnackBar',
              description: 'Simple text notification',
              icon: Icons.text_snippet,
              color: Colors.deepPurple,
              onTap: () => _showBasicSnackBar(context),
            ),

            // Card for Action SnackBar
            _buildSnackBarCard(
              context,
              title: 'Action SnackBar',
              description: 'With undo functionality',
              icon: Icons.reply,
              color: Colors.blue,
              onTap: () => _showActionSnackBar(context),
            ),

            // Card for Success SnackBar
            _buildSnackBarCard(
              context,
              title: 'Success SnackBar',
              description: 'Positive confirmation',
              icon: Icons.check_circle_outline,
              color: Colors.green,
              onTap: () => _showSuccessSnackBar(context),
            ),

            // Card for Error SnackBar
            _buildSnackBarCard(
              context,
              title: 'Error SnackBar',
              description: 'Error notification',
              icon: Icons.error_outline,
              color: Colors.red,
              onTap: () => _showErrorSnackBar(context),
            ),

            // Card for Floating SnackBar
            _buildSnackBarCard(
              context,
              title: 'Floating SnackBar',
              description: 'Positioned with margin',
              icon: Icons.open_in_full,
              color: Colors.orange,
              onTap: () => _showFloatingSnackBar(context),
            ),

            // Card for Custom SnackBar
            _buildSnackBarCard(
              context,
              title: 'Custom SnackBar',
              description: 'With gradient background',
              icon: Icons.gradient,
              color: Colors.pink,
              onTap: () => _showCustomSnackBar(context),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build consistent SnackBar showcase cards
  Widget _buildSnackBarCard(
    BuildContext context, {
    required String title,
    required String description,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16), // Spacing between cards
      child: InkWell(
        // Makes entire card tappable
        borderRadius: BorderRadius.circular(12), // Match card's rounded corners
        onTap: onTap, // Callback when card is tapped
        child: Padding(
          padding: const EdgeInsets.all(16), // Inner padding
          child: Row(
            children: [
              // Colored icon container
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2), // Semi-transparent color
                  shape: BoxShape.circle, // Circular container
                ),
                child: Icon(icon, color: color), // Icon with matching color
              ),
              const SizedBox(width: 16), // Spacing between icon and text
              Expanded(
                // Takes remaining horizontal space
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Left-aligned
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4), // Small spacing
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.grey[600], // Subdued description
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right, // Navigation indicator
                color: Colors.grey[400], // Subdued color
              ),
            ],
          ),
        ),
      ),
    );
  }
}