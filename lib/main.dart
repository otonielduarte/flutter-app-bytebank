import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: TransferList(),
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('oi');
        },
        child: Icon(Icons.add),
      ),
    ),
  ));
}

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CardItem(Transfer(200.00, 123456)),
        CardItem(Transfer(300.00, 321654)),
        CardItem(Transfer(400.00, 654321)),
      ],
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

class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.value, this.accountNumber);
}
