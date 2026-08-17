import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Data/Models/QuestionsModel.dart';
import '../dio/DioProvider.dart';

final employeeQuestionsListProvider =
    FutureProvider.autoDispose<List<QuestionItem>>((ref) async {
  try {
    final response =
        await ref.watch(dioProvider).get(ApiClient.submitEmployeeQuestion);
    final model = QuestionsResponseModel.fromJson(response.data);
    return model.data;
  } catch (e) {
    return [];
  }
});

Future<Map<String, dynamic>> submitQuestionAnswer(
  dynamic refOrContainer, {
  required dynamic questionId,
  required String answer,
}) async {
  final dio = refOrContainer is WidgetRef
      ? refOrContainer.read(dioProvider)
      : (refOrContainer as Ref).read(dioProvider);

  var formData = FormData.fromMap({
    'question_id': questionId,
    'id': questionId,
    'answer': answer,
  });

  var response = await dio.post(
    ApiClient.submitEmployeeQuestionAnswer,
    data: formData,
  );

  if (response.data is Map<String, dynamic>) {
    return response.data;
  }
  return {
    'status': (response.statusCode == 200 || response.statusCode == 201) ? 1 : 0,
    'message': 'Answer submitted successfully',
  };
}
