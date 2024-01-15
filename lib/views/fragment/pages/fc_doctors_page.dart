import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_template/default_template/components/fx_container_items.dart';
import 'package:fx_flutterap_template/default_template/components/fx_main_bootstrap_container.dart';
import 'package:fx_flutterap_template/default_template/structure/structure_styles.dart';

class Doctor {
  final String name;
  final String specialization;
  final String hospital;
  final List<String> workingDays;
  final Map<String, List<String>> workingHours;
  final List<DateTime> vacationDates;

  Doctor({
    required this.name,
    required this.specialization,
    required this.hospital,
    required this.workingDays,
    required this.workingHours,
    required this.vacationDates,
  });
}

class FcDoctorsPage extends StatefulWidget {
  static const routeName = '/doctors';

  @override
  _FcDoctorsPageState createState() => _FcDoctorsPageState();
}

class _FcDoctorsPageState extends State<FcDoctorsPage> {
  List<Doctor> doctors = [];

  @override
  void initState() {
    super.initState();
    fetchDoctors();
  }

  // Placeholder for fetching doctors from an API
  Future<void> fetchDoctors() async {
    // TODO: Replace with an actual API call
    final List<Doctor> demoDoctors = [
      Doctor(
        name: 'Dr. James Smith',
        specialization: 'Cardiologist',
        hospital: 'City Hospital',
        workingDays: ['Monday', 'Wednesday', 'Friday'],
        workingHours: {
          'Monday': ['9:00 AM - 5:00 PM'],
          'Wednesday': ['10:00 AM - 6:00 PM'],
          'Friday': ['8:00 AM - 4:00 PM'],
        },
        vacationDates: [DateTime(2023, 7, 10), DateTime(2023, 12, 20)],
      ),
      Doctor(
        name: 'Dr. Emily Johnson',
        specialization: 'Orthopedic Surgeon',
        hospital: 'Central Medical Center',
        workingDays: ['Tuesday', 'Thursday', 'Saturday'],
        workingHours: {
          'Tuesday': ['8:00 AM - 4:00 PM'],
          'Thursday': ['9:00 AM - 5:00 PM'],
          'Saturday': ['10:00 AM - 2:00 PM'],
        },
        vacationDates: [DateTime(2023, 8, 15), DateTime(2023, 11, 5)],
      ),
      Doctor(
        name: 'Dr. Michael Brown',
        specialization: 'Pediatrician',
        hospital: 'Children\'s Clinic',
        workingDays: ['Monday', 'Tuesday', 'Thursday'],
        workingHours: {
          'Monday': ['9:00 AM - 5:00 PM'],
          'Tuesday': ['8:00 AM - 4:00 PM'],
          'Thursday': ['10:00 AM - 6:00 PM'],
        },
        vacationDates: [DateTime(2023, 6, 7), DateTime(2023, 9, 25)],
      ),
      Doctor(
        name: 'Dr. Sarah Davis',
        specialization: 'Dermatologist',
        hospital: 'SkinCare Clinic',
        workingDays: ['Wednesday', 'Friday'],
        workingHours: {
          'Wednesday': ['1:00 PM - 7:00 PM'],
          'Friday': ['8:00 AM - 2:00 PM'],
        },
        vacationDates: [DateTime(2023, 10, 12), DateTime(2023, 12, 31)],
      ),
      Doctor(
        name: 'Dr. Robert Miller',
        specialization: 'General Practitioner',
        hospital: 'Community Health Center',
        workingDays: ['Monday', 'Thursday', 'Saturday'],
        workingHours: {
          'Monday': ['10:00 AM - 4:00 PM'],
          'Thursday': ['9:00 AM - 5:00 PM'],
          'Saturday': ['8:00 AM - 12:00 PM'],
        },
        vacationDates: [DateTime(2023, 7, 22), DateTime(2023, 11, 18)],
      ),
    ];

    setState(() {
      doctors = demoDoctors; // Load all doctors
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    Color headerColor = Colors.grey[400]!;
    Color rowColor = Colors.grey[200]!;

    return FxMainBootstrapContainer(
      title: AppLocalizations.of(context)!.doctor_title_1,
      list: [
        FxContainerItems(
          title: AppLocalizations.of(context)!.doctors,
          information: "It is a doctors screen located in fc_doctors_page.dart",
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
                DataColumn(label: Text('Name', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                DataColumn(label: Text('Specialization', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                DataColumn(label: Text('Hospital', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                DataColumn(label: Text('Working Days', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                DataColumn(label: Text('Working Hours', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                DataColumn(label: Text('Vacation Dates', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                DataColumn(label: Text('Actions', style: TextStyle(color: InitialStyle.primaryDarkColor))),
              ],
              rows: doctors.map((doctor) => DataRow(
                cells: [
                  DataCell(Text(doctor.name, style: TextStyle(color: InitialStyle.primaryColor))),
                  DataCell(Text(doctor.specialization, style: TextStyle(color: InitialStyle.primaryColor))),
                  DataCell(Text(doctor.hospital, style: TextStyle(color: InitialStyle.primaryColor))),
                  DataCell(Text(doctor.workingDays.join(', '), style: TextStyle(color: InitialStyle.primaryColor))),
                  DataCell(Text(_formatWorkingHours(doctor.workingHours), style: TextStyle(color: InitialStyle.primaryColor))),
                  DataCell(Text(_formatVacationDates(doctor.vacationDates), style: TextStyle(color: InitialStyle.primaryColor))),
                  DataCell(Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit, color: InitialStyle.warningColorRegular),
                        onPressed: () {
                          // TODO: Implement doctor update logic
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.schedule, color: InitialStyle.dangerColorRegular),
                        onPressed: () {
                          // TODO: Implement doctor schedule logic
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
      description: AppLocalizations.of(context)!.doctors,
    );
  }

  String _formatWorkingHours(Map<String, List<String>> workingHours) {
    List<String> formattedHours = [];
    workingHours.forEach((day, hours) {
      formattedHours.add('$day: ${hours.join(', ')}');
    });
    return formattedHours.join(', ');
  }

  String _formatVacationDates(List<DateTime> vacationDates) {
    return vacationDates.map((date) => date.toLocal().toString().split(' ')[0]).join(', ');
  }
}
