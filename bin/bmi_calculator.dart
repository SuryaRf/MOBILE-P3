import 'dart:io';
import 'dart:math';

void main() {
  print('=== BMI Calculator: dengan Riwayat ===');

  final List<Map<String, dynamic>> riwayat = [];

  // perulangan utama untuk input berulang
  while (true) {
    final tinggiCm = _readPositiveDouble('Masukkan tinggi (cm): ');
    final beratKg  = _readPositiveDouble('Masukkan berat (kg): ');

    final bmi = _hitungBMI(tinggiCm, beratKg);
    final kategori = _kategoriBMI(bmi);

    // simpan ke riwayat
    riwayat.add({
      'tinggi': tinggiCm,
      'berat':  beratKg,
      'bmi':    double.parse(bmi.toStringAsFixed(2)),
      'kategori': kategori,
      'waktu': DateTime.now(),
    });

    print('\nHasil: BMI=${bmi.toStringAsFixed(2)} ($kategori)');

    // tanya lanjut?
    stdout.write('Hitung lagi? (y/n): ');
    final ans = (stdin.readLineSync() ?? '').trim().toLowerCase();
    if (ans != 'y') break;
    print('');
  }

  // tampilkan riwayat dengan perulangan
  _tampilkanRiwayat(riwayat);
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

void _tampilkanRiwayat(List<Map<String, dynamic>> riwayat) {
  if (riwayat.isEmpty) {
    print('\nBelum ada riwayat.');
    return;
  }
  print('\n=== RIWAYAT PERHITUNGAN ===');
  print('No |     Waktu      | Tinggi(cm) | Berat(kg) |  BMI  | Kategori');
  print('---+-----------------+------------+-----------+-------+----------');

  for (int i = 0; i < riwayat.length; i++) {
    final r = riwayat[i];
    final no = (i + 1).toString().padLeft(2);
    final t  = (r['tinggi'] as num).toStringAsFixed(1).padLeft(10);
    final b  = (r['berat']  as num).toStringAsFixed(1).padLeft(9);
    final bmi = (r['bmi']   as num).toStringAsFixed(2).padLeft(5);
    final kat = (r['kategori'] as String).padRight(8);
    final waktu = (r['waktu'] as DateTime);
    final ts = '${waktu.hour.toString().padLeft(2, '0')}:${waktu.minute.toString().padLeft(2, '0')}';
    print('$no |   $ts         | $t | $b | $bmi | $kat');
  }
}
