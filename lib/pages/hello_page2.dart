import 'package:aula_01/widgets/blue_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 02"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
      child: BlueButton(
        "Voltar",
        onPressed: () => _onClickVoltar(context),
      ),
    );
  }

  _onClickVoltar(BuildContext context) {
    Navigator.pop(context, "Tela 02");
  }
}
