import 'package:bytebank/screens/dashboard/components/account_value_page.dart';
import 'package:bytebank/screens/deposity/deposity.dart';
import 'package:bytebank/screens/transfers/list.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        body: Column(
          children: [
            AccountValuePage(),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DeposityForm(),
                        ),
                      );
                    },
                    child: Text('Deposity'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TransferList(),
                      ),
                    ),
                    child: Text('List Transfer'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
