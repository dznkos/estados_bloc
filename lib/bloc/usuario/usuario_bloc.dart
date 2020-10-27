import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:estados_cubit/models/usuario.dart';

part 'usuario_state.dart';
part 'usuario_event.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState());

  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    print('Hola Mundo');

    if (event is ActivarUsuario) {
      yield UsuarioState(user: event.usuario);
    } else if (event is CambiarEdad) {
      // enviar estado actualizado
      yield UsuarioState(user: state.usuario.coypWith(edad: event.edad));
    }
  }
}
