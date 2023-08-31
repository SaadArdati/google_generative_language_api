import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'citation.dart';
import 'prompt.dart';
import 'safety.dart';

export 'embedding.dart';
export 'generated_request.dart';
export 'generated_response.dart';
export 'harm.dart';
export 'prompt.dart';
export 'safety.dart';

part 'models.g.dart';

/// Information about a Generative Language Model.
@JsonSerializable()
class Model extends Equatable {
  /// The resource name of the Model.
  ///
  /// Format: models/{model} with a {model} naming convention of:
  ///
  /// "{baseModelId}-{version}"
  /// Examples:
  ///
  /// models/chat-bison-001
  final String name;

  /// Required. The name of the base model, pass this to the generation request.
  ///
  /// Examples:
  ///
  /// chat-bison
  final String? baseModelId;

  /// The version number of the model.
  ///
  /// This represents the major version
  final String version;

  /// The human-readable name of the model. E.g. "Chat Bison".
  ///
  /// The name can be up to 128 characters long and can consist of any UTF-8 characters.
  final String displayName;

  /// A short description of the model.
  final String description;

  /// Maximum number of input tokens allowed for this model.
  final int inputTokenLimit;

  /// Maximum number of output tokens available for this model.
  final int outputTokenLimit;

  /// The model's supported generation methods.
  ///
  /// The method names are defined as Pascal case strings, such as
  /// [generateMessage] which correspond to API methods.
  final List<String> supportedGenerationMethods;

  /// Controls the randomness of the output.
  ///
  /// Values can range over [0.0,1.0], inclusive. A value closer to 1.0 will
  /// produce responses that are more varied, while a value closer to 0.0 will
  /// typically result in less surprising responses from the model. This value
  /// specifies default to be used by the backend while making the call to the
  /// model.
  final double? temperature;

  /// For Nucleus sampling.
  ///
  /// Nucleus sampling considers the smallest set of tokens whose probability
  /// sum is at least [topP]. This value specifies default to be used by the
  /// backend while making the call to the model.
  final double? topP;

  /// For Top-k sampling.
  ///
  /// Top-k sampling considers the set of [topK] most probable tokens. This value
  /// specifies default to be used by the backend while making the call to the
  /// model.
  final int? topK;

  /// Constructs a [Model] object.
  const Model({
    required this.name,
    required this.baseModelId,
    required this.version,
    required this.displayName,
    required this.description,
    required this.inputTokenLimit,
    required this.outputTokenLimit,
    required this.supportedGenerationMethods,
    required this.temperature,
    required this.topP,
    required this.topK,
  });

  @override
  List<Object?> get props {
    return [
      name,
      baseModelId,
      version,
      displayName,
      description,
      inputTokenLimit,
      outputTokenLimit,
      supportedGenerationMethods,
      temperature,
      topP,
      topK,
    ];
  }

  /// Creates a [Model] instance from a JSON map.
  factory Model.fromJson(Map<String, dynamic> json) => _$ModelFromJson(json);

  /// Converts the [Model] instance to a JSON map.
  Map<String, dynamic> toJson() => _$ModelToJson(this);
}

/// Output text returned from a model.
@JsonSerializable()
class TextCompletion with EquatableMixin {
  /// Output only. The generated text returned from the model.
  final String output;

  /// Ratings for the safety of a response.
  ///
  /// There is at most one rating per category.
  final List<SafetyRating> safetyRatings;

  /// Output only. Citation information for model-generated output in this
  /// [TextCompletion].
  ///
  /// This field may be populated with attribution information for any text
  /// included in the output.
  final CitationMetadata? citationMetadata;

  /// Constructs a [TextCompletion] object.
  const TextCompletion({
    required this.output,
    this.safetyRatings = const [],
    this.citationMetadata,
  });

  @override
  List<Object?> get props => [output, safetyRatings, citationMetadata];

  /// Creates a [TextCompletion] instance from a JSON map.
  factory TextCompletion.fromJson(Map<String, dynamic> json) =>
      _$TextCompletionFromJson(json);

  /// Converts the [TextCompletion] instance to a JSON map.
  Map<String, dynamic> toJson() => _$TextCompletionToJson(this);
}

/// An input/output example used to instruct the Model.
///
/// It demonstrates how the model should respond or format its response.
@JsonSerializable()
class Example with EquatableMixin {
  /// An example of an input Message from the user.
  final Message input;

  /// An example of what the model should output given the input.
  final Message output;

