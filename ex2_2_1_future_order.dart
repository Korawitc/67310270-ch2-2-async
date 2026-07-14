void main() {
  print('1. เริ่ม');

  Future.delayed(Duration(seconds: 3), () {
    print('2. โหลดเสร็จ');
  }).then((_) {});
  
  print('3. จบ');
}
