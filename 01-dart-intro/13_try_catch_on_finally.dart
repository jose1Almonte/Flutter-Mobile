void main() async {

  print('inicio del programa');
  
  try{
    final value = await httpGet('https-jose-almonte.com/cursos');
    print('exito!!: $value');
  } on Exception catch(err) {
    print('Tenemos una Exception: $err');
  }catch(err) {
    print("OOPS! algo terrible paso: $err");
  } finally {
    print('fin del try y catch');
  }

  
  print('fin del programa');
}

Future<String> httpGet( String url ) async {

  await Future.delayed(const Duration(seconds: 1));
  
  throw Exception('No hay parametros en el url');
  // throw 'error en la peticion';


  // return 'Tenemos un valor de la peticion';
}

