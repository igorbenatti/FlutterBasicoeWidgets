import 'package:flutter/material.dart';

class Dog{
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatefulWidget {

  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: () {
            setState(() {
              _gridView = false;
            });
          },),
          IconButton(icon: Icon(Icons.grid_on), onPressed: () {
            setState(() {
              _gridView = true;
            });
          },)
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog("Jack Russel","assets/images/dog1.png"),
      Dog("Labrador","assets/images/dog2.png"),
      Dog("Pug","assets/images/dog3.png"),
      Dog("Rottweiler","assets/images/dog4.png"),
      Dog("Pastor","assets/images/dog5.png"),
    ];

    if (_gridView){
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dogs.length,
        itemBuilder: (BuildContext context, int index){
          return _itemView(dogs, index);
        },
      );
    } else {
      return ListView.builder(
        itemExtent: 350,
        itemCount: dogs.length,
        itemBuilder: (BuildContext context, int index){
          return _itemView(dogs, index);
        },
      );
    }
  }

  _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index];

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        _img(dog.foto),
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.black45,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Text(
              dog.nome,
              style: TextStyle(fontSize: 26, color: Colors.white),),
          ),
        ),
      ],
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
}
