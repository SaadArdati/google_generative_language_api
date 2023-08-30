import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'models.dart';

part 'prompt.g.dart';

/// Represents an abstract prompt for generating text.
abstract class Prompt with EquatableMixin {

  /// Constructs a [Prompt] object.
  const Prompt();
}

/// Text given to the model as a prompt.
///
/// The model will use this [TextPrompt] to generate a text completion.
@JsonSerializable()
class TextPrompt extends Prompt {
  /// The prompt text.
  final String text;

  /// Constructs a [TextPrompt] object.
  const TextPrompt({required this.text});

  @override
  List<Object?> get props => [text];

  /// Creates a [TextPrompt] instance from a JSON map.
  factory TextPrompt.fromJson(Map<String, dynamic> json) =>
      _$TextPromptFromJson(json);

  /// Converts the [TextPrompt] instance to a JSON map.
  Map<String, dynamic> toJson() => _$TextPromptToJson(this);
}

/// All of the structured input text passed to the model as a prompt.
///
/// A [MessagePrompt] contains a structured set of fields that provide context
/// for the conversation, examples of user input/model output message pairs that
/// prime the model to respond in different ways, and the conversation history
/// or list of messages representing the alternating turns of the conversation
/// between the user and the model.
@JsonSerializable()
class MessagePrompt extends Prompt {
  /// Text that should be provided to the model first to ground the response.
  ///
  /// If not empty, this context will be given to the model first before the
  /// examples and messages. When using a context be sure to provide it with
  /// every request to maintain continuity.
  ///
  /// This field can be a description of your prompt to the model to help
  /// provide context and guide the responses. Examples: "Translate the phrase
  /// from English to French." or "Given a statement, classify the sentiment as
  /// happy, sad or neutral."
  ///
  /// Anything included in this field will take precedence over message history
  /// if the total input size exceeds the model's [inputTokenLimit] and the input
  /// request is truncated
  final String? context;

  /// List of examples associated with the message prompt. Examples of what the
  /// model should generate.
  ///
  /// This includes both user input and the response that the model should
  /// emulate.
  ///
  /// These examples are treated identically to conversation messages except
  /// that they take precedence over the history in messages: If the total input
  /// size exceeds the model's [inputTokenLimit] the input will be truncated.
  /// Items will be dropped from messages before examples.
  final List<Example>? examples;

  /// A snapshot of the recent conversation history sorted chronologically.
  ///
  /// Turns alternate between two authors.
  ///
  /// If the total input size exceeds the model's [inputTokenLimit] the input
  /// will be truncated: The oldest items will be dropped from messages.
  final List<Message> messages;

  /// Constructs a [MessagePrompt] object.
  const MessagePrompt({
    this.context,
    this.examples,
    required this.messages,
  });

  @override
  List<Object?> get props => [context, examples, messages];

  /// Creates a [MessagePrompt] instance from a JSON map.
  factory MessagePrompt.fromJson(Map<String, dynamic> json) =>
      _$MessagePromptFromJson(json);

  /// Converts the [MessagePrompt] instance to a JSON map.
  Map<String, dynamic> toJson() => _$MessagePromptToJson(this);
}
