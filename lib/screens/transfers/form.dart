import 'package:bytebank/components/custom_input.dart';
import 'package:bytebank/models/account_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _titleAppBar = "Criar nova transferĂȘncia";
const _labelAccount = "Criar nova transferĂȘncia";
const _labelValue = "Valor da transferĂȘncia";
const _placeHolderAccount = "0000";
const _placeHolderValue = "00.00";
const _btnText = "Cadastrar";

class FormTransfer extends StatelessWidget {
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

  void _handlePress(BuildContext context) {
    final accountNumber = int.tryParse(_accountController.text);
    final value = double.tryParse(_valueController.text);
    if (accountNumber != null && value != null) {
      context.read<AccountInfo>().doTransfer(value, accountNumber);
      Navigator.pop(context);
    }
  }
}
