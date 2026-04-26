void main(){
  emitNumbers().listen((value){
    print( 'Stream value: $value' );
  
  });

}

Stream<int> emitNumbers() async*{
  final valuesToEmit = [1,2,3,4,5];

  for (int i in valuesToEmit){
    await Future.delayed(const Duration(seconds: 1));
    yield i;
  }
}


// Caso: Consultar el clima actual
Future<String> getWeather() async {
  await Future.delayed(Duration(seconds: 2));
  return "Soleado, 25°C"; // Aquí termina la función
}

// Caso: Un temporizador de 5 segundos
Stream<int> countdown() async* {
  for (int i = 5; i >= 1; i--) {
    await Future.delayed(Duration(seconds: 1));
    yield i; // Emite el segundo actual y la función continúa viva
  }
}

// Caso: Generador de logs en tiempo real
Stream<String> processLogs(List<String> logs) async* {
  for (var log in logs) {
    await Future.delayed(Duration(milliseconds: 500));
    yield "Procesando: $log"; // Va entregando cada log uno a uno
  }
}


 