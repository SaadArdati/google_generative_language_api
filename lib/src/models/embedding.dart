import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'embedding.g.dart';

/// A list of floats representing the embedding.
@JsonSerializable()
class Embedding with EquatableMixin {
  /// The embedding values.
  final List<double> value;

  /// Constructs an [Embedding] object.
  const Embedding({this.value = const []});

  @override
  List<Object?> get props => [value];

  /// Creates an [Embedding] instance from a JSON map.
  factory Embedding.fromJson(Map<String, dynamic> json) =>
      _$EmbeddingFromJson(json);

  /// Converts the [Embedding] instance to a JSON map.
  Map<String, dynamic> toJson() => _$EmbeddingToJson(this);
}

/// The response to a [EmbedTextRequest].
@JsonSerializable()
class EmbeddedText with EquatableMixin {
  /// Output only. The embedding generated from the input text.
  final Embedding embedding;

  /// Constructs an [EmbeddedText] object.
  const EmbeddedText({this.embedding = const Embedding()});

  @override
  List<Object?> get props => [embedding];

  /// Creates an [EmbeddedText] instance from a JSON map.
  factory EmbeddedText.fromJson(Map<String, dynamic> json) =>
      _$EmbeddedTextFromJson(json);

  /// Converts the [EmbeddedText] instance to a JSON map.
  Map<String, dynamic> toJson() => _$EmbeddedTextToJson(this);
}

/// The request body to generate an embedding from text.
@JsonSerializable()
class EmbedTextRequest with EquatableMixin {
  /// The free-form input text that the model will turn into an embedding.
  final String text;

  /// Constructs an [EmbedTextRequest] object.
  const EmbedTextRequest({required this.text});

  @override
  List<Object?> get props => [text];

  /// Creates an [EmbedTextRequest] instance from a JSON map.
  factory EmbedTextRequest.fromJson(Map<String, dynamic> json) =>
      _$EmbedTextRequestFromJson(json);

  /// Converts the [EmbedTextRequest] instance to a JSON map.
  Map<String, dynamic> toJson() => _$EmbedTextRequestToJson(this);
}
