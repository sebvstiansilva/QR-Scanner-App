import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({Key key, @required this.tipo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_, int index) => Dismissible(
              key: UniqueKey(),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (DismissDirection direction) {
                scanListProvider.borrarScanPorId( scans[index].id );
              },
              child: ListTile(
                leading: Icon(
                  this.tipo == 'http'
                    ? Icons.http : Icons.map,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(scans[index].valor),
                subtitle: Text(scans[index].id.toString()),
                trailing: Icon(Icons.arrow_right),
                onTap: () => print(scans[index].id),
              ),
            )
    );
  }
}
