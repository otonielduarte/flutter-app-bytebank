import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfers/form.dart';
import 'package:flutter/material.dart';

const _titleAppName = "Transferências";

class TransferList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListTransferListState();
  }
}

class ListTransferListState extends State<TransferList> {
  final List<Transfer> _listTransfer = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppName),
      ),
      body: ListView.builder(
        itemCount: _listTransfer.length,
        itemBuilder: (context, index) => CardItem(_listTransfer[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormTransfer(),
            ),
          ).then(
            (formTransfer) => _handleNewTransfer(formTransfer),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _handleNewTransfer(formTransfer) {
    if (formTransfer != null) {
      setState(() => _listTransfer.add(formTransfer));
    }
  }
}

class CardItem extends StatelessWidget {
  final Transfer _transfer;

  CardItem(this._transfer);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(this._transfer.value.toString()),
        subtitle: Text(this._transfer.accountNumber.toString()),
      ),
    );
  }
}
