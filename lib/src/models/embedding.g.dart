// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'embedding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Embedding _$EmbeddingFromJson(Map<String, dynamic> json) => Embedding(
      values: (json['values'] as List<dynamic>?)
              ?.map((e) => (e as num).toDouble())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$EmbeddingToJson(Embedding instance) => <String, dynamic>{
      'values': instance.values,
    };

EmbedTextResponse _$EmbedTextResponseFromJson(Map<String, dynamic> json) =>
    EmbedTextResponse(
      embedding: json['embedding'] == null
          ? const Embedding()
          : Embedding.fromJson(json['embedding'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EmbedTextResponseToJson(EmbedTextResponse instance) =>
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
