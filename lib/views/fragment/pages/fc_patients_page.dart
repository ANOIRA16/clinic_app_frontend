import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_template/default_template/components/fx_container_items.dart';
import 'package:fx_flutterap_template/default_template/components/fx_main_bootstrap_container.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

// Patient model
class Patient {
  final String firstName;
  final String lastName;
  final String age;
  final String phoneNumber;
  final String address;
  final String inChargeDoctor;
  final String condition;

  Patient({
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.phoneNumber,
    required this.address,
    required this.inChargeDoctor,
    required this.condition,
  });
}

class FcPatientsPage extends StatefulWidget {
  static const routeName = '/patients';

  @override
  _FcPatientsPageState createState() => _FcPatientsPageState();
}

class _FcPatientsPageState extends State<FcPatientsPage> {
  List<Patient> patients = [];

  @override
  void initState() {
    super.initState();
    fetchPatients();
  }

  // Placeholder for fetching patients from an API
  Future<void> fetchPatients() async {
    // TODO: Replace with an actual API call
    final fetchedPatients = await Future.delayed(
      Duration(seconds: 1),
          () => [
        Patient(firstName: 'John', lastName: 'Doe', age: '35', phoneNumber: '555-1234', address: '123 Main St', inChargeDoctor: 'Dr. Smith', condition: 'Flu'),
        Patient(firstName: 'Jane', lastName: 'Smith', age: '28', phoneNumber: '555-5678', address: '456 Oak St', inChargeDoctor: 'Dr. Johnson', condition: 'Broken Arm'),
        Patient(firstName: 'Alice', lastName: 'Johnson', age: '42', phoneNumber: '555-9876', address: '789 Pine St', inChargeDoctor: 'Dr. Davis', condition: 'Allergies'),
        Patient(firstName: 'Bob', lastName: 'Williams', age: '50', phoneNumber: '555-4321', address: '321 Elm St', inChargeDoctor: 'Dr. Wilson', condition: 'High Blood Pressure'),
        Patient(firstName: 'Eva', lastName: 'Davis', age: '19', phoneNumber: '555-8765', address: '654 Birch St', inChargeDoctor: 'Dr. Brown', condition: 'Fractured Leg'),
        // Add more patients here
      ],
    );

    setState(() {
      patients = fetchedPatients.take(5).toList(); // Limit to 5 patients
    });
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
          title: AppLocalizations.of(context)!.patients,
          information: "It is a patients screen located in fc_patients_page.dart",
          child: Container(
            width: double.infinity, // DataTable takes 100% of the width
            child: DataTable(
              columnSpacing: 38,
              headingRowColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                return headerColor;
              }),
              dataRowColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                return rowColor;
              }),
              columns: [
                DataColumn(label: Text('First Name', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                DataColumn(label: Text('Last Name', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                DataColumn(label: Text('Age', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                DataColumn(label: Text('Phone Number', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                DataColumn(label: Text('Address', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                DataColumn(label: Text('Doctor In-Charge', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                DataColumn(label: Text('Condition', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                DataColumn(label: Text('Actions', style: TextStyle(color: InitialStyle.primaryDarkColor))),
              ],
              rows: patients.map((patient) => DataRow(
                cells: [
                  DataCell(Text(patient.firstName, style: TextStyle(color: InitialStyle.primaryColor))),
                  DataCell(Text(patient.lastName, style: TextStyle(color: InitialStyle.primaryColor))),
                  DataCell(Text(patient.age, style: TextStyle(color: InitialStyle.primaryColor))),
                  DataCell(Text(patient.phoneNumber, style: TextStyle(color: InitialStyle.primaryColor))),
                  DataCell(Text(patient.address, style: TextStyle(color: InitialStyle.primaryColor))),
                  DataCell(Text(patient.inChargeDoctor, style: TextStyle(color: InitialStyle.primaryColor))),
                  DataCell(Text(patient.condition, style: TextStyle(color: InitialStyle.primaryColor))),
                  DataCell(Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: InitialStyle.warningColorRegular),
                        onPressed: () {
                          // TODO: Implement patient update logic
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.contact_page, color: InitialStyle.dangerColorRegular),
                        onPressed: () {
                          // TODO: Implement patient contact logic
                        },
                      ),
                    ],
                  )),
                ],
              )).toList(),
            ),
          ),
        ),
      ],
      bootstrapSizes: 'col-sm-16 col-ml-16 col-lg-16 col-xl-12',
      description: AppLocalizations.of(context)!.patients,
    );
  }
}
