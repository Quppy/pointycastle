// Copyright (c) 2013-present, the authors of the Pointy Castle project
// This library is dually licensed under LGPL 3 and MPL 2.0.
// See file LICENSE for more information.

library pointycastleold.benchmark.stream.salsa20_benchmark;

import "dart:typed_data";

import "package:pointycastleold/pointycastle.dart";

import "../benchmark/stream_cipher_benchmark.dart";

void main() {
  final keyBytes = new Uint8List.fromList([
    0x00,
    0x11,
    0x22,
    0x33,
    0x44,
    0x55,
    0x66,
    0x77,
    0x88,
    0x99,
    0xAA,
    0xBB,
    0xCC,
    0xDD,
    0xEE,
    0xFF
  ]);
  final key = new KeyParameter(keyBytes);
  final iv =
      new Uint8List.fromList([0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77]);
  final params = new ParametersWithIV(key, iv);

  new StreamCipherBenchmark("Salsa20", null, true, () => params).report();
  new StreamCipherBenchmark("Salsa20", null, false, () => params).report();
}
