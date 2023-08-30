// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextCompletion _$TextCompletionFromJson(Map<String, dynamic> json) =>
    TextCompletion(
      output: json['output'] as String,
      safetyRatings: (json['safetyRatings'] as List<dynamic>?)
              ?.map((e) => SafetyRating.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      citationMetadata: json['citationMetadata'] == null
          ? null
          : CitationMetadata.fromJson(
              json['citationMetadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TextCompletionToJson(TextCompletion instance) =>
    <String, dynamic>{
      'output': instance.output,
      'safetyRatings': instance.safetyRatings,
      'citationMetadata': instance.citationMetadata,
    };

Example _$ExampleFromJson(Map<String, dynamic> json) => Example(
      input: Message.fromJson(json['input'] as Map<String, dynamic>),
      output: Message.fromJson(json['output'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ExampleToJson(Example instance) => <String, dynamic>{
      'input': instance.input,
      'output': instance.output,
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      content: json['content'] as String,
      author: json['author'] as String?,
      citationMetadata: json['citationMetadata'] == null
          ? null
          : CitationMetadata.fromJson(
              json['citationMetadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'author': instance.author,
      'content': instance.content,
      'citationMetadata': instance.citationMetadata,
    };

Model _$ModelFromJson(Map<String, dynamic> json) => Model(
      name: json['name'] as String,
      baseModelId: json['baseModelId'] as String?,
      version: json['version'] as String,
      displayName: json['displayName'] as String,
      description: json['description'] as String,
      inputTokenLimit: json['inputTokenLimit'] as int,
      outputTokenLimit: json['outputTokenLimit'] as int,
      supportedGenerationMethods:
          (json['supportedGenerationMethods'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      temperature: (json['temperature'] as num?)?.toDouble(),
      topP: (json['topP'] as num?)?.toDouble(),
      topK: json['topK'] as int?,
    );

Map<String, dynamic> _$ModelToJson(Model instance) => <String, dynamic>{
      'name': instance.name,
      'baseModelId': instance.baseModelId,
      'version': instance.version,
      'displayName': instance.displayName,
      'description': instance.description,
      'inputTokenLimit': instance.inputTokenLimit,
      'outputTokenLimit': instance.outputTokenLimit,
      'supportedGenerationMethods': instance.supportedGenerationMethods,
      'temperature': instance.temperature,
      'topP': instance.topP,
      'topK': instance.topK,
    };

ContentFilter _$ContentFilterFromJson(Map<String, dynamic> json) =>
    ContentFilter(
      reason: $enumDecode(_$BlockedReasonEnumMap, json['reason']),
      message: json['message'] as String,
    );

Map<String, dynamic> _$ContentFilterToJson(ContentFilter instance) =>
    <String, dynamic>{
      'reason': _$BlockedReasonEnumMap[instance.reason]!,
      'message': instance.message,
    };

const _$BlockedReasonEnumMap = {
  BlockedReason.unspecified: 'BLOCKED_REASON_UNSPECIFIED',
  BlockedReason.safety: 'SAFETY',
  BlockedReason.other: 'OTHER',
};

ListModelResponse _$ListModelResponseFromJson(Map<String, dynamic> json) =>
    ListModelResponse(
      models: (json['models'] as List<dynamic>)
          .map((e) => Model.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageToken: json['nextPageToken'] as String?,
    );

Map<String, dynamic> _$ListModelResponseToJson(ListModelResponse instance) =>
    <String, dynamic>{
      'models': instance.models,
      'nextPageToken': instance.nextPageToken,
    };

CountMessageTokensRequest _$CountMessageTokensRequestFromJson(
        Map<String, dynamic> json) =>
    CountMessageTokensRequest(
      prompt: MessagePrompt.fromJson(json['prompt'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CountMessageTokensRequestToJson(
        CountMessageTokensRequest instance) =>
    <String, dynamic>{
      'prompt': instance.prompt,
    };
