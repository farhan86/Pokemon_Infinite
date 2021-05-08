import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final id;

  const DetailsScreen({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Center(
        child: Text('$id'),
      ),
    );
  }
}
