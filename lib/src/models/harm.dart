import 'package:json_annotation/json_annotation.dart';

/// The probability that a piece of content is harmful.
///
/// The classification system gives the probability of the content being unsafe.
/// This does not indicate the severity of harm for a piece of content.
enum HarmProbability {
  /// Probability is unspecified.
  @JsonValue('HARM_PROBABILITY_UNSPECIFIED')
  unspecified,

  /// Content has a negligible chance of being unsafe.
  @JsonValue('NEGLIGIBLE')
  negligible,

  /// Content has a low chance of being unsafe.
  @JsonValue('LOW')
  low,

  /// Content has a medium chance of being unsafe.
  @JsonValue('MEDIUM')
  medium,

  /// Content has a high chance of being unsafe.
  @JsonValue('HIGH')
  high
}

/// The category of a rating.
///
/// These categories cover various kinds of harms that developers may wish to
/// adjust.
enum HarmCategory {
  /// Category is unspecified.
  @JsonValue('HARM_CATEGORY_UNSPECIFIED')
  unspecified,

  /// Negative or harmful comments targeting identity and/or protected
  /// attribute.
  @JsonValue('HARM_CATEGORY_DEROGATORY')
  derogatory,

  /// Content that is rude, disrespectful, or profane.
  @JsonValue('HARM_CATEGORY_TOXICITY')
  toxicity,

  /// Describes scenarios depicting violence against an individual or group, or
  /// general descriptions of gore.
  @JsonValue('HARM_CATEGORY_VIOLENCE')
  violence,

  /// Contains references to sexual acts or other lewd content.
  @JsonValue('HARM_CATEGORY_SEXUAL')
  sexual,

  /// Promotes unchecked medical advice.
  @JsonValue('HARM_CATEGORY_MEDICAL')
  medical,

  /// Dangerous content that promotes, facilitates, or encourages harmful acts.
  @JsonValue('HARM_CATEGORY_DANGEROUS')
  dangerous
}

/// Block at and beyond a specified harm probability.
enum HarmBlockThreshold {
  /// Threshold is unspecified.
  @JsonValue('HARM_BLOCK_THRESHOLD_UNSPECIFIED')
  thresholdUnspecified,

  /// Content with NEGLIGIBLE will be allowed.
  @JsonValue('BLOCK_LOW_AND_ABOVE')
  lowAndAbove,

  /// Content with NEGLIGIBLE and LOW will be allowed.
  @JsonValue('BLOCK_MEDIUM_AND_ABOVE')
  mediumAndAbove,

  /// Content with NEGLIGIBLE, LOW, and MEDIUM will be allowed.
  @JsonValue('BLOCK_ONLY_HIGH')
  onlyHigh,

  /// All content will be allowed.
  @JsonValue('BLOCK_NONE')
  none
}
