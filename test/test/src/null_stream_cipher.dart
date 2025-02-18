// Copyright (c) 2013-present, the authors of the Pointy Castle project
// This library is dually licensed under LGPL 3 and MPL 2.0.
// See file LICENSE for more information.

library pointycastleold.impl.stream_cipher.test.src.null_stream_cipher;

import "dart:typed_data";

import "package:pointycastleold/api.dart";
import "package:pointycastleold/src/impl/base_stream_cipher.dart";
import "package:pointycastleold/src/registry/registry.dart";

/**
 * An implementation of a null [StreamCipher], that is, a cipher that does not encrypt, neither decrypt. It can be used for
 * testing or benchmarking chaining algorithms.
 */
class NullStreamCipher extends BaseStreamCipher {
  static final FactoryConfig FACTORY_CONFIG =
      new StaticFactoryConfig(StreamCipher, "Null", () => NullStreamCipher());

  String get algorithmName => "Null";

  void reset() {}

  void init(bool forEncryption, CipherParameters params) {}

  void processBytes(
      Uint8List inp, int inpOff, int len, Uint8List out, int outOff) {
    out.setRange(outOff, outOff + len, inp.sublist(inpOff));
  }

  int returnByte(int inp) {
    return inp;
  }
}
