import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'generated_response.g.dart';

/// Represents an abstract generated response from the model.
abstract class GeneratedResponseBase<T> with EquatableMixin {
  /// Candidate response messages from the model.
  final List<T> candidates;

  /// A set of content filtering metadata for the prompt and response text.
  ///
  /// This indicates which [SafetyCategory]s blocked a candidate from this
  /// response, the lowest [HarmProbability] that triggered a block, and the
  /// [HarmThreshold] setting for that category.
  final List<ContentFilter> filters;

  /// Constructs a [GeneratedResponseBase] object.
  const GeneratedResponseBase({
    required this.candidates,
    this.filters = const [],
  });

  @override
  List<Object?> get props => [candidates, filters];
}

/// Represents the output of a [generateText] response from the model.
@JsonSerializable()
class GeneratedText extends GeneratedResponseBase<TextCompletion> {
  /// Returns any safety feedback related to content filtering.
  final List<SafetyFeedback> safetyFeedback;

  /// Constructs a [GeneratedText] object.
  const GeneratedText({
    required super.candidates,
    this.safetyFeedback = const [],
    super.filters = const [],
  });

  @override
  List<Object?> get props => [
        ...super.props,
        safetyFeedback,
      ];

  /// Creates a [GeneratedText] instance from a JSON map.
  factory GeneratedText.fromJson(Map<String, dynamic> json) =>
      _$GeneratedTextFromJson(json);

  /// Converts the [GeneratedText] instance to a JSON map.
  Map<String, dynamic> toJson() => _$GeneratedTextToJson(this);
}

/// Represents the output of a [generateMessage] response from the model.
@JsonSerializable()
class GeneratedMessage extends GeneratedResponseBase<Message> {
  /// The conversation history used by the model.
  final List<Message> messages;

  /// Constructs a [GeneratedMessage] object.
  const GeneratedMessage({
    required this.messages,
    required super.candidates,
    super.filters,
  });

  @override
  List<Object?> get props => [candidates, messages, filters];

  /// Creates a [GeneratedMessage] instance from a JSON map.
  factory GeneratedMessage.fromJson(Map<String, dynamic> json) =>
      _$GeneratedMessageFromJson(json);

  /// Converts the [GeneratedMessage] instance to a JSON map.
  Map<String, dynamic> toJson() => _$GeneratedMessageToJson(this);
}
