import 'package:bytebank/components/custom_input.dart';
import 'package:bytebank/models/account_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeposityForm extends StatelessWidget {
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo deposito"),
      ),
      body: Column(
        children: <Widget>[
          CustomInput(
            textController: _valueController,
            label: "Valor do deposito",
            placeholder: "value",
            icon: Icons.monetization_on,
          ),
          ElevatedButton(
            child: Text("Depositar"),
            onPressed: () {
              _handleDeposity(context);
            },
          )
        ],
      ),
    );
  }

  void _handleDeposity(BuildContext context) {
    final deposityValue = double.tryParse(_valueController.text);
    if (deposityValue != null) {
      context.read<AccountInfo>().doDeposity(deposityValue);
    }
    Navigator.pop(context);
  }
}
