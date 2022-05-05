import 'package:flutter/cupertino.dart';

class Voucher {
  Data data;
  Voucher({@required this.data});

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        data: Data.fromJson(json["d"]),
      );
}

class Data {
  String voucherid;
  String vouchername;
  double vcrate;
  int minamt;
  String valdate;
  String expdate;

  Data(
      {this.voucherid,
      this.vouchername,
      this.vcrate,
      this.minamt,
      this.valdate,
      this.expdate});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      voucherid: json['voucherid'],
      vouchername: json['vouchername'],
      vcrate: json['vcrate'],
      minamt: json['minamt'],
      valdate: json['valdate'],
      expdate: json['expdate'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['voucherid'] = this.voucherid;
  //   data['vouchername'] = this.vouchername;
  //   data['vcrate'] = this.vcrate;
  //   data['minamt'] = this.minamt;
  //   data['valdate'] = this.valdate;
  //   data['expdate'] = this.expdate;
  //   return data;
  // }
}
