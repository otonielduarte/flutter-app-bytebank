import 'package:bytebank/models/account_info.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfers/form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _titleAppName = "Transferências";

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppName),
      ),
      body: ListView.builder(
        itemCount: context.watch<AccountInfo>().listTransfer.length,
        itemBuilder: (context, index) =>
            CardItem(context.watch<AccountInfo>().listTransfer[index]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormTransfer(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
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
