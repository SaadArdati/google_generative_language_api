import 'dart:convert';
import 'package:google_generative_language_api/src/constants.dart';
import 'package:http/http.dart' as http;

import 'models.dart';

/// The GenerativeLanguageAPI class provides methods for interacting with
/// the Generative Language API.
///
/// Please refer to
/// https://developers.generativeai.google/api/rest/generativelanguage
/// for more information.
class GenerativeLanguageAPI {
  const GenerativeLanguageAPI._();

  /// Generates a message using the specified model and request.
  ///
  /// Returns the generated message as a [GeneratedMessage] object.
  ///
  /// Throws an exception if the API request fails.
  static Future<GeneratedMessage> generateMessage({
    required String modelName,
    required GenerateMessageRequest request,
    required String apiKey,
  }) async {
    final url = Uri.https(
        Constants.endpoint, '/v1beta2/models/$modelName:generateMessage', {
      'key': apiKey,
    });

    final headers = {'Content-Type': 'application/json'};

    final response = await http.post(
      url,
      headers: headers,
      body: json.encode(request.toJson()),
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final generatedMessage = GeneratedMessage.fromJson(jsonBody);
      return generatedMessage;
    } else {
      throw Exception('Failed to generate message: ${response.reasonPhrase}');
    }
  }

  /// Retrieves information about the specified model.
  ///
  /// Returns the model information as a [Model] object.
  ///
  /// Throws an exception if the API request fails.
  static Future<Model> getModel({
    required String modelName,
    required String apiKey,
  }) async {
    final url = Uri.https(Constants.endpoint, '/v1beta2/models/$modelName', {
      'key': apiKey,
    });

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final model = Model.fromJson(jsonBody);
      return model;
    } else {
      throw Exception('Failed to get model: ${response.reasonPhrase}');
    }
  }

  /// Lists models available through the API.
  ///
  /// Returns the list of models as a [ListModelResponse] object, which includes
  /// the models and a next page token for pagination.
  ///
  /// Optional parameters:
  /// - [pageSize]: The maximum number of models to return per page. Default is 50.
  /// - [pageToken]: A token received from a previous models.list call to
  /// retrieve the next page.
  ///
  /// Throws an exception if the API request fails.
  static Future<ListModelResponse> listModels({
    int pageSize = 50,
    String? pageToken,
    required String apiKey,
  }) async {
    final url = Uri.https(Constants.endpoint, '/v1beta2/models', {
      'pageSize': pageSize.toString(),
      'pageToken': pageToken,
      'key': apiKey,
    });

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final listModelResponse = ListModelResponse.fromJson(jsonBody);
      return listModelResponse;
    } else {
      throw Exception('Failed to list models: ${response.reasonPhrase}');
    }
  }

  /// Counts the number of tokens in a generated message using the specified
  /// model and request.
  ///
  /// Returns the token count as an integer.
  ///
  /// Throws an exception if the API request fails.
  static Future<int> countMessageTokens({
    required String modelName,
    required CountMessageTokensRequest request,
    required String apiKey,
  }) async {
    final url = Uri.https(
        Constants.endpoint, '/v1beta2/models/$modelName:countMessageTokens', {
      'key': apiKey,
    });

    final headers = {'Content-Type': 'application/json'};

    final response = await http.post(
      url,
      headers: headers,
      body: json.encode(request.toJson()),
    );

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final tokenCount = jsonBody['tokenCount'] as int;
      return tokenCount;
    } else {
      throw Exception(
          'Failed to count message tokens: ${response.reasonPhrase}');
    }
  }
}
