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
          CustomTextField(_accountController, 'Número da conta', '0000', null),
          CustomTextField(_valueController, 'Valor da transferência', '00.00', Icons.monetization_on),
          ElevatedButton(
            child: Text('Cadastrar'),
            onPressed: () {
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

class CustomTextField extends StatelessWidget {
  final IconData icon;
  final TextEditingController textController;
  final String label;
  final String placeholder;

  CustomTextField(this.textController, this.label, this.placeholder, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: textController,
        style: TextStyle(
          fontSize: 18.5,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: placeholder,
        ),
        keyboardType: TextInputType.number,
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
