import 'package:flutter/material.dart';
import 'package:matrix_builder/matrix_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Matrix Builder Demo',
      home: MyExampleApp(),
    );
  }
}

class MyExampleApp extends StatelessWidget {
  const MyExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Matrix Builder Demo"),
      ),
      body: SafeArea(
        child: MatrixBuilder(
          columnBuilder: (BuildContext, int column) {
            return box("$column");
          },
          cellBuilder: (BuildContext, int row, int column) {
            return box("$row*$column");
          },
          headBuilder: (BuildContext, int row) {
            return box("$row");
          },
          rowCount: 10,
          columnCount: 10,
        ),
      ),
    );
  }

  Widget box(String text) => Container(
        child: Center(child: Text(text)),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
        ),
        margin: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 5),
        height: 70,
        width: 70,
      );
}
