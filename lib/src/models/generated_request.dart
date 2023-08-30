import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'prompt.dart';
import 'safety.dart';

part 'generated_request.g.dart';

/// Represents an abstract request to generate text or a message.
abstract class GenerateRequestBase<T extends Prompt> with EquatableMixin {
  /// The structured textual input given to the model as a prompt.
  ///
  /// Given a prompt, the model will return what it predicts is the next message
  /// in the discussion.
  final T prompt;

  /// Controls the randomness of the output. Note: The default value varies by
  /// model, see the [Model.temperature] attribute of the [Model] returned the
  /// [getModel] function.
  ///
  /// Values can range from [0.0,1.0], inclusive. A value closer to 1.0 will
  /// produce responses that are more varied and creative, while a value closer
  /// to 0.0 will typically result in more straightforward responses from the
  /// model.
  final double? temperature;

  /// Number of generated responses to return.
  ///
  /// This value must be between [1, 8], inclusive. If unset, this will default
  /// to 1.
  final int? candidateCount;

  /// The maximum cumulative probability of tokens to consider when sampling.
  ///
  /// The model uses combined Top-k and nucleus sampling.
  ///
  /// Tokens are sorted based on their assigned probabilities so that only the
  /// most likely tokens are considered. Top-k sampling directly limits the
  /// maximum number of tokens to consider, while Nucleus sampling limits number
  /// of tokens based on the cumulative probability.
  ///
  /// Note: The default value varies by model, see the [Model.topP] attribute
  /// of the [Model] returned the [getModel] function.
  final double? topP;

  /// The maximum number of tokens to consider when sampling.
  ///
  /// The model uses combined Top-k and nucleus sampling.
  ///
  /// Top-k sampling considers the set of [topK] most probable tokens.
  /// Defaults to 40.
  ///
  /// Note: The default value varies by model, see the [Model.topK] attribute of
  /// the [Model] returned the getModel function.
  final int? topK;

  /// Constructs a [GenerateRequestBase] object.
  const GenerateRequestBase({
    required this.prompt,
    this.temperature,
    this.candidateCount,
    this.topP,
    this.topK,
  });

  @override
  List<Object?> get props => [prompt, temperature, candidateCount, topP, topK];
}

/// Represents a request to generate text.
@JsonSerializable()
class GenerateTextRequest extends GenerateRequestBase<TextPrompt> {
  /// A list of unique SafetySetting instances for blocking unsafe content.
  ///
  /// that will be enforced on the [GenerateTextRequest.prompt] and
  /// [GenerateTextResponse.candidates]. There should not be more than one
  /// setting for each [SafetyCategory type]. The API will block any prompts
  /// and responses that fail to meet the thresholds set by these settings.
  ///
  /// This list overrides the default settings for each [SafetyCategory]
  /// specified in the [safetySettings]. If there is no [SafetySetting] for a
  /// given [SafetyCategory] provided in the list, the API will use the default
  /// safety setting for that category.
  final List<SafetySetting> safetySettings;

  /// The set of character sequences (up to 5) that will stop output generation.
  /// If specified, the API will stop at the first appearance of a stop
  /// sequence. The stop sequence will not be included as part of the response.
  final List<String> stopSequences;

  /// The maximum number of tokens to include in a candidate.
  ///
  /// If unset, this will default to [outputTokenLimit] specified in the
  /// [Model] specification.
  final int? maxOutputTokens;

  /// Constructs a [GenerateTextRequest] object.
  const GenerateTextRequest({
    required super.prompt,
    this.safetySettings = const [],
    this.stopSequences = const [],
    super.temperature,
    super.candidateCount,
    this.maxOutputTokens,
    super.topP,
    super.topK,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        safetySettings,
        stopSequences,
        maxOutputTokens,
      ];

  /// Creates a [GenerateTextRequest] instance from a JSON map.
  factory GenerateTextRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateTextRequestFromJson(json);

  /// Converts the [GenerateTextRequest] instance to a JSON map.
  Map<String, dynamic> toJson() => _$GenerateTextRequestToJson(this);
}

/// Represents a request to generate a message.
@JsonSerializable()
class GenerateMessageRequest extends GenerateRequestBase<MessagePrompt> {
  /// Constructs a [GenerateMessageRequest] object.
  const GenerateMessageRequest({
    required super.prompt,
    super.temperature,
    super.candidateCount,
    super.topP,
    super.topK,
  });

  /// Creates a [GenerateMessageRequest] instance from a JSON map.
  factory GenerateMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateMessageRequestFromJson(json);

  /// Converts the [GenerateMessageRequest] instance to a JSON map.
  Map<String, dynamic> toJson() => _$GenerateMessageRequestToJson(this);
}
