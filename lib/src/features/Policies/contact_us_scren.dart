import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  void _launchEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'srinivasacrmapp@shgroup.in',
      query: 'subject=Support Request&body=Hello, I need help with...', // add subject and body here
    );
    var url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchPhone() async {
    const url = 'tel:+919100106220';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'We’re here to help! If you have questions, feedback, or need support, feel free to reach out.',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              const Text(
                'Contact Information:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: const Icon(Icons.email, color: Colors.blue),
                  title: const Text('Email: srinivasacrmapp@shgroup.in', style: TextStyle(decoration: TextDecoration.underline, color: Colors.black87)),
                  onTap: _launchEmail,
                ),
              ),
              Card(
                elevation: 4,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  leading: const Icon(Icons.phone, color: Colors.green),
                  title: const Text('Phone: +91 9100106220', style: TextStyle(decoration: TextDecoration.underline, color: Colors.black87)),
                  onTap: _launchPhone,
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(width: 10),
                  Expanded(child: Text('Business Hours: Monday to Friday, 10:00 AM to 6 PM (IST)', maxLines: 3, style: TextStyle(fontSize: 14, color: Colors.black54))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}