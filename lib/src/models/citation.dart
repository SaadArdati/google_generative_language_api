import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'citation.g.dart';


/// A collection of source attributions for a piece of content.
@JsonSerializable()
class CitationMetadata with EquatableMixin {
  /// Citations to sources for a specific response.
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

/// A citation to a source for a portion of a specific response.
@JsonSerializable()
class CitationSource with EquatableMixin {
  /// Start of segment of the response that is attributed to this source.
  ///
  /// Index indicates the start of the segment, measured in bytes.
  final int? startIndex;

  /// End of the attributed segment, exclusive.
  final int? endIndex;

  /// URI that is attributed as a source for a portion of the text.
  final String? uri;

  /// License for the GitHub project that is attributed as a source for segment.
  ///
  /// License info is required for code citations.
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
