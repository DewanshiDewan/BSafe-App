import 'package:application_1/db/database_provider.dart';

class Response {
  static int count=0;
  int? id;
  String? auditorName;
  String? designation;
  String? location;
  String? isSafe;
  String? areasVisited;

  Response({this.auditorName, this.designation, this.isSafe, this.location, this.areasVisited}){
    id=count;
    count++;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.Auditor_name: auditorName,
      DatabaseProvider.Designation: designation,
      DatabaseProvider.safety: isSafe,
      DatabaseProvider.areas_Visited: areasVisited,
      DatabaseProvider.location: location
    };

    map[DatabaseProvider.ID] = id;

    return map;
  }

  Response.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseProvider.ID];
    auditorName = map[DatabaseProvider.Auditor_name];
    designation = map[DatabaseProvider.Designation];
    isSafe = map[DatabaseProvider.safety];
    location = map[DatabaseProvider.location];
    areasVisited = map[DatabaseProvider.areas_Visited];
  }
}