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
    required this.id,
    required this.name,
    required this.specialization,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id: json['id'],
      name: json['name'],
      specialization: json['specialization'],
    );
  }
}

class FcDoctorsPage extends StatefulWidget {
  static const routeName = '/doctors';

  @override
  _FcDoctorsPageState createState() => _FcDoctorsPageState();
}

class _FcDoctorsPageState extends State<FcDoctorsPage> {
  late Future<List<Doctor>> doctorsFuture;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    doctorsFuture = fetchDoctors();
  }

  Future<List<Doctor>> fetchDoctors() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:8081/api/doctor/doctors'));

      if (response.statusCode == 200) {
        List<dynamic> doctorsData = json.decode(response.body);
        List<Doctor> fetchedDoctors = doctorsData.map((data) => Doctor.fromJson(data)).toList();
        return fetchedDoctors;
      } else {
        throw Exception('Failed to load doctors');
      }
    } catch (e) {
      errorMessage = e.toString();
      throw e;
    }
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
          child: FutureBuilder<List<Doctor>>(
            future: doctorsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No doctors data available.'));
              } else {
                List<Doctor> doctors = snapshot.data!;
                return Container(
                  width: double.infinity,
                  child: DataTable(
                    columnSpacing: 38,
                    headingRowColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                      return headerColor;
                    }),
                    dataRowColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                      return rowColor;
                    }),
                    columns: [
                      DataColumn(label: Text('ID', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                      DataColumn(label: Text('Name', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                      DataColumn(label: Text('Specialization', style: TextStyle(color: InitialStyle.primaryDarkColor))),
                    ],
                  rows: doctors.map((doctor) => DataRow(
                    cells: [
                      DataCell(Text(doctor.id.toString(), style: TextStyle(color: InitialStyle.primaryColor))), // Assuming you have an ID field
                      DataCell(Text(doctor.name, style: TextStyle(color: InitialStyle.primaryColor))),
                      DataCell(Text(doctor.specialization, style: TextStyle(color: InitialStyle.primaryColor))),
                    ],
                  )).toList(),
                ),
              );
            }
          },
        ),
      ),
    ],
    bootstrapSizes: 'col-sm-16 col-ml-16 col-lg-16 col-xl-12',
    description: AppLocalizations.of(context)!.doctors,
  );
}
}