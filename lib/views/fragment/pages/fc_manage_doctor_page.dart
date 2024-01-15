import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
class FcManageDoctorPage extends StatefulWidget {
  static const routeName = '/doctor/manage';

  final Doctor? doctor; // Make Doctor optional

  FcManageDoctorPage({this.doctor});

  @override
  _FcManageDoctorPageState createState() => _FcManageDoctorPageState();
}

class _FcManageDoctorPageState extends State<FcManageDoctorPage> {
  late Doctor doctor;
  late TextEditingController nameController;
  late TextEditingController specializationController;
  late TextEditingController hospitalController;
  String selectedDay = 'Monday';
  String workingHours = '';

  @override
  void initState() {
    super.initState();
    doctor = widget.doctor ?? Doctor( // Use default values if doctor is not provided
      name: '',
      specialization: '',
      hospital: '',
      workingDays: [],
      workingHours: {},
      vacationDates: [],
    );
    nameController = TextEditingController(text: doctor.name);
    specializationController = TextEditingController(text: doctor.specialization);
    hospitalController = TextEditingController(text: doctor.hospital);
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return FxMainBootstrapContainer(
      title: AppLocalizations.of(context)!.doctor_title_2,
      list: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: AppLocalizations.of(context)!.name),
            ),
            TextFormField(
              controller: specializationController,
              decoration: InputDecoration(labelText: AppLocalizations.of(context)!.specialization),
            ),
            TextFormField(
              controller: hospitalController,
              decoration: InputDecoration(labelText: AppLocalizations.of(context)!.hospital),
            ),
            DropdownButton<String>(
              value: selectedDay,
              onChanged: (value) {
                setState(() {
                  selectedDay = value!;
                });
              },
              items: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
                  .map((day) => DropdownMenuItem(value: day, child: Text(day)))
                  .toList(),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  workingHours = value;
                });
              },
              decoration: InputDecoration(labelText: AppLocalizations.of(context)!.working_hours),
            ),
          ],
        ),
      ],
      bootstrapSizes: 'col-sm-16 col-ml-16 col-lg-16 col-xl-12',
      description: AppLocalizations.of(context)!.manage_doctor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement logic to save changes
          // Access updated values using nameController.text, specializationController.text, etc.
          // Also, use selectedDay and workingHours as needed
        },
        child: Icon(Icons.save),
      ),
    );
  }
}
