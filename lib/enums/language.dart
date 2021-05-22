enum Language { eng, dut }

extension ParseToString on Language {
  String toShortString() {
    return this.toString().split('.').last;
  }
}
