import 'dart:convert';

import 'package:dotenv/dotenv.dart';
import 'package:google_generative_language_api/google_generative_language_api.dart';
import 'package:test/test.dart';

const String chatModel = 'models/chat-bison-001';
const String textModel = 'models/text-bison-001';
const String embedModel = 'models/embedding-gecko-001';

void main() {
  // The API key to use for testing. Stored in .env file.
  late final String apiKey;

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
      modelName: chatModel,
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
      modelName: chatModel,
      request: request,
      apiKey: apiKey,
    );

    print(const JsonEncoder.withIndent('  ').convert(message));
  });

  test('generateText', () async {
    const request = GenerateTextRequest(
      prompt: TextPrompt(text: 'Write a story about a magic backpack.'),
      temperature: 1.0,
      candidateCount: 2,
    );

    final message = await GenerativeLanguageAPI.generateText(
      modelName: textModel,
      request: request,
      apiKey: apiKey,
    );

    print(const JsonEncoder.withIndent('  ').convert(message));
  });

  test('embedText', () async {
    const request = EmbedTextRequest(text: 'say something nice!');

    final message = await GenerativeLanguageAPI.embedText(
      modelName: embedModel,
      request: request,
      apiKey: apiKey,
    );

    print(const JsonEncoder.withIndent('  ').convert(message));
  });

  test('countMessageTokens', () async {
    const request = CountMessageTokensRequest(
      prompt: MessagePrompt(
        messages: [
          Message(content: 'How many tokens?'),
          Message(content: 'For this whole conversation?'),
        ],
      ),
    );

    final int count = await GenerativeLanguageAPI.countMessageTokens(
      modelName: chatModel,
      request: request,
      apiKey: apiKey,
    );

    expect(count, 23);
  });
}
