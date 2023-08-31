// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embedding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Embedding _$EmbeddingFromJson(Map<String, dynamic> json) => Embedding(
      value: (json['value'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$EmbeddingToJson(Embedding instance) => <String, dynamic>{
      'value': instance.value,
    };

EmbeddedText _$EmbeddedTextFromJson(Map<String, dynamic> json) => EmbeddedText(
      embedding: json['embedding'] == null
          ? const Embedding()
          : Embedding.fromJson(json['embedding'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmbeddedTextToJson(EmbeddedText instance) =>
    <String, dynamic>{
      'embedding': instance.embedding,
    };

EmbedTextRequest _$EmbedTextRequestFromJson(Map<String, dynamic> json) =>
    EmbedTextRequest(
      text: json['text'] as String,
    );

Map<String, dynamic> _$EmbedTextRequestToJson(EmbedTextRequest instance) =>
    <String, dynamic>{
      'text': instance.text,
    };
