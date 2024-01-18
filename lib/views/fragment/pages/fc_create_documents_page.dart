import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';

class DocumentType {
  final String value;
  final String label;

  DocumentType({required this.value, required this.label});
}

class FcCreateDocumentsPage extends StatelessWidget {
  static const routeName = '/documents/create';

  const FcCreateDocumentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Document'),
      ),
      body: _DocumentForm(),
    );
  }
}

class _DocumentForm extends StatefulWidget {
  @override
  _DocumentFormState createState() => _DocumentFormState();
}

class _DocumentFormState extends State<_DocumentForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _patientNameController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = (await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;
    if (pickedDate != null && pickedDate != _selectedDate)
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
  }

  Future<String?> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      return result.files.single.path;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CREATE DOCUMENT',
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _patientNameController,
            decoration: InputDecoration(labelText: 'Patient Name'),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Document Name'),
          ),
          const SizedBox(height: 16.0),
          DropdownButtonFormField<String>(
            value: _typeController.text.isNotEmpty ? _typeController.text : null,
            items: [
              DocumentType(value: 'pdf', label: 'PDF'),
              DocumentType(value: 'word', label: 'Word Document'),
            ].map((DocumentType type) {
              return DropdownMenuItem<String>(
                value: type.value,
                child: Text(type.label),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                _typeController.text = value ?? '';
              });
            },
            decoration: InputDecoration(labelText: 'Document Type'),
          ),
          const SizedBox(height: 16.0),
          TextField(
            controller: _dateController,
            decoration: InputDecoration(
              labelText: 'Date',
              suffixIcon: IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () => _selectDate(context),
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              onPressed: () async {
                String? filePath = await _pickFile();
                if (filePath != null) {
                  print('Selected file: $filePath');
                  _linkController.text = filePath;
                }
              },
              icon: Icon(Icons.file_upload),
              label: Text('UPLOAD DOCUMENT'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Add logic to save the document using the different controllers
            },
            child: Text('SAVE DOCUMENT'),
          ),
        ],
      ),
    );
  }
}