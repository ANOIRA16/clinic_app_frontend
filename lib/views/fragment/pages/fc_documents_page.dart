import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fx_flutterap_template/default_template/components/fx_container_items.dart';
import 'package:fx_flutterap_template/default_template/components/fx_main_bootstrap_container.dart';

class Document {
  final String name;
  final String type;
  final DateTime date;
  final String downloadUrl; // Assuming a URL for downloading

  Document({
    required this.name,
    required this.type,
    required this.date,
    required this.downloadUrl,
  });
}

class FcDocumentsPage extends StatefulWidget {
  static const routeName = '/documents';

  @override
  _FcDocumentsPageState createState() => _FcDocumentsPageState();
}

class _FcDocumentsPageState extends State<FcDocumentsPage> {
  // Sample document data (replace with your actual data fetching logic)
  List<Document> documents = [
    Document(name: 'Report.pdf', type: 'PDF', date: DateTime.now(), downloadUrl: '...'),
    Document(name: 'Proposal.docx', type: 'Word Document', date: DateTime.now(), downloadUrl: '...'),
    // Add more documents
  ];

  String _filter = ''; // For filtering documents

  @override
  Widget build(BuildContext context) {
    List<DataRow> tableRows = documents.where((doc) => doc.name.toLowerCase().contains(_filter.toLowerCase())).map((document) {
      return DataRow(
        cells: [
          DataCell(Text(document.name)),
          DataCell(Text(document.type)),
          DataCell(Text(document.date.toString())),
          DataCell(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Download button
                IconButton(
                  icon: Icon(Icons.download),
                  onPressed: () async {
                    // Implement download logic using document.downloadUrl
                  },
                ),
                // Share button
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    // Implement sharing logic
                  },
                ),
              ],
            ),
          ),
        ],
      );
    }).toList();

    List<DataColumn> tableColumns = [
      DataColumn(label: Text('Name')),
      DataColumn(label: Text('Type')),
      DataColumn(label: Text('Date')),
      DataColumn(label: Text('Actions')),
    ];

    return FxMainBootstrapContainer(
      title: AppLocalizations.of(context)!.documents,
      list: [
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
        // Add a text field for filtering
        TextField(
          decoration: InputDecoration(labelText: 'Filter'),
          onChanged: (value) => setState(() => _filter = value),
        ),
      ],
      bootstrapSizes: 'col-sm-12 col-ml-12 col-lg-12 col-xl-12',
      description: AppLocalizations.of(context)!.documents,
    );
  }
}