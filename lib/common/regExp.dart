class Regular {
  // 去除所有空格
  static stringTrimExp(String str) {
    return str.replaceAll(new RegExp(r"\s+\b|\b\s|\b|\s"), "");
  }
}
