import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_template/default_template/components/fx_container_items.dart';
import 'package:fx_flutterap_template/default_template/components/fx_main_bootstrap_container.dart';

class Document {
  final String documentName;
  final String patientName; // Add patient name
  final String type;
  final DateTime date;
  final String downloadUrl; // Assuming a URL for downloading

  Document({
    required this.documentName,
    required this.patientName,
    required this.type,
    required this.date,
    required this.downloadUrl,
  });
}

class FcDocumentsPage extends StatefulWidget {
  static const routeName = '/documents';

  const FcDocumentsPage({Key? key});

  @override
  _FcDocumentsPageState createState() => _FcDocumentsPageState();
}

class _FcDocumentsPageState extends State<FcDocumentsPage> {
  // Sample document data (replace with your actual data fetching logic)
  List<Document> documents = [
    Document(
      documentName: 'Report.pdf',
      patientName: 'John Doe',
      type: 'PDF',
      date: DateTime.now(),
      downloadUrl: '...',
    ),
    Document(
      documentName: 'Proposal.docx',
      patientName: 'Jane Doe',
      type: 'Word Document',
      date: DateTime.now(),
      downloadUrl: '...',
    ),
    // Add more documents
  ];

  String _filter = ''; // For filtering documents

  @override
  Widget build(BuildContext context) {
   List<DataRow> tableRows = documents
    .where((doc) =>
        doc.patientName.toLowerCase().contains(_filter.toLowerCase()) ||
        doc.documentName.toLowerCase().contains(_filter.toLowerCase()))
    .map((document) {
  return DataRow(
    cells: [
      DataCell(Text(document.documentName)),
      DataCell(Text(document.patientName)),
      DataCell(Text(document.type)),
      DataCell(Text(document.date.toString())),
      DataCell(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Download button
            IconButton(
              icon: const Icon(Icons.download),
              onPressed: () async {
                // Implémentez la logique de téléchargement en utilisant document.downloadUrl
              },
            ),
            // Share button
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                // Implémentez la logique de partage
              },
            ),
          ],
        ),
      ),
    ],
  );
}).toList();

List<DataColumn> tableColumns = [
  const DataColumn(label: Text('Name')),
  const DataColumn(label: Text('Name Patient')),
  const DataColumn(label: Text('Type')),
  const DataColumn(label: Text('Date')),
  const DataColumn(label: Text('Actions')),
];

return FxMainBootstrapContainer(
  title: AppLocalizations.of(context)!.documents,
  list: [
      // Add a text field for filtering
    TextField(
      decoration: const InputDecoration(labelText: 'Filter'),
      onChanged: (value) => setState(() => _filter = value),
    ),
    const SizedBox(height: 16), // Espacement entre le champ de filtre et la table
    FxContainerItems(
      title: AppLocalizations.of(context)!.documents,
      information: "It is a documents screen located in "
          "\n fc_documents_page.dart"
          " \n and is used as: \n "
          """FcDocumentsPage()""",
      child: DataTable(
        columns: tableColumns,
        rows: tableRows,
      ),
    ),
  
  ],
  bootstrapSizes: 'col-sm-12 col-ml-12 col-lg-12 col-xl-12',
  description: AppLocalizations.of(context)!.documents,
  );

  }
}