// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextPrompt _$TextPromptFromJson(Map<String, dynamic> json) => TextPrompt(
      text: json['text'] as String,
    );

Map<String, dynamic> _$TextPromptToJson(TextPrompt instance) =>
    <String, dynamic>{
      'text': instance.text,
    };

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
