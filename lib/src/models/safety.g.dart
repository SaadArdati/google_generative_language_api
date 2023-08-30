// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'safety.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SafetyRating _$SafetyRatingFromJson(Map<String, dynamic> json) => SafetyRating(
      category: $enumDecode(_$HarmCategoryEnumMap, json['category']),
      probability: $enumDecode(_$HarmProbabilityEnumMap, json['probability']),
    );

Map<String, dynamic> _$SafetyRatingToJson(SafetyRating instance) =>
    <String, dynamic>{
      'category': _$HarmCategoryEnumMap[instance.category]!,
      'probability': _$HarmProbabilityEnumMap[instance.probability]!,
    };

const _$HarmCategoryEnumMap = {
  HarmCategory.unspecified: 'HARM_CATEGORY_UNSPECIFIED',
  HarmCategory.derogatory: 'HARM_CATEGORY_DEROGATORY',
  HarmCategory.toxicity: 'HARM_CATEGORY_TOXICITY',
  HarmCategory.violence: 'HARM_CATEGORY_VIOLENCE',
  HarmCategory.sexual: 'HARM_CATEGORY_SEXUAL',
  HarmCategory.medical: 'HARM_CATEGORY_MEDICAL',
  HarmCategory.dangerous: 'HARM_CATEGORY_DANGEROUS',
};

const _$HarmProbabilityEnumMap = {
  HarmProbability.unspecified: 'HARM_PROBABILITY_UNSPECIFIED',
  HarmProbability.negligible: 'NEGLIGIBLE',
  HarmProbability.low: 'LOW',
  HarmProbability.medium: 'MEDIUM',
  HarmProbability.high: 'HIGH',
};

SafetyFeedback _$SafetyFeedbackFromJson(Map<String, dynamic> json) =>
    SafetyFeedback(
      rating: SafetyRating.fromJson(json['rating'] as Map<String, dynamic>),
      setting: SafetySetting.fromJson(json['setting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SafetyFeedbackToJson(SafetyFeedback instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'setting': instance.setting,
    };

SafetySetting _$SafetySettingFromJson(Map<String, dynamic> json) =>
    SafetySetting(
      category: $enumDecode(_$HarmCategoryEnumMap, json['category']),
      threshold: $enumDecode(_$HarmBlockThresholdEnumMap, json['threshold']),
    );

Map<String, dynamic> _$SafetySettingToJson(SafetySetting instance) =>
    <String, dynamic>{
      'category': _$HarmCategoryEnumMap[instance.category]!,
      'threshold': _$HarmBlockThresholdEnumMap[instance.threshold]!,
    };

const _$HarmBlockThresholdEnumMap = {
  HarmBlockThreshold.thresholdUnspecified: 'HARM_BLOCK_THRESHOLD_UNSPECIFIED',
  HarmBlockThreshold.lowAndAbove: 'BLOCK_LOW_AND_ABOVE',
  HarmBlockThreshold.mediumAndAbove: 'BLOCK_MEDIUM_AND_ABOVE',
  HarmBlockThreshold.onlyHigh: 'BLOCK_ONLY_HIGH',
  HarmBlockThreshold.none: 'BLOCK_NONE',
};
