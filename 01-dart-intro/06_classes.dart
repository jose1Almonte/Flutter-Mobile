void main(){

  final Hero wolverine = Hero(name: 'Logan',power: 'Regeneracion');

  print(wolverine.toString());
  print(wolverine.name);
  print(wolverine.power);
}

class Hero {
  String name;
  String power;

  Hero({
    required this.name, 
    this.power = 'Sin poder'
    });

  @override
  String toString(){
    return '$name - $power';
  }

}

