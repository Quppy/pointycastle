// Copyright (c) 2013-present, the authors of the Pointy Castle project
// This library is dually licensed under LGPL 3 and MPL 2.0.
// See file LICENSE for more information.

library pointycastleold.src.utils_test;

import "dart:math";
import "dart:typed_data";

import "package:test/test.dart";
import "package:pointycastleold/src/utils.dart";

Random random = new Random();

Uint8List randomBytes(int length) {
  return new Uint8List.fromList(new List<int>.generate(length, (_) {
    return random.nextInt(0xff + 1);
  }, growable: false));
}

main() {
  test("decode encode roundtrip", () {
    for (int size = 1; size < 100; size++) {
      Uint8List bytes = randomBytes(size);

      // Remove leading zeroes.
      while (!bytes.isEmpty && bytes[0] == 0x0) {
        bytes = bytes.sublist(1, bytes.length);
      }

      if (bytes.isEmpty) {
        continue;
      }

      BigInt decoded = decodeBigInt(bytes);
      Uint8List encoded = encodeBigInt(decoded);
      expect(encoded, equals(bytes));
    }
  });
}
