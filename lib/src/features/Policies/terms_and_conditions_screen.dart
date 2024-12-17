import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Introduction:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Welcome to SF CRM. By using this application, you agree to comply with and be bound by the following terms and conditions. Please read them carefully.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            _buildSectionTitle('1. Use of the Application'),
            _buildSectionContent(
                '• The application is designed for professional use to manage customer relationships, sales, and other activities.\n• Users must not misuse the application for unauthorized purposes.'),
            const SizedBox(height: 16),
            _buildSectionTitle('2. User Responsibilities'),
            _buildSectionContent(
                '• Maintain the confidentiality of your login credentials.\n• Ensure the accuracy of the data you provide.\n• Abide by all applicable laws while using the app.'),
            const SizedBox(height: 16),
            _buildSectionTitle('3. Data Privacy'),
            _buildSectionContent(
                '• We are committed to protecting your data. Refer to our Privacy Policy for details.\n• Users consent to the collection and use of data as outlined in the Privacy Policy.'),
            const SizedBox(height: 16),
            _buildSectionTitle('4. Intellectual Property'),
            _buildSectionContent(
                '• All content, features, and functionality in the application are the intellectual property of Srinivasa farms private Limited.\n• Unauthorized reproduction or distribution is strictly prohibited.'),
            const SizedBox(height: 16),
            _buildSectionTitle('5. Termination'),
            _buildSectionContent(
                '• We reserve the right to terminate access to the app for violations of these terms.'),
            const SizedBox(height: 16),
            _buildSectionTitle('6. Limitations of Liability'),
            _buildSectionContent(
                '• Srinivasa farms private Limited is not liable for any direct, indirect, or incidental damages resulting from the use of the app.'),
            const SizedBox(height: 16),
            _buildSectionTitle('7. Governing Law'),
            _buildSectionContent(
                '• These terms are governed by the laws of Hyderabad, Telangana jurisdiction.'),
            const SizedBox(height: 16),
            _buildSectionTitle('Contact Us for Questions:'),
            _buildSectionContent(
                'If you have any questions about these terms, please contact us at srinivasacrmapp@shgroup.in'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: const TextStyle(fontSize: 14,color: Colors.black54),
    );
  }
}