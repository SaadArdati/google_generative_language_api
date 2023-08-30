import 'dart:convert';

import 'package:dotenv/dotenv.dart';
import 'package:google_generative_language_api/google_generative_language_api.dart';
import 'package:test/test.dart';

void main() {
  // The API key to use for testing. Stored in .env file.
  late final String apiKey;
  const String modelName = 'models/chat-bison-001';

  setUpAll(() {
    final DotEnv env = DotEnv(includePlatformEnvironment: true)..load();
    apiKey = env['API_KEY']!;
  });

  test('listModels', () async {
    final models = await GenerativeLanguageAPI.listModels(apiKey: apiKey);

    print(const JsonEncoder.withIndent('  ').convert(models));
  });

  test('getModel', () async {
    final model = await GenerativeLanguageAPI.getModel(
      modelName: modelName,
      apiKey: apiKey,
    );

    print(const JsonEncoder.withIndent('  ').convert(model));
  });

  test('generateMessage', () async {
    const request = GenerateMessageRequest(
      prompt: MessagePrompt(
        messages: [
          Message(author: '1', content: 'hi'),
        ],
      ),
    );

    final message = await GenerativeLanguageAPI.generateMessage(
      modelName: modelName,
      request: request,
      apiKey: apiKey,
    );

    print(const JsonEncoder.withIndent('  ').convert(message));
  });
}
