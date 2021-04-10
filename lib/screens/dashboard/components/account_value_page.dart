import 'package:bytebank/models/account_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountValuePage extends StatelessWidget {
  const AccountValuePage();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          '${context.watch<AccountInfo>().valueString}',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
