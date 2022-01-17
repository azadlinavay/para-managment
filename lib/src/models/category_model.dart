import 'dart:convert';

class ParaCategory {
  String? color; //#F512EE
  String? uid;
  String? name; //Car
  String? emoji; //🚘
  ParaCategory({
    this.color,
    this.uid,
    this.name,
    this.emoji,
  });

  ParaCategory copyWith({
    String? color,
    String? uid,
    String? name,
    String? emoji,
  }) {
    return ParaCategory(
      color: color ?? this.color,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      emoji: emoji ?? this.emoji,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'color': color,
      'uid': uid,
      'name': name,
      'emoji': emoji,
    };
  }

  factory ParaCategory.fromMap(Map<String, dynamic> map) {
    return ParaCategory(
      color: map['color'],
      uid: map['uid'],
      name: map['name'],
      emoji: map['emoji'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ParaCategory.fromJson(String source) =>
      ParaCategory.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ParaCategory(color: $color, uid: $uid, name: $name, emoji: $emoji)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ParaCategory &&
        other.color == color &&
        other.uid == uid &&
        other.name == name &&
        other.emoji == emoji;
  }

  @override
  int get hashCode {
    return color.hashCode ^ uid.hashCode ^ name.hashCode ^ emoji.hashCode;
  }
}
