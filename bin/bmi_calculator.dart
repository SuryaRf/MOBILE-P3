import 'dart:io';
import 'dart:math';

void main() {
  print('=== BMI Calculator: Hitung & Kategori ===');

  final tinggiCm = _readPositiveDouble('Masukkan tinggi (cm): ');
  final beratKg  = _readPositiveDouble('Masukkan berat (kg): ');

  final bmi = _hitungBMI(tinggiCm, beratKg);
  final kategori = _kategoriBMI(bmi);

  print('\nHasil:');
  print('Tinggi : ${tinggiCm.toStringAsFixed(1)} cm');
  print('Berat  : ${beratKg.toStringAsFixed(1)} kg');
  print('BMI    : ${bmi.toStringAsFixed(2)}');
  print('Kategori: $kategori');
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

double _hitungBMI(double tinggiCm, double beratKg) {
  final tinggiM = tinggiCm / 100.0;
  return beratKg / pow(tinggiM, 2);
}

String _kategoriBMI(double bmi) {
  if (bmi < 18.5) return 'Kurus';
  if (bmi < 25.0) return 'Normal';
  if (bmi < 30.0) return 'Gemuk';
  return 'Obesitas';
}
