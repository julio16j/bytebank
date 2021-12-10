import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'formulario.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferenciaState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: widget._transferencias.length,
          itemBuilder: (context, indice) {
            final transferencia = widget._transferencias[indice];
            return ItemTransferencia(transferencia);
          },
        ),
        appBar: AppBar(
          title: const Text(_tituloAppBar),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const FormularioTransferencia();
              })).then((transferenciaRecebida) {
                _atualizaLista(transferenciaRecebida);
              });
            },
            child: const Icon(Icons.add)));
  }

  void _atualizaLista(transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
}

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = List.empty(growable: true);

  ListaTransferencia({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciaState();
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: const Icon(Icons.monetization_on),
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numeroConta.toString()),
    ));
  }
}
