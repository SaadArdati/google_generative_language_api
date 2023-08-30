// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateTextRequest _$GenerateTextRequestFromJson(Map<String, dynamic> json) =>
    GenerateTextRequest(
      prompt: TextPrompt.fromJson(json['prompt'] as Map<String, dynamic>),
      safetySettings: (json['safetySettings'] as List<dynamic>?)
              ?.map((e) => SafetySetting.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      stopSequences: (json['stopSequences'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      temperature: (json['temperature'] as num?)?.toDouble(),
      candidateCount: json['candidateCount'] as int?,
      maxOutputTokens: json['maxOutputTokens'] as int?,
      topP: (json['topP'] as num?)?.toDouble(),
      topK: json['topK'] as int?,
    );

Map<String, dynamic> _$GenerateTextRequestToJson(
        GenerateTextRequest instance) =>
    <String, dynamic>{
      'prompt': instance.prompt,
      'temperature': instance.temperature,
      'candidateCount': instance.candidateCount,
      'topP': instance.topP,
      'topK': instance.topK,
      'safetySettings': instance.safetySettings,
      'stopSequences': instance.stopSequences,
      'maxOutputTokens': instance.maxOutputTokens,
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
