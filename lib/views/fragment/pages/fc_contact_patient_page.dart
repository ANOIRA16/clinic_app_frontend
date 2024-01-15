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

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

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
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Send'),
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

  Widget _buildFormField(String label, TextEditingController controller,
      {int maxLines = 1}) {
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

  void _submitForm() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      // Perform the send logic here
      // Access the subject and message using _subjectController.text and _messageController.text
      // Clear the form
      form.reset();
      // Clear the controllers
      _subjectController.clear();
      _messageController.clear();
    }
  }
}
