import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

/// Represents a prompt for generating a message.
@JsonSerializable()
class MessagePrompt with EquatableMixin {
  /// The context of the message prompt.
  final String? context;

  /// List of examples associated with the message prompt.
  final List<Example>? examples;

  /// List of messages in the message prompt.
  final List<Message> messages;

  /// Constructs a [MessagePrompt] object.
  const MessagePrompt({
    this.context,
    this.examples,
    required this.messages,
  });

  @override
  List<Object?> get props => [context, examples, messages];

  /// Creates a [MessagePrompt] instance from a JSON map.
  factory MessagePrompt.fromJson(Map<String, dynamic> json) =>
      _$MessagePromptFromJson(json);

  /// Converts the [MessagePrompt] instance to a JSON map.
  Map<String, dynamic> toJson() => _$MessagePromptToJson(this);
}

/// Represents an example associated with a message prompt.
@JsonSerializable()
class Example with EquatableMixin {
  /// The input message of the example.
  final Message input;

  /// The output message of the example.
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

/// Represents a message in a conversation.
@JsonSerializable()
class Message with EquatableMixin {
  /// The author of the message.
  final String author;

  /// The content of the message.
  final String content;

  /// The citation metadata associated with the message.
  final CitationMetadata? citationMetadata;

  /// Constructs a [Message] object.
  const Message({
    required this.author,
    required this.content,
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

/// Represents a generated message.
@JsonSerializable()
class GeneratedMessage with EquatableMixin {
  /// List of candidate messages.
  final List<Message> candidates;

  /// List of messages in the conversation.
  final List<Message> messages;

  /// List of content filters applied to the generated message.
  @JsonKey(defaultValue: [])
  final List<ContentFilter> filters;

  /// Constructs a [GeneratedMessage] object.
  const GeneratedMessage({
    required this.candidates,
    required this.messages,
    required this.filters,
  });

  @override
  List<Object?> get props => [candidates, messages, filters];

  /// Creates a [GeneratedMessage] instance from a JSON map.
  factory GeneratedMessage.fromJson(Map<String, dynamic> json) =>
      _$GeneratedMessageFromJson(json);

  /// Converts the [GeneratedMessage] instance to a JSON map.
  Map<String, dynamic> toJson() => _$GeneratedMessageToJson(this);
}

/// Enumerates the reasons for blocking content.
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

/// Represents a request to generate a message.
@JsonSerializable()
class GenerateMessageRequest with EquatableMixin {
  /// The message prompt.
  final MessagePrompt prompt;

  /// The temperature parameter for generating diverse outputs.
  final double? temperature;

  /// The number of candidate messages to generate.
  final int? candidateCount;

  /// The top-p (nucleus) sampling parameter.
  final double? topP;

  /// The top-k sampling parameter.
  final int? topK;

  /// Constructs a [GenerateMessageRequest] object.
  const GenerateMessageRequest({
    required this.prompt,
    this.temperature,
    this.candidateCount,
    this.topP,
    this.topK,
  });

  /// Creates a copy of [GenerateMessageRequest] with optional new values.
  GenerateMessageRequest copyWith({
    MessagePrompt? prompt,
    double? temperature,
    int? candidateCount,
    double? topP,
    int? topK,
  }) {
    return GenerateMessageRequest(
      prompt: prompt ?? this.prompt,
      temperature: temperature ?? this.temperature,
      candidateCount: candidateCount ?? this.candidateCount,
      topP: topP ?? this.topP,
      topK: topK ?? this.topK,
    );
  }

  @override
  List<Object?> get props => [prompt, temperature, candidateCount, topP, topK];

  /// Creates a [GenerateMessageRequest] instance from a JSON map.
  factory GenerateMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$GenerateMessageRequestFromJson(json);

  /// Converts the [GenerateMessageRequest] instance to a JSON map.
  Map<String, dynamic> toJson() => _$GenerateMessageRequestToJson(this);
}

/// Represents a language model.
@JsonSerializable()
class Model extends Equatable {
  /// The name of the model.
  final String name;

  /// The base model ID.
  final String? baseModelId;

  /// The version of the model.
  final String version;

  /// The display name of the model.
  final String displayName;

  /// The description of the model.
  final String description;

  /// The maximum number of input tokens allowed.
  final int inputTokenLimit;

  /// The maximum number of output tokens allowed.
  final int outputTokenLimit;

  /// The supported generation methods for the model.
  final List<String> supportedGenerationMethods;

  /// The temperature parameter for generating diverse outputs.
  final double? temperature;

  /// The top-p (nucleus) sampling parameter.
  final double? topP;

  /// The top-k sampling parameter.
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

/// Represents a content filter applied to a message.
@JsonSerializable()
class ContentFilter with EquatableMixin {
  /// The reason for blocking the content.
  final BlockedReason reason;

  /// The message associated with the content filter.
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

/// Represents the metadata for citations in a message.
@JsonSerializable()
class CitationMetadata with EquatableMixin {
  /// The list of citation sources.
  final List<CitationSource> citationSources;

  /// Constructs a [CitationMetadata] object.
  const CitationMetadata({required this.citationSources});

  @override
  List<Object?> get props => [citationSources];

  /// Creates a [CitationMetadata] instance from a JSON map.
  factory CitationMetadata.fromJson(Map<String, dynamic> json) =>
      _$CitationMetadataFromJson(json);

  /// Converts the [CitationMetadata] instance to a JSON map.
  Map<String, dynamic> toJson() => _$CitationMetadataToJson(this);
}

/// Represents a citation source in a message.
@JsonSerializable()
class CitationSource with EquatableMixin {
  /// The start index of the citation in the message.
  final int? startIndex;

  /// The end index of the citation in the message.
  final int? endIndex;

  /// The URI (Uniform Resource Identifier) of the citation source.
  final String? uri;

  /// The license information for the citation source.
  final String? license;

  /// Constructs a [CitationSource] object.
  const CitationSource({
    this.startIndex,
    this.endIndex,
    this.uri,
    this.license,
  });

  @override
  List<Object?> get props => [startIndex, endIndex, uri, license];

  /// Creates a [CitationSource] instance from a JSON map.
  factory CitationSource.fromJson(Map<String, dynamic> json) =>
      _$CitationSourceFromJson(json);

  /// Converts the [CitationSource] instance to a JSON map.
  Map<String, dynamic> toJson() => _$CitationSourceToJson(this);
}

/// Represents the response from the listModels API call, containing a paginated list of models.
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
