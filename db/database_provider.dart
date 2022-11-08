import 'package:application_1/model/Response.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';

class DatabaseProvider{
  static const String ID= "id";
  static const String Responses= "responses";
  static const String Auditor_name= "name";
  static const String Designation= "designation";
  static const String safety= "isSafe";
  static const String location= "location";
  static const String areas_Visited= "areas_Visited";



  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  static Database? _database;

  Future<Database?> get database async {
    print("database getter called");

    if(database != null){
      return _database;
    }

    _database = await createDatabase();

    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(
      join(dbPath, 'mainDB.db'),
      version: 1,
      onCreate: (Database database, int version) async {
        print("Creating responses table");

        await database.execute(
          "Create Table $Responses ("
              "$ID INTEGER PRIMARY KEY,"
              "$Auditor_name TEXT,"
              "$Designation TEXT,"
              "$safety TEXT,"
              "$location TEXT,"
              "$areas_Visited TEXT"
              ")",
        );
      },
    );
  }

  Future<List<Response>> getResponses() async {
    final db = await database;

    var responses = await db
        ?.query(Responses, columns: [ID, Auditor_name, safety, location, areas_Visited]);

    List<Response> ResponsesList = <Response>[];

    responses?.forEach((currentResponse) {
      Response response = Response.fromMap(currentResponse);

      ResponsesList.add(response);
    });

    return ResponsesList;
  }
  Future<Response> insert(Response response) async {
    final db = await database;
    response.id = await db?.insert(Responses, response.toMap());
    return response;
  }

  Future<int?> delete(int id) async {
    final db = await database;

    return await db?.delete(
      Responses,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int?> update(Response response) async {
    final db = await database;

    return await db?.update(
      Responses,
      response.toMap(),
      where: "id = ?",
      whereArgs: [response.id],
    );
  }

}