import 'dart:io';

void main() {
  print('=== BMI Calculator: Input & Validasi ===');

  final tinggi = _readPositiveDouble('Masukkan tinggi (cm): ');
  final berat  = _readPositiveDouble('Masukkan berat (kg): ');

  print('Input OK! Tinggi: ${tinggi.toStringAsFixed(1)} cm, '
        'Berat: ${berat.toStringAsFixed(1)} kg');
}

double _readPositiveDouble(String prompt) {
  while (true) {
    stdout.write(prompt);
    final s = stdin.readLineSync();
    final v = double.tryParse((s ?? '').trim());
    if (v != null && v > 0) return v;
    print('Input tidak valid. Masukkan angka > 0.');
  }
}
