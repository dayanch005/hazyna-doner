import 'package:hazyna_doner/model/services_model.dart';
import 'package:hive/hive.dart';

void registerAdapters() {
  Hive.registerAdapter(ServicesModelAdapter());
  Hive.registerAdapter(PlaceAdapter());
  Hive.registerAdapter(PlaceItemAdapter());
  Hive.registerAdapter(ItemItemAdapter());
}
