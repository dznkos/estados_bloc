import 'package:estados_cubit/bloc/usuario/usuario_bloc.dart';

import 'package:estados_cubit/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            child: Text('Establecer Usuario',
                style: TextStyle(color: Colors.white)),
            onPressed: () {
              final newUser = Usuario(
                  nombre: 'Luis',
                  edad: 26,
                  profesiones: ['Software', 'Flutter Developer']);

              BlocProvider.of<UsuarioBloc>(context).add(
                ActivarUsuario(newUser),
              );
            },
            color: Colors.blue,
          ),
          MaterialButton(
            child: Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
            onPressed: () {
              BlocProvider.of<UsuarioBloc>(context).add(CambiarEdad(30));
            },
            color: Colors.blue,
          ),
          MaterialButton(
            child: Text('Agregar Profesion',
                style: TextStyle(color: Colors.white)),
            onPressed: () {},
            color: Colors.blue,
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
