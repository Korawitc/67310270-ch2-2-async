// ต้องใส่ async เพราะข้างในมีการ await
Future<void> main() async {
  print('1. เริ่ม');

  // await จะหยุดรอตรงนี้ จนกว่า Future.delayed จะเสร็จ (3 วินาที)
  await Future.delayed(Duration(seconds: 3), () {
    print('2. โหลดเสร็จ');
  });

  // บรรทัดนี้จะทำงาน "หลังจาก" บรรทัดข้างบนเสร็จแล้วเท่านั้น
  print('3. จบ');
}