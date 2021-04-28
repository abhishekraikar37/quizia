import 'package:opentdb_client/opentdb_client.dart';

Future<List<OpentdbQuizItem>> fetchQuiz({String type}) async {
  List<OpentdbQuizItem> quizItems;
  final List<OpentdbCategoryItem> categories =
      OpentdbRepository.fetchCategories();
  final OpentdbCategoryItem quizCategory =
      categories.where((element) => element.name == type).first;
  try {
    quizItems = await OpentdbRepository.fetchQuiz(
      category: quizCategory.id,
      amount: 20,
      difficulty: OpentdbQuizDifficalty.EASY,
      type: OpentdbQuizType.MULTIPLE,
    );
  } catch (e) {}
  return quizItems;
}

void main() {
  final List<OpentdbCategoryItem> categories =
      OpentdbRepository.fetchCategories();
  print(categories);
}
