import 'package:world_album_app/domain/entities/pages.dart';

class WorldAlbumModels {
  final String country;
  final num page;

  WorldAlbumModels({required this.country, required this.page});

  factory WorldAlbumModels.fromJsonMap(Map<String, dynamic> json) => WorldAlbumModels(
    country: json['country'], page: json['page']);
  
  Map<String, dynamic> toJson() =>{
    "country":country,    
    "page":page,      
  };

  Pages toPageEntity() => Pages(country: country, page: page); 
}