// async* + Stream<String> เพราะเราจะ yield ทั้งตัวเลขและข้อความ "หมดเวลา!"
Stream<String> countdown(int from) async* {
  for (int i = from; i > 0; i--) {
    await Future.delayed(Duration(seconds: 1));
    yield i.toString(); // ปล่อยค่าตัวเลขออกไปทีละตัว
  }

  await Future.delayed(Duration(seconds: 1));
  yield 'หมดเวลา!'; // ปล่อยข้อความสุดท้ายเมื่อครบ
}

void main() async {
  // await for: รับค่าจาก stream ทีละตัวตามลำดับที่มันถูก yield ออกมา
  await for (String value in countdown(5)) {
    print(value);
  }
}
