import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:myquran/src/feature/saved_ayat/domain/saved_ayat.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DataBaseManager {
  DataBaseManager._private();

  static final DataBaseManager instance = DataBaseManager._private();

  Database? _db;

  Future<Database> get db async {
    _db ??= await _initDB();
    return _db!;
  }

  //id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  // $columnId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  //             surah TEXT NOT NULL,
  //             ayat INTEGER NOT NULL,
  //             juz INTEGER NOT NULL,
  //             via TEXT NOT NULL,
  //             index_ayat INTEGER NOT NULL,
  //             last_read INTEGER DEFAULT 0,
  //             ayat_number INTEGER,
  //             ayat_text TEXT,
  //             ayat_translate TEXT,
  //             ayat_tafsir TEXT,
  //             ayat_audio TEXT,
  //             ayat_bookmark INTEGER

  String table = 'saved_ayat';
  String columnId = 'id';
  String columnSurah = 'surah';
  String columnAyat = 'ayat';
  String columnIndexAyat = 'index_ayat';
  String columnLastRead = 'last_read';
  String columnAyatText = 'ayat_text';
  String columnAyatTranslate = 'ayat_translate';

  Future _initDB() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();
    String path = join(docDirectory.path, 'saved_ayat.db');

    final database = await openDatabase(
      path,
      version: 3,
      onCreate: (database, version) async {
        var batch = database.batch();
        _createTableV2(batch);
        await batch.commit();
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        var batch = db.batch();
        if (oldVersion == 2) {
          _onUpgrade(batch);
        }
        await batch.commit();
      },
    );
    return database;
  }

  // void _onCreate(Batch batch) {
  //   batch.execute('DROP TABLE IF EXISTS $table');
  //   batch.execute('''
  //         CREATE TABLE $table(
  //           $columnId TEXT PRIMARY KEY,
  //           $columnSurah TEXT NOT NULL,
  //           $columnAyat INTEGER NOT NULL,
  //           $columnIndexAyat INTEGER NOT NULL,
  //           $columnLastRead INTEGER DEFAULT 0,
  //         )''');
  // }

  void _createTableV2(Batch batch) {
    batch.execute('''
    CREATE TABLE $table (
      $columnId TEXT PRIMARY KEY,
            $columnSurah TEXT NOT NULL,
            $columnAyat INTEGER NOT NULL,
            $columnIndexAyat INTEGER NOT NULL,
            $columnLastRead INTEGER DEFAULT 0,
            $columnAyatText TEXT NOT NULL,
            $columnAyatTranslate TEXT NOT NULL
    )''');
  }

  void _onUpgrade(Batch batch) {
    batch.execute('ALTER TABLE Company RENAME TO $table');
    // batch.execute('ALTER TABLE $table ADD COLUMN $columnAyatText TEXT NOT NULL, ADD COLUMN $columnAyatTranslate TEXT NOT NULL');
  }

  Future<Either<String, SavedAyat>> insertAyat(SavedAyat ayat) async {
    try {
      final db = await instance.db;

      if (ayat.lastRead == true) {
        await db.delete('saved_ayat', where: 'last_read = 1');
      } else {
        List<Map<String, dynamic>> checkData =
            await db.query('saved_ayat', where: 'id = ?', whereArgs: [ayat.id]);
        if (checkData.isNotEmpty) {
          // Data sudah ada
          return const Left('Data sudah ada');
        }
      }
      await db.insert(
        table,
        ayat.toJson(),
      );
      return Right(ayat);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<SavedAyat>>> getBookmarks() async {
    try {
      final db = await instance.db;
      List<Map<String, dynamic>> results = await db.query(table);
      List<SavedAyat> ayats =
          results.map((res) => SavedAyat.fromJson(res)).toList();
      return Right(ayats);
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<Either<String, Map>> getBookmarkById(String id) async {
    try {
      final db = await instance.db;
      List<Map<String, dynamic>> results = await db.query(
        table,
        where: '$columnId = ?',
        whereArgs: [id],
      );
      if (results.isNotEmpty) {
        return Right(results.first);
      } else {
        return left('Data not found');
      }
    } catch (e) {
      return left(e.toString());
    }
  }

  Future<void> removeBookmark(String id) async {
    final db = await instance.db;
    await db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  Future<void> clearBookmark() async {
    final db = await instance.db;

    await db.delete(table);
  }

  Future closeDB() async {
    _db = await instance.db;
    _db!.close();
  }
}
