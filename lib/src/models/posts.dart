import 'package:cloud_firestore/cloud_firestore.dart';

class Posts {
  final double coop;
  final double equity;
  final double kcb;
  final double family;
  final double lukele;
  final double airtelmoney;
  final double token;
  final double cash;
  final Timestamp timestamp;

  Posts(
      {this.coop,
      this.equity,
      this.kcb,
      this.family,
      this.lukele,
      this.airtelmoney,
      this.token,
      this.cash,
      this.timestamp});
}
