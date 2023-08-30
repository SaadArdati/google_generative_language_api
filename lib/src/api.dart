import 'dart:convert';

import 'package:http/http.dart' as http;

import 'constants.dart';
import 'models/models.dart';

const Map<String, String> _headers = {'Content-Type': 'application/json'};

/// The GenerativeLanguageAPI class provides methods for interacting with
/// the Generative Language API.
///
/// Please refer to
/// https://developers.generativeai.google/api/rest/generativelanguage
/// for more information.
class GenerativeLanguageAPI {
  const GenerativeLanguageAPI._();

  /// Gets information about a specific [Model].
  ///
  /// [Returns] the model information as a [Model] object.
  ///
  /// Throws an exception if the API request fails.
  static Future<Model> getModel({
    required String modelName,
    required String apiKey,
  }) async {
    final Uri url = Uri.https(Constants.endpoint, '/v1beta2/$modelName', {
      'key': apiKey,
    });

    final http.Response response = await http.get(
      url,
      headers: _headers,
    );

    print(response.body);
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return Model.fromJson(jsonBody);
    } else {
      throw Exception('Failed to get model: ${response.reasonPhrase}');
    }
  }

  /// Lists models available through the API.
  ///
  /// [Returns] the list of models as a [ListModelResponse] object, which
  /// includes the models and a next page token for pagination.
  ///
  /// Optional parameters:
  /// - [pageSize] The maximum number of models to return per page.
  /// Default is 50.
  /// - [pageToken] A token received from a previous models.list call to
  /// retrieve the next page.
  ///
  /// Throws an exception if the API request fails.
  static Future<ListModelResponse> listModels({
    int pageSize = 50,
    String? pageToken,
    required String apiKey,
  }) async {
    final Uri url = Uri.https(Constants.endpoint, '/v1beta2/models', {
      'pageSize': '$pageSize',
      'pageToken': pageToken,
      'key': apiKey,
    });

    final http.Response response = await http.get(
      url,
      headers: _headers,
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return ListModelResponse.fromJson(jsonBody);
    } else {
      throw Exception('Failed to list models: ${response.reasonPhrase}');
    }
  }

  /// Runs a model's tokenizer on a string and returns the token count.
  ///
  /// [Returns] the token count as an integer.
  ///
  /// Throws an exception if the API request fails.
  static Future<int> countMessageTokens({
    required String modelName,
    required CountMessageTokensRequest request,
    required String apiKey,
  }) async {
    final Uri url = Uri.https(
        Constants.endpoint, '/v1beta2/$modelName:countMessageTokens', {
      'key': apiKey,
    });

    final http.Response response = await http.post(
      url,
      headers: _headers,
      body: json.encode(request.toJson()),
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return jsonBody['tokenCount'] as int;
    } else {
      throw Exception(
          'Failed to count message tokens: ${response.reasonPhrase}');
    }
  }

  /// Generates a response from the model given an input [MessagePrompt].
  ///
  /// [Returns] the generated message as a [GeneratedMessage] object.
  ///
  /// Throws an exception if the API request fails.
  static Future<GeneratedMessage> generateMessage({
    required String modelName,
    required GenerateMessageRequest request,
    required String apiKey,
  }) async {
    final Uri url =
        Uri.https(Constants.endpoint, '/v1beta2/$modelName:generateMessage', {
      'key': apiKey,
    });

    final http.Response response = await http.post(
      url,
      headers: _headers,
      body: json.encode(request.toJson()),
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return GeneratedMessage.fromJson(jsonBody);
    } else {
      throw Exception('Failed to generate message: ${response.reasonPhrase}');
    }
  }

  /// Generates a response from the model given an input message.
  ///
  /// [Returns] the generated text as a [GeneratedText] object.
  ///
  /// Throws an exception if the API request fails.
  static Future<GeneratedText> generateText({
    required String modelName,
    required GenerateTextRequest request,
    required String apiKey,
  }) async {
    final Uri url =
        Uri.https(Constants.endpoint, '/v1beta2/$modelName:generateText', {
      'key': apiKey,
    });

    final http.Response response = await http.post(
      url,
      headers: _headers,
      body: json.encode(request.toJson()),
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return GeneratedText.fromJson(jsonBody);
    } else {
      throw Exception('Failed to generate message: ${response.reasonPhrase}');
    }
  }

  /// Generates an embedding from the model given an input message.
  ///
  /// [Returns] the generated embedding as an [EmbedTextResponse] object.
  ///
  /// Throws an exception if the API request fails.
  static Future<EmbedTextResponse> embedText({
    required String modelName,
    required EmbedTextRequest request,
    required String apiKey,
  }) async {
    final Uri url =
        Uri.https(Constants.endpoint, '/v1beta2/$modelName:embedText', {
      'key': apiKey,
    });

    final http.Response response = await http.post(
      url,
      headers: _headers,
      body: json.encode(request.toJson()),
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return EmbedTextResponse.fromJson(jsonBody);
    } else {
      throw Exception('Failed to embed text: ${response.reasonPhrase}');
    }
  }
}
