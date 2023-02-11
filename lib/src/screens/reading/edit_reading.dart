import 'package:flutter/material.dart';
import 'package:hhu_sqflite/src/data/models/reading_model.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class EditReading extends StatefulWidget {
  const EditReading({super.key, this.readingModel});
  final ReadingModel? readingModel;

  @override
  State<EditReading> createState() => _EditReadingState();
}

class _EditReadingState extends State<EditReading> {
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> globalKey = GlobalKey<FormState>();
    return Scaffold(
        appBar: AppBar(
          title: Text("Edit Reading"),
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
        body: Form(
          key: globalKey,
          child: _formUI(),
        ));
  }

  _formUI() {
    return SingleChildScrollView(
      child: Column(
        children: [
          FormHelper.inputFieldWidgetWithLabel(context, "customerName",
              "CustomerName", "Meter reading in KWH", () {}, () {},
              borderRadius: 10, isReadonly: true),
          FormHelper.inputFieldWidgetWithLabel(context, "meterReading",
              "Meter Reading", "Meter reading in KWH", () {}, () {},
              borderRadius: 10, isNumeric: true)
        ],
      ),
    );
  }
}
