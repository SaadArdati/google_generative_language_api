// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessagePrompt _$MessagePromptFromJson(Map<String, dynamic> json) =>
    MessagePrompt(
      context: json['context'] as String?,
      examples: (json['examples'] as List<dynamic>?)
          ?.map((e) => Example.fromJson(e as Map<String, dynamic>))
          .toList(),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessagePromptToJson(MessagePrompt instance) =>
    <String, dynamic>{
      'context': instance.context,
      'examples': instance.examples,
      'messages': instance.messages,
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
      author: json['author'] as String,
      content: json['content'] as String,
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

GeneratedMessage _$GeneratedMessageFromJson(Map<String, dynamic> json) =>
    GeneratedMessage(
      candidates: (json['candidates'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      filters: (json['filters'] as List<dynamic>?)
              ?.map((e) => ContentFilter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GeneratedMessageToJson(GeneratedMessage instance) =>
    <String, dynamic>{
      'candidates': instance.candidates,
      'messages': instance.messages,
      'filters': instance.filters,
    };

GenerateMessageRequest _$GenerateMessageRequestFromJson(
        Map<String, dynamic> json) =>
    GenerateMessageRequest(
      prompt: MessagePrompt.fromJson(json['prompt'] as Map<String, dynamic>),
      temperature: (json['temperature'] as num?)?.toDouble(),
      candidateCount: json['candidateCount'] as int?,
      topP: (json['topP'] as num?)?.toDouble(),
      topK: json['topK'] as int?,
    );

Map<String, dynamic> _$GenerateMessageRequestToJson(
        GenerateMessageRequest instance) =>
    <String, dynamic>{
      'prompt': instance.prompt,
      'temperature': instance.temperature,
      'candidateCount': instance.candidateCount,
      'topP': instance.topP,
      'topK': instance.topK,
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

CitationMetadata _$CitationMetadataFromJson(Map<String, dynamic> json) =>
    CitationMetadata(
      citationSources: (json['citationSources'] as List<dynamic>)
          .map((e) => CitationSource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CitationMetadataToJson(CitationMetadata instance) =>
    <String, dynamic>{
      'citationSources': instance.citationSources,
    };

CitationSource _$CitationSourceFromJson(Map<String, dynamic> json) =>
    CitationSource(
      startIndex: json['startIndex'] as int?,
      endIndex: json['endIndex'] as int?,
      uri: json['uri'] as String?,
      license: json['license'] as String?,
    );

Map<String, dynamic> _$CitationSourceToJson(CitationSource instance) =>
    <String, dynamic>{
      'startIndex': instance.startIndex,
      'endIndex': instance.endIndex,
      'uri': instance.uri,
      'license': instance.license,
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
