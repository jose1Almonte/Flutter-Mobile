void main(){
  print('inicio del programa');
  httpGet('https-jose-almonte.com/cursos').then((value) {
    print(value);
  }).catchError( (err) {
    print('Error: $err');
  });
  print('fin del programa');
}

Future<String> httpGet( String url ){
  return Future.delayed( const Duration(seconds: 1), () {
    throw 'error en la peticion http';
    // return 'respuesta de la peticiosn http';
  });
}

