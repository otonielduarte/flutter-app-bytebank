import 'package:bytebank/models/transfer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AccountInfo with ChangeNotifier, DiagnosticableTreeMixin {
  double _value = 0;
  final int accountNumber;
  final List<Transfer> _listTransfer = [];

  AccountInfo(this.accountNumber);

  double get value {
    return _value;
  }

  List<Transfer> get listTransfer {
    return this._listTransfer;
  }

  void doDeposity(double value) {
    this._value += value;

    notifyListeners();
  }

  void doTransfer(double value, int accountNumber) {
    if (this._value >= value) {
      this._value -= value;
      this
          ._listTransfer
          .add(Transfer(value: value, accountNumber: accountNumber));
    }

    notifyListeners();
  }

  String get valueString {
    return 'R\$ ${_value.toString()}';
  }
}
