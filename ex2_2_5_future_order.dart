import 'dart:async';
void main() async {
  final StreamController<String> notificationController =
      StreamController<String>();

  notificationController.stream.listen(
    (String notification) {
      print('แจ้งเตือนใหม่: $notification');
    },
    onDone: () {
      print('ระบบแจ้งเตือนถูกปิดแล้ว ไม่มีการแจ้งเตือนเข้ามาอีก');
    },
  );

  print('-> เริ่มระบบแจ้งเตือน');

  notificationController.add('คุณมีข้อความใหม่จาก นายเอ');
  notificationController.add('คำสั่งซื้อ #1024 จัดส่งแล้ว');
  notificationController.add('แบตเตอรี่เหลือ 20%');

  await notificationController.close(); // รอจน stream ปิดเสร็จจริง
  await notificationController.done;    // รอจน Dart จัดการ event ค้างใน stream ครบ

  // บรรทัดนี้จะพิมพ์ "หลังสุด" เพราะรอ .done เสร็จก่อน
  print('-> สิ้นสุดคำสั่งใน main (โค้ด synchronous จบแล้ว)');
}