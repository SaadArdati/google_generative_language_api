import 'package:google_generative_language_api/google_generative_language_api.dart';

void main() async {
  final MessagePrompt prompt = MessagePrompt(
    messages: [
      Message(author: 'User', content: 'What is the meaning of life?')
    ],
  );

  final GeneratedMessage response = await GenerativeLanguageAPI.generateMessage(
    modelName: 'text-bison-001',
    request: GenerateMessageRequest(prompt: prompt),
    apiKey: 'PALM_API_KEY',
  );

  print(response.messages.map((message) => message.content).join('\n'));
}
