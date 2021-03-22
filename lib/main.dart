import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormTransfer(),
      ),
    );
  }
}

class FormTransfer extends StatelessWidget {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar nova transferência'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _accountController,
              style: TextStyle(
                fontSize: 18.5,
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Número da conta',
                hintText: '00000',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _valueController,
              style: TextStyle(
                fontSize: 18.5,
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor da transferência',
                hintText: '0.00',
              ),
            ),
          ),
          ElevatedButton(
            child: Text('Cadastrar'),
            onPressed: () {
              debugPrint('cadastro');
              final accountNumber = int.tryParse(_accountController.text);
              final value = double.tryParse(_valueController.text);
              if (accountNumber != null && value != null) {
                final t = Transfer(value, accountNumber);

                debugPrint(t.toString());
              }
            },
          )
        ],
      ),
    );
  }
}

class TransferList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: [
          CardItem(Transfer(200.00, 123456)),
          CardItem(Transfer(300.00, 321654)),
          CardItem(Transfer(400.00, 654321)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('oi');
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

class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.value, this.accountNumber);

  @override
  String toString() {
    return 'Transfer ({ value: $value, account: $accountNumber })';
  }
}
