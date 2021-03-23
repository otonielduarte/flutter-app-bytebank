import 'package:bytebank/components/custom_input.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

const _titleAppBar = "Criar nova transferência";
const _labelAccount = "Criar nova transferência";
const _labelValue = "Valor da transferência";
const _placeHolderAccount = "0000";
const _placeHolderValue = "00.00";
const _btnText = "Cadastrar";

class FormTransfer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormTransferState();
  }
}

class FormTransferState extends State<FormTransfer> {
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            CustomInput(
              textController: _accountController,
              label: _labelAccount,
              placeholder: _placeHolderAccount,
            ),
            CustomInput(
              textController: _valueController,
              label: _labelValue,
              placeholder: _placeHolderValue,
              icon: Icons.monetization_on,
            ),
            ElevatedButton(
              child: Text(_btnText),
              onPressed: () => _handlePress(context),
            )
          ],
        ),
      ),
    );
  }

  void _handlePress(context) {
    final accountNumber = int.tryParse(_accountController.text);
    final value = double.tryParse(_valueController.text);
    if (accountNumber != null && value != null) {
      final transfer = Transfer(value: value, accountNumber: accountNumber);
      Navigator.pop(context, transfer);
    }
  }
}
