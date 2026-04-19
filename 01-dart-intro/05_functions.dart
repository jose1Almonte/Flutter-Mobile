void main(){
  print(greetEveryone());
  print('Suma ${addTwoNumbers(10, 20)}');
  print('Suma Opcional ${addTwoNumbersOptional(10)}');

  print(greetPerson(name: 'Fernando', message: 'Hi'));
  
}

String greetEveryone() => 'Hello everyone!';

int addTwoNumbers(int a, int b) => a + b;

int addTwoNumbersOptional(int a, [ int b = 0]) {
  
  // b = b ?? 0; // Si b tiene un valor se queda igual, de lo contrario b = 0
  // b = b + 1;
  
  // b??=0;
  // b++;

  return a + b;
  }

String greetPerson( {required String name, String message = 'Hola,'} ){
  return '$message, Fernando!';
}
