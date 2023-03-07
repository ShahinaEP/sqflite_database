import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/p2.dart';
import '../model/product_model.dart';
import '../model/profile_model.dart';

class DbHelper {
  static Database? _database;


  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'product.db');

    return await openDatabase(path, version: 4,
        onCreate: (Database db, int version) async {
        //   await db.execute('''
        // CREATE TABLE product (id INTEGER PRIMARY KEY ,title TEXT)
        //   ''');

          await db.execute('''
        CREATE TABLE profile (id INTEGER PRIMARY KEY ,page INTEGER,)
          ''');
        });
  }

  // Insert employee on database
  createEmployee(ProductModel newEmployee) async {
    await deleteAllEmployees();
    final db = await database;
    final res = await db!.insert('product',
        newEmployee.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);

    return res;
  }

  // Delete all employees
  Future<int> deleteAllEmployees() async {
    final db = await database;
    final res = await db!.rawDelete('DELETE FROM product');

    return res;
  }

  // Future<List<ProductModel>> getProductdata() async {
  //   final db = await database;
  //   final res = await db!.rawQuery("SELECT * FROM product");
  //
  //   List<ProductModel> list =
  //   res.isNotEmpty ? res.map((c) => ProductModel.fromJson(c)).toList() : [];
  //
  //   return list;
  // }


  // Insert profile on database
  createProfile(ProfliteListModel profile) async {
    final db = await database;
    final res = await db!.insert('profile',
        {
          "page":profile.page,

        },conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }


  Future<ProfliteListModel?> getProfiledata() async {
    final db = await database;
    final res = await db!.query("profile");
    // <ProfliteListModel>
    print("res : $res ");
    ProfliteListModel? profliteListModel;
    res.map((e) {
      profliteListModel=  ProfliteListModel.fromJson(e);
    }).toList();
print(profliteListModel!.page);
    // String list
    // List<ProfliteListModel> list =
    // res.isNotEmpty ? res.map((c) => ProfliteListModel.fromJson(c)).toList() : [];

    return profliteListModel;
  }
}
