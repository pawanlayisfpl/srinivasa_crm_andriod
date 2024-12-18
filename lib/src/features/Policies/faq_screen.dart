import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              'Frequently Asked Questions (FAQs)',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Thank you for visiting the FAQ section of our SF CRM application! Here, you will find answers to frequently asked questions designed to assist you in navigating our features and resolving any issues you may encounter.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            FaqItem(
              question: 'Q1. What is this CRM application for?',
              answer: 'Our CRM application is designed to streamline customer relationship management, including attendance tracking, sales order creation, customer KYC, and daily/monthly planning.',
            ),
            FaqItem(
              question: 'Q2. How do I log in to the app?',
              answer: 'You can log in using your registered email ID and password. If you face issues, ensure your credentials are correct or reset your password.',
            ),
            FaqItem(
              question: 'Q3. What should I do if I forget my password?',
              answer: 'Use the "Forgot Password" option on the login page to reset your password. You’ll receive an email with instructions.',
            ),
            FaqItem(
              question: 'Q4. How do I track my attendance?',
              answer: 'The app allows you to punch in and out via the Attendance Module. You can access it from the main menu.',
            ),
            FaqItem(
              question: 'Q5. Can I update customer details after creating them?',
              answer: 'Yes, you can edit customer details through the Customer Module as long as you have the necessary permissions.',
            ),
            FaqItem(
              question: 'Q6. How do notifications work?',
              answer: 'Notifications appear in the Alerts Module for approvals, sales orders, and monthly plans. Ensure you’ve enabled notifications in your phone settings.',
            ),
            FaqItem(
              question: 'Q7. What are the supported devices?',
              answer: 'Our application is available for iOS and Android devices.',
            ),
            SizedBox(height: 16),
            Text(
              'If you have additional questions, please reach out via the Contact Us page.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;

  const FaqItem({required this.question, required this.answer, super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(
        question,
        style:  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            answer,
            style:  const TextStyle(fontSize: 12,color: Colors.black54),
          ),
        ),
      ],
    );
  }
}