Future<Map<String, dynamic>> fetchProfile(int userId) async {
  // จำลองการหน่วงเวลาเหมือนกำลังดึงข้อมูลจาก server จริง
  await Future.delayed(Duration(seconds: 2));

  if (userId <= 0) {
    throw Exception(
      'userId ไม่ถูกต้อง: ต้องเป็นค่ามากกว่า 0 (ได้รับค่า $userId)',
    );
  }

  // จำลองข้อมูลโปรไฟล์ที่ "ดึงมาได้" สำเร็จ
  return {
    'id': userId,
    'name': 'ผู้ใช้หมายเลข $userId',
    'email': 'user$userId@example.com',
  };
}

void main() async {
  // กรณีที่ 1: userId ถูกต้อง
  print('--- ทดสอบกรณี userId ถูกต้อง (userId = 7) ---');
  try {
    print('กำลังโหลดข้อมูล...');
    Map<String, dynamic> profile = await fetchProfile(7);
    print('โหลดสำเร็จ: $profile');
  } catch (e) {
    print('เกิดข้อผิดพลาด: $e');
  } finally {
    print('finally: ปิดการทำงานของคำขอนี้');
  }

  print(''); // เว้นบรรทัด

  // กรณีที่ 2: userId ผิดพลาด 
  print('--- ทดสอบกรณี userId ผิดพลาด (userId = -3) ---');
  try {
    print('กำลังโหลดข้อมูล...');
    Map<String, dynamic> profile = await fetchProfile(-3);
    print('โหลดสำเร็จ: $profile'); // บรรทัดนี้จะไม่ทำงาน เพราะ throw ก่อนถึง
  } catch (e) {
    print('เกิดข้อผิดพลาด: $e');
  } finally {
    print('finally: ปิดการทำงานของคำขอนี้');
  }
}
