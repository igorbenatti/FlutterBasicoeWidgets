import 'package:aula_01/drawer_list.dart';
import 'package:aula_01/pages/hello_listview.dart';
import 'package:aula_01/pages/hello_page1.dart';
import 'package:aula_01/pages/hello_page2.dart';
import 'package:aula_01/pages/hello_page3.dart';
import 'package:aula_01/utils/nav.dart';
import 'package:aula_01/widgets/blue_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello Flutter"),
          bottom: TabBar(tabs: [
            Tab(text: "TAB 01",),
            Tab(text: "TAB 02",),
            Tab(text: "TAB 03",),
          ]),
        ),
        body: TabBarView(children: [
          _body(context),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.yellow,
          ),
        ],),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _onClickFab();
          },
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _onClickFab() {
    print("Adicionar");
  }

  _body(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(top: 16),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _text(),
            _pageView(),
            _buttons(),
          ],
        ),
      ),
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 300,
      child: PageView(
        children: <Widget>[
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png"),
        ],
      ),
    );
  }

  _img(String img) {
    return Container(
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }

  _buttons() {
    return Builder(
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("ListView",
                    onPressed: () =>
                        _onClickNavigator(context, HelloListView())),
                BlueButton("Page 02",
                    onPressed: () => _onClickNavigator(context, HelloPage2())),
                BlueButton("Page 03",
                    onPressed: () => _onClickNavigator(context, HelloPage3())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("Snack", onPressed: () => _onClickSnack(context)),
                BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
                BlueButton("Toast", onPressed: _onClickToast),
              ],
            )
          ],
        );
      },
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
  }

  _onClickSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text("Olá Flutter"),
        action: SnackBarAction(
          textColor: Colors.yellow,
          label: "OK",
          onPressed: () {
            print("OK");
          },
        ),
      ),
    );
  }

  _onClickDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text("Flutter é muito legal"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                  print("OK!!!");
                },
              )
            ],
          ),
        );
      },
    );
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "Flutter é muito legal!",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  _text() {
    return Text(
      "Hello World",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.wavy,
      ),
    );
  }
}
