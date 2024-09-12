// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ConditionModel {
  String text;
  String icon;
  ConditionModel({
    required this.text,
    required this.icon,
  });

  ConditionModel copyWith({
    String? text,
    String? icon,
  }) {
    return ConditionModel(
      text: text ?? this.text,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'icon': icon,
    };
  }

  factory ConditionModel.fromMap(Map<String, dynamic> map) {
    return ConditionModel(
      text: map['text'] as String,
      icon: map['icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ConditionModel.fromJson(String source) => ConditionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ConditionModel(text: $text, icon: $icon)';

  @override
  bool operator ==(covariant ConditionModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.text == text &&
      other.icon == icon;
  }

  @override
  int get hashCode => text.hashCode ^ icon.hashCode;
}
