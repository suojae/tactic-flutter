class Game {
  final int coachId;
  final String name;
  final String type; // 경기 유형 (예: "축구", "농구")
  final String detail;

  Game({
    required this.coachId,
    required this.name,
    required this.type,
    required this.detail,
  });
}
