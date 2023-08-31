# Generative Language API (PaLM)

A Dart package that provides convenient access to the Generative Language API.
It allows you to interact with the API to generate messages, generate text, embed text, retrieve models,
list available models, and count message tokens.

This package is a third party wrapper around the REST API, it is not an official Google package. With that in mind,
I have tried to make the package as easy to use as possible, adapting the models and documentation to Dart as accurately
as possible. If you encounter any discrepancies, issues, or have suggestions, please file an issue on GitHub.

The PaLM API allows developers to build generative AI applications using the PaLM model.
Large Language Models (LLMs) are a powerful, versatile type of machine learning model that enables computers to
comprehend and generate natural language through a series of prompts.

The PaLM API is based on Google's next generation LLM, PaLM. It excels at a variety of different tasks like code
generation, reasoning, and writing. You can use the PaLM API to build generative AI applications for use cases like
content generation, dialogue agents, summarization and classification systems, and more.

Refer to https://developers.generativeai.google/api/rest/generativelanguage for more information.

## Features

- Generate messages using specified models.
- Generate text using specified models.
- Embed text using specified models.
- Retrieve details of a specific model.
- List available models with pagination support.
- Count the number of tokens in a message.

## Getting Started

Before you can use this package, you need to obtain an API key for the Generative Language API. Follow these steps:

1. Sign up for a Google Cloud Platform account and create a new project.
2. Enable the Generative Language API for your project.
3. Generate an API key for your project.

## Usage

Import the package into your Dart file:

```dart
import 'package:google_generative_language_api/google_generative_language_api.dart';
```

You can then use the various methods provided by the package like so:

### Get model details
```dart
void main() async {
  final Model model = await GenerativeLanguageAPI.getModel(
    modelName: modelName,
    apiKey: 'PALM_API_KEY',
  );

  print('Model Name: ${model.name}');
  print('Description: ${model.description}');
  // Print other relevant model details
}
```

### List all available models
```dart
void main() async {
  final ListModelResponse response =
      await GenerativeLanguageAPI.listModels(apiKey: 'PALM_API_KEY');

  print('Models:');
  for (final Model model in response.models) {
    print('Name: ${model.name}');
    print('Description: ${model.description}');
    // Print other relevant model details
  }

  if (response.nextPageToken != null) {
    print('Next Page Token: ${response.nextPageToken}');
  }
}
```

### Generate messages

```dart
void main() async {
  const request = GenerateMessageRequest(
    prompt: MessagePrompt(
      messages: [
        Message(author: '1', content: 'hi'),
      ],
    ),
  );

  final GeneratedMessage generatedMessage =
  await GenerativeLanguageAPI.generateMessage(
    modelName: 'models/chat-bison-001',
    request: request,
    apiKey: 'PALM_API_KEY',
  );

  print(generatedMessage.messages.map((message) => message.content).join('\n'));
  print(generatedMessage.candidates.map((message) => message.content).join('\n'));
}
```

### Generate text

```dart
void main() async {
  const request = GenerateTextRequest(
    prompt: TextPrompt(text: 'Write a story about a magic backpack.'),
    temperature: 1.0,
    candidateCount: 2,
  );

  final GeneratedText text = await GenerativeLanguageAPI.generateText(
    modelName: 'models/text-bison-001',
    request: request,
    apiKey: 'PALM_API_KEY',
  );

  print(text.candidates.map((candidate) => candidate.output).join('\n'));
}
```

### Embed Text

```dart
void main() async {
  const request = EmbedTextRequest(text: 'say something nice!');

  final EmbeddedText embed = await GenerativeLanguageAPI.embedText(
    modelName: 'models/embedding-gecko-001',
    request: request,
    apiKey: 'PALM_API_KEY',
  );

  print(embed.embedding.values.join('\n'));
}
```

### Count tokens in a message
```dart
void main() async {
  final int tokenCount = await GenerativeLanguageAPI.countMessageTokens(
    modelName: modelName,
    request: CountMessageTokensRequest(prompt: prompt),
    apiKey: 'PALM_API_KEY',
  );

  print('Token Count: $tokenCount');
}
```

## Additional Information

For more information, you can refer to the Generative Language API documentation. This package is only
a third party wrapper around the REST API.

If you encounter any issues or have suggestions, please file an issue on GitHub.

## Socials

- [Website](https://saad-ardati.dev/)
- [Twitter](https://twitter.com/SaadArdati)
- [Discord](https://discord.gg/yrahEhCqTJ)
