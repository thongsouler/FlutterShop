import 'package:flutter/material.dart';
import 'package:testnew/dio/dio_client.dart';
import 'package:testnew/models/voucher.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/voucher';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DioClient _client = DioClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
      ),
      body: Center(
        child: FutureBuilder<Voucher>(
          future: _client.getVoucher(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Voucher userInfo = snapshot.data;
              if (userInfo != null) {
                // Data userData = userInfo.data;
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 8.0),
                    Text(
                      '${userInfo.data.vouchername} ${userInfo.data.voucherid}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                );
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
