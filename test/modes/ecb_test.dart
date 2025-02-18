// Copyright (c) 2013-present, the authors of the Pointy Castle project
// This library is dually licensed under LGPL 3 and MPL 2.0.
// See file LICENSE for more information.

library pointycastleold.test.modes.ecb_test;

import "dart:typed_data";

import "package:pointycastleold/pointycastle.dart";
import 'package:pointycastleold/src/registry/registry.dart';

import "../test/block_cipher_tests.dart";
import "../test/src/null_block_cipher.dart";

void main() {
  final iv = new Uint8List.fromList([
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
  final params = new ParametersWithIV(null, iv);

  registry.register(NullBlockCipher.FACTORY_CONFIG);

  runBlockCipherTests(new BlockCipher("Null/ECB"), params, [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit ........",
    "4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c6974202e2e2e2e2e2e2e2e",
    "En un lugar de La Mancha, de cuyo nombre no quiero acordarme ...",
    "456e20756e206c75676172206465204c61204d616e6368612c206465206375796f206e6f6d627265206e6f2071756965726f2061636f726461726d65202e2e2e",
  ]);
}
