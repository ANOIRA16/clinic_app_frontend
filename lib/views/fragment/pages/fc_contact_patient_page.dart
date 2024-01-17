import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_template/default_template/components/fx_container_items.dart';
import 'package:fx_flutterap_template/default_template/components/fx_main_bootstrap_container.dart';

class ContactPatientPage extends StatefulWidget {
  static const routeName = '/patients/contact';

  @override
  _ContactPatientPageState createState() => _ContactPatientPageState();
}

class _ContactPatientPageState extends State<ContactPatientPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  // Define contact methods
  Future<void> _contactViaSMS(String message) async {
    // Implement SMS sending logic
  }

  Future<void> _contactViaEmail(String subject, String message) async {
    // Implement Email sending logic
  }

  Future<void> _sendNotification(String message) async {
    // Implement Notification sending logic
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Color headerColor = Colors.grey[400]!;
    Color rowColor = Colors.grey[200]!;

    return FxMainBootstrapContainer(
      title: AppLocalizations.of(context)!.patient_title_1,
      list: [
        FxContainerItems(
          title: AppLocalizations.of(context)!.contactPatient,
          information: "Use the form to contact the patient",
          child: Container(
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildFormField('Subject', _subjectController),
                  _buildFormField('Message', _messageController, maxLines: 5),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildContactButton('Send SMS', () => _contactViaSMS(_messageController.text)),
                      _buildContactButton('Send Email', () => _contactViaEmail(_subjectController.text, _messageController.text)),
                      _buildContactButton('Send Notification', () => _sendNotification(_messageController.text)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
      bootstrapSizes: 'col-sm-16 col-ml-16 col-lg-16 col-xl-12',
      description: AppLocalizations.of(context)!.contactPatient,
    );
  }

  Widget _buildFormField(String label, TextEditingController controller, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          alignLabelWithHint: true,
        ),
        maxLines: maxLines,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label is required';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildContactButton(String text, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        onPrimary: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  void _submitForm() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      // Your existing submission logic
    }
  }
}

// Note: You will need to implement the logic for sending SMS, Email, and Notifications in the respective methods.
