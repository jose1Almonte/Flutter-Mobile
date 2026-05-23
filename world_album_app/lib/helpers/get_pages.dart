import 'package:world_album_app/domain/entities/pages.dart';
import 'package:world_album_app/infrastructure/models/world_album_models.dart';
import 'package:world_album_app/shared/data/local_pages.dart';

class GetPages {
  
  List<Pages> getAllPages() {
    final List<Map<String, dynamic>> sortedList = List.from(countryData);

    sortedList.sort((a, b) => (a['country'] as String).compareTo(b['country'] as String));

    return sortedList
        .map((item) => WorldAlbumModels.fromJsonMap(item).toPageEntity())
        .toList();
  }
}