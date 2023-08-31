import 'dart:convert';

import 'package:dotenv/dotenv.dart';
import 'package:google_generative_language_api/google_generative_language_api.dart';

/// The API key is stored in the local .env file. Create one if you want to run
/// this example or replace this apiKey with your own.
///
/// DO NOT PUBLICLY SHARE YOUR API KEY.
/// .env file should have a line that looks like this:
///
/// API_KEY=<PALM_API_KEY>
late final String apiKey;

void main() async {
  final DotEnv env = DotEnv(includePlatformEnvironment: true)..load();
  apiKey = env['API_KEY']!;

  const String chatModel = 'models/chat-bison-001';
  const String textModel = 'models/text-bison-001';
  const String embedModel = 'models/embedding-gecko-001';

  // Get model details.
  final Model model = await GenerativeLanguageAPI.getModel(
    modelName: chatModel,
    apiKey: apiKey,
  );

  print('Model Name: ${model.name}');
  print('Description: ${model.description}');
  // Print other relevant model details

  // List all available models for the API key.
  final ListModelResponse listModelResponse =
      await GenerativeLanguageAPI.listModels(
    pageSize: 50,
    pageToken: null,
    apiKey: apiKey,
  );

  print('Models:');
  for (final Model model in listModelResponse.models) {
    print('Name: ${model.name}');
    print('Description: ${model.description}');
    // Print other relevant model details
  }

  if (listModelResponse.nextPageToken != null) {
    print('Next Page Token: ${listModelResponse.nextPageToken}');
  }

  // Generate a message.
  const messagePrompt = MessagePrompt(
    messages: [
      Message(author: '1', content: 'hi'),
    ],
  );
  const messageRequest = GenerateMessageRequest(
    prompt: messagePrompt,
  );

  final GeneratedMessage messageResponse =
      await GenerativeLanguageAPI.generateMessage(
    modelName: chatModel,
    request: messageRequest,
    apiKey: apiKey,
  );

  print(const JsonEncoder.withIndent('  ').convert(messageResponse));

  // Count tokens of a message.
  final int tokenCount = await GenerativeLanguageAPI.countMessageTokens(
    modelName: chatModel,
    request: const CountMessageTokensRequest(prompt: messagePrompt),
    apiKey: apiKey,
  );

  print('Token Count: $tokenCount');

  // Generate text.
  const textRequest = GenerateTextRequest(
    prompt: TextPrompt(text: 'Write a story about a magic backpack.'),
    temperature: 1.0,
    candidateCount: 2,
  );

  final response = await GenerativeLanguageAPI.generateText(
    modelName: textModel,
    request: textRequest,
    apiKey: apiKey,
  );

  print(const JsonEncoder.withIndent('  ').convert(response));

  // Embed text.
  const embedRequest = EmbedTextRequest(text: 'say something nice!');

  final embedResponse = await GenerativeLanguageAPI.embedText(
    modelName: embedModel,
    request: embedRequest,
    apiKey: apiKey,
  );

  print(const JsonEncoder.withIndent('  ').convert(embedResponse));
}
