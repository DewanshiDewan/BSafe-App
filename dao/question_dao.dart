// import '../entity/question.dart';
// import 'package:floor/floor.dart';
//
// @dao
// abstract class QuestionDao {
//   @Query('SELECT * FROM QUEST_TABLE')
//   Future<List<Question>> findAllQuestions();
//
//   @Query('SELECT question FROM QUEST_TABLE WHERE qid = :qid')
//   Future<List<String>> findQuestionById(int qid);
//
//   @insert
//   Future<void> insertPerson(Question question);
// }