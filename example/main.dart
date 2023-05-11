import 'package:google_generative_language_api/google_generative_language_api.dart';

void main() async {
  const String modelName = 'text-bison-001';

  // Generate a message.
  const MessagePrompt prompt = MessagePrompt(
    messages: [
      Message(author: 'User', content: 'What is the meaning of life?')
    ],
  );

  final GeneratedMessage generatedMessage =
      await GenerativeLanguageAPI.generateMessage(
    modelName: 'text-bison-001',
    request: const GenerateMessageRequest(prompt: prompt),
    apiKey: 'PALM_API_KEY',
  );

  print(generatedMessage.messages.map((message) => message.content).join('\n'));

  // Get model details.
  final Model model = await GenerativeLanguageAPI.getModel(
    modelName: modelName,
    apiKey: 'PALM_API_KEY',
  );

  print('Model Name: ${model.name}');
  print('Description: ${model.description}');
  // Print other relevant model details

  // List all available models for the API key.
  final ListModelResponse listModelResponse =
      await GenerativeLanguageAPI.listModels(
    pageSize: 50,
    pageToken: null,
    apiKey: 'PALM_API_KEY',
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

  // Count tokens of a message.
  final int tokenCount = await GenerativeLanguageAPI.countMessageTokens(
    modelName: modelName,
    request: const CountMessageTokensRequest(prompt: prompt),
    apiKey: 'PALM_API_KEY',
  );

  print('Token Count: $tokenCount');
}
