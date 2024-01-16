import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_template/default_template/components/fx_container_items.dart';
import 'package:fx_flutterap_template/default_template/components/fx_main_bootstrap_container.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Doctor {
  int id;
  String name;
  String specialization;

  Doctor({
    this.id = 0,
    required this.name,
    required this.specialization,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialization': specialization,
    };
  }
}

class FcManageDoctorPage extends StatefulWidget {
  static const routeName = '/doctor/manage';

  final Doctor? doctor; // Make Doctor optional

  FcManageDoctorPage({this.doctor});

  @override
  _FcManageDoctorPageState createState() => _FcManageDoctorPageState();
}

class _FcManageDoctorPageState extends State<FcManageDoctorPage> {
  late TextEditingController nameController;
  late TextEditingController specializationController;
  int? selectedDoctorId;
  List<DropdownMenuItem<int>> doctorIds = []; // Populate this list with doctor IDs

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    specializationController = TextEditingController();
    // TODO: Fetch the list of doctors and populate `doctorIds` here
  }

  // Method to add a doctor
  Future<void> addDoctor() async {
    // Implement your logic for adding a doctor
  }

  // Method to update a doctor
  Future<void> updateDoctor(int doctorId) async {
    // Implement your logic for updating a doctor
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.manage_doctor),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButtonFormField<int>(
              value: selectedDoctorId,
              items: doctorIds,
              onChanged: (value) {
                setState(() {
                  selectedDoctorId = value;
                  // TODO: Load the selected doctor's details into the text fields
                });
              },
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.select_doctor,
              ),
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: AppLocalizations.of(context)!.name),
            ),
            TextFormField(
              controller: specializationController,
              decoration: InputDecoration(labelText: AppLocalizations.of(context)!.specialization),
            ),
            SizedBox(height: 20), // Add spacing between the form and the buttons
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      await addDoctor();
                      // Post-add logic here
                    },
                    child: Text(AppLocalizations.of(context)!.add_doctor),
                  ),
                ),
                SizedBox(width: 20), // Spacing between buttons
                Expanded(
                  child: ElevatedButton(
                    onPressed: selectedDoctorId != null ? () async {
                      await updateDoctor(selectedDoctorId!);
                      // Post-update logic here
                    } : null, // Disable the button if no doctor is selected
                    child: Text(AppLocalizations.of(context)!.update_doctor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


