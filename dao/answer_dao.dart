// import '../entity/answer.dart';
// import 'package:floor/floor.dart';
//
// @dao
// abstract class AnswerDao {
//   @Query('SELECT * FROM ANSWER_TABLE')
//   Future<List<Answer>> findAllAnswers();
//
//   @Query('SELECT answer FROM ANSWER_TABLE WHERE aid = :aid')
//   Future<List<String>> findAnswerByAnswerId(int aid);
//
//   @Query('SELECT * FROM ANSWER_TABLE WHERE uid = :uid')
//   Future<List<Answer>> findAnswerByUserId(int uid);
//
//   @Query('SELECT * FROM ANSWER_TABLE WHERE qid = :qid')
//   Future<List<Answer>> findAnswerByQuestionId(int qid);
//
//   @insert
//   Future<void> insertAnswer(Answer answer);
// }