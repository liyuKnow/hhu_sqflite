import 'package:hhu_sqflite/src/data/helper/db_helper.dart';
import 'package:hhu_sqflite/src/data/models/reading_model.dart';

class DBService {
  Future<List<ReadingModel>> getReading() async {
    await DBHelper.init();

    List<Map<String, dynamic>> readings =
        await DBHelper.query(ReadingModel.table);

    return readings.map((item) => ReadingModel.fromMap(item)).toList();
  }

  Future<bool> addReading(ReadingModel model) async {
    await DBHelper.init();

    int ret = await DBHelper.insert(ReadingModel.table, model);

    return ret > 0 ? true : false;
  }

  Future<bool> updateReading(ReadingModel model) async {
    await DBHelper.init();

    int ret = await DBHelper.update(ReadingModel.table, model);

    return ret == 1 ? true : false;
  }

  Future<bool> deleteReading(ReadingModel model) async {
    await DBHelper.init();

    int ret = await DBHelper.delete(ReadingModel.table, model);

    return ret == 1 ? true : false;
  }
}
