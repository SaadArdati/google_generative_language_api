import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'embedding.g.dart';

/// A list of floats representing the embedding.
@JsonSerializable()
class Embedding with EquatableMixin {
  /// The embedding values.
  final List<double> values;

  /// Constructs an [Embedding] object.
  const Embedding({this.values = const []});

  @override
  List<Object?> get props => [values];

  /// Creates an [Embedding] instance from a JSON map.
  factory Embedding.fromJson(Map<String, dynamic> json) =>
      _$EmbeddingFromJson(json);

  /// Converts the [Embedding] instance to a JSON map.
  Map<String, dynamic> toJson() => _$EmbeddingToJson(this);
}

/// The response to a [EmbedTextRequest].
@JsonSerializable()
class EmbedTextResponse with EquatableMixin {
  /// Output only. The embedding generated from the input text.
  final Embedding embedding;

  /// Constructs an [EmbedTextResponse] object.
  const EmbedTextResponse({this.embedding = const Embedding()});

  @override
  List<Object?> get props => [embedding];

  /// Creates an [EmbedTextResponse] instance from a JSON map.
  factory EmbedTextResponse.fromJson(Map<String, dynamic> json) =>
      _$EmbedTextResponseFromJson(json);

  /// Converts the [EmbedTextResponse] instance to a JSON map.
  Map<String, dynamic> toJson() => _$EmbedTextResponseToJson(this);
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
