// import '../entity/person.dart';
// import 'package:floor/floor.dart';
//
// @dao
// abstract class PersonDao {
//   @Query('SELECT * FROM PERSON_TABLE')
//   Future<List<Person>> findAllUsers();
//
//   @Query('SELECT uid FROM PERSON_TABLE WHERE name = :name')
//   Future<List<String>> findUserByName(String name);
//
//   @insert
//   Future<void> insertPerson(Person user);
// }