// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'citation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
