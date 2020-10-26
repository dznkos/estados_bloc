import 'package:estados_cubit/bloc/usuario/usuario_bloc.dart';
import 'package:estados_cubit/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: BlocBuilder<UsuarioBloc, UsuarioState>(
        builder: (_, state) {
          if (state.existeUsuario) {
            return DatosPrincipal(state.usuario);
          } else {
            return Center(
              child: Text('No hay usuario seleccionado'),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.plus_one),
          onPressed: () {
            Navigator.pushNamed(context, 'pagina2');
          }),
    );
  }
}

class DatosPrincipal extends StatelessWidget {
  final Usuario usuario;

  const DatosPrincipal(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ListTile(
            title: Text('Nombre: ${usuario.nombre}'),
          ),
          ListTile(
            title: Text('Edad: ${usuario.edad}'),
          ),
          Text('Professiones',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          Divider(),
          ...usuario.profesiones
              .map((profesion) => ListTile(
                    title: Text(profesion),
                  ))
              .toList()
        ],
      ),
    );
  }
}
