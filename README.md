# Generative Language API

## Note: This API is not yet public and is only available for Google trusted testers.

A Dart package that provides convenient access to the Generative Language API.
It allows you to interact with the API to generate messages, retrieve models, list available models, 
and count message tokens.

Refer to https://developers.generativeai.google/api/rest/generativelanguage for more information.

## Features

- Generate messages using specified models.
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

You can then use the various methods provided by the package:

```dart
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
```

## Additional Information

For more information, you can refer to the Generative Language API documentation. This package is only
a third party wrapper around the REST API.

If you encounter any issues or have suggestions, please file an issue on GitHub.

## Socials

- [Website](https://saad-ardati.dev/)
- [Twitter](https://twitter.com/SaadArdati)
- [Discord](https://discord.gg/yrahEhCqTJ)
