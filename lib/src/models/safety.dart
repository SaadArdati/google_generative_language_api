import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'harm.dart';

part 'safety.g.dart';

/// Safety rating for a piece of content.
///
/// The safety rating contains the category of harm and the harm probability
/// level in that category for a piece of content. Content is classified for
/// safety across a number of harm categories and the probability of the
/// harm classification is included here.
@JsonSerializable()
class SafetyRating with EquatableMixin {
  /// The category for this rating.
  final HarmCategory category;

  /// The probability of harm for this content.
  final HarmProbability probability;

  /// Constructs a [SafetyRating] object.
  const SafetyRating({
    required this.category,
    required this.probability,
  });

  @override
  List<Object?> get props => [category, probability];

  /// Creates a [SafetyRating] instance from a JSON map.
  factory SafetyRating.fromJson(Map<String, dynamic> json) =>
      _$SafetyRatingFromJson(json);

  /// Converts the [SafetyRating] instance to a JSON map.
  Map<String, dynamic> toJson() => _$SafetyRatingToJson(this);
}

/// Safety feedback for an entire request.
///
/// This field is populated if content in the input and/or response is blocked
/// due to safety settings. [SafetyFeedback] may not exist for every
/// [HarmCategory]. Each [SafetyFeedback] will return the safety settings used
/// by the request as well as the lowest [HarmProbability] that should be
/// allowed in order to return a result.
@JsonSerializable()
class SafetyFeedback with EquatableMixin {
  /// Safety rating evaluated from content.
  final SafetyRating rating;

  /// Safety settings applied to the request.
  final SafetySetting setting;

  /// Constructs a [SafetyFeedback] object.
  const SafetyFeedback({
    required this.rating,
    required this.setting,
  });

  @override
  List<Object?> get props => [rating, setting];

  /// Creates a [SafetyFeedback] instance from a JSON map.
  factory SafetyFeedback.fromJson(Map<String, dynamic> json) =>
      _$SafetyFeedbackFromJson(json);

  /// Converts the [SafetyFeedback] instance to a JSON map.
  Map<String, dynamic> toJson() => _$SafetyFeedbackToJson(this);
}

/// Safety setting, affecting the safety-blocking behavior.
///
/// Passing a safety setting for a category changes the allowed probaility that
/// content is blocked.
@JsonSerializable()
class SafetySetting with EquatableMixin {
  /// The category for this setting.
  final HarmCategory category;

  /// Controls the probability threshold at which harm is blocked.
  final HarmBlockThreshold threshold;

  /// Constructs a [SafetySetting] object.
  const SafetySetting({
    required this.category,
    required this.threshold,
  });

  @override
  List<Object?> get props => [category, threshold];

  /// Creates a [SafetySetting] instance from a JSON map.
  factory SafetySetting.fromJson(Map<String, dynamic> json) =>
      _$SafetySettingFromJson(json);

  /// Converts the [SafetySetting] instance to a JSON map.
  Map<String, dynamic> toJson() => _$SafetySettingToJson(this);
}
