import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = [];
  int _ultimoItem = 0;

  @override
  void initState() { 
    super.initState();
    _add10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent ) {
        _add10();
      }
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: _createList(),
    );
  }

  Widget _createList() {

    return ListView.builder(
      controller: _scrollController,
      itemCount: _listaNumeros.length,
      itemBuilder: (BuildContext context, int index) {

        final imagen = _listaNumeros[index];

        return FadeInImage(
          fit: BoxFit.contain,
          placeholder: AssetImage('assets/jar-loading.gif'), 
          image: NetworkImage('https://picsum.photos/300/200/?image=$imagen')
        );
     },
    );
  }

  void _add10() {

    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add( _ultimoItem );
    }
    setState(() {});
  }
}