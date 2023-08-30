// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratedText _$GeneratedTextFromJson(Map<String, dynamic> json) =>
    GeneratedText(
      candidates: (json['candidates'] as List<dynamic>)
          .map((e) => TextCompletion.fromJson(e as Map<String, dynamic>))
          .toList(),
      safetyFeedback: (json['safetyFeedback'] as List<dynamic>?)
              ?.map((e) => SafetyFeedback.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      filters: (json['filters'] as List<dynamic>?)
              ?.map((e) => ContentFilter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GeneratedTextToJson(GeneratedText instance) =>
    <String, dynamic>{
      'candidates': instance.candidates,
      'filters': instance.filters,
      'safetyFeedback': instance.safetyFeedback,
    };

GeneratedMessage _$GeneratedMessageFromJson(Map<String, dynamic> json) =>
    GeneratedMessage(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      candidates: (json['candidates'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      filters: (json['filters'] as List<dynamic>?)
              ?.map((e) => ContentFilter.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$GeneratedMessageToJson(GeneratedMessage instance) =>
    <String, dynamic>{
      'candidates': instance.candidates,
      'filters': instance.filters,
      'messages': instance.messages,
    };