  /// Constructs an [Example] object.
  const Example({
    required this.input,
    required this.output,
  });

  @override
  List<Object?> get props => [input, output];

  /// Creates an [Example] instance from a JSON map.
  factory Example.fromJson(Map<String, dynamic> json) =>
      _$ExampleFromJson(json);

  /// Converts the [Example] instance to a JSON map.
  Map<String, dynamic> toJson() => _$ExampleToJson(this);
}

/// The base unit of structured text.
///
/// A [Message] includes an author and the content of the [Message].
///
/// The author is used to tag messages when they are fed to the model as text.
@JsonSerializable()
class Message with EquatableMixin {
  /// The author of this Message.
  ///
  /// This serves as a key for tagging the content of this [Message] when it is
  /// fed to the model as text.
  ///
  /// The author can be any alphanumeric string.
  final String? author;

  /// The text content of the structured Message.
  final String content;

  /// Output only. Citation information for model-generated content in this
  /// [Message].
  ///
  /// If this [Message] was generated as output from the model, this field may
  /// be populated with attribution information for any text included in the
  /// content. This field is used only on output.
  final CitationMetadata? citationMetadata;

  /// Constructs a [Message] object.
  const Message({
    required this.content,
    this.author,
    this.citationMetadata,
  });

  @override
  List<Object?> get props => [author, content, citationMetadata];

  /// Creates a [Message] instance from a JSON map.
  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  /// Converts the [Message] instance to a JSON map.
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

/// A list of reasons why content may have been blocked.
enum BlockedReason {
  /// Unspecified reason.
  @JsonValue('BLOCKED_REASON_UNSPECIFIED')
  unspecified,

  /// The message contains obscene content.
  @JsonValue('SAFETY')
  safety,

  /// The message was marked for other reasons.
  @JsonValue('OTHER')
  other,
}

/// Content filtering metadata associated with processing a single request.
///
/// [ContentFilter] contains a reason and an optional supporting string.
/// The reason may be unspecified.
@JsonSerializable()
class ContentFilter with EquatableMixin {
  /// The reason content was blocked during request processing.
  final BlockedReason reason;

  /// A string that describes the filtering behavior in more detail.
  final String message;

  /// Constructs a [ContentFilter] object.
  const ContentFilter({required this.reason, required this.message});

  @override
  List<Object?> get props => [reason, message];

  /// Creates a [ContentFilter] instance from a JSON map.
  factory ContentFilter.fromJson(Map<String, dynamic> json) =>
      _$ContentFilterFromJson(json);

  /// Converts the [ContentFilter] instance to a JSON map.
  Map<String, dynamic> toJson() => _$ContentFilterToJson(this);
}

/// Represents the response from the [listModels] API call, containing a
/// paginated list of models.
@JsonSerializable()
class ListModelResponse extends Equatable {
  /// The list of models returned in the response.
  final List<Model> models;

  /// A token that can be used as `pageToken` to retrieve the next page of results.
  final String? nextPageToken;

  /// Creates a new instance of [ListModelResponse].
  ///
  /// [models] represents the list of models returned in the response.
  /// [nextPageToken] is an optional token that can be used to retrieve the next page of results.
  const ListModelResponse({required this.models, this.nextPageToken});

  @override
  List<Object?> get props => [models, nextPageToken];

  /// Creates a new instance of [ListModelResponse] from a JSON map.
  factory ListModelResponse.fromJson(Map<String, dynamic> json) =>
      _$ListModelResponseFromJson(json);

  /// Converts this [ListModelResponse] instance to a JSON map.
  Map<String, dynamic> toJson() => _$ListModelResponseToJson(this);
}

/// Represents a request to count the number of tokens in a message.
@JsonSerializable()
class CountMessageTokensRequest extends Equatable {
  /// The message prompt for which to count the tokens.
  final MessagePrompt prompt;

  /// Creates a new instance of [CountMessageTokensRequest].
  ///
  /// [prompt] is the message prompt for which to count the tokens.
  const CountMessageTokensRequest({required this.prompt});

  @override
  List<Object?> get props => [prompt];

  /// Creates a new instance of [CountMessageTokensRequest] from a JSON map.
  factory CountMessageTokensRequest.fromJson(Map<String, dynamic> json) =>
      _$CountMessageTokensRequestFromJson(json);

  /// Converts this [CountMessageTokensRequest] instance to a JSON map.
  Map<String, dynamic> toJson() => _$CountMessageTokensRequestToJson(this);
}
