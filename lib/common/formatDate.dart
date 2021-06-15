class Format {
  // 时间戳格式化时间并截取到秒
  static formatDate(int date) {
    return DateTime.fromMillisecondsSinceEpoch(date)
        .toLocal()
        .toString()
        .substring(0, 19);
  }
}
