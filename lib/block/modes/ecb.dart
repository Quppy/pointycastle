// Copyright (c) 2013-present, the authors of the Pointy Castle project
// This library is dually licensed under LGPL 3 and MPL 2.0.
// See file LICENSE for more information.

library pointycastleold.impl.block_cipher.modes.ecb;

import "dart:typed_data";

import "package:pointycastleold/api.dart";
import "package:pointycastleold/src/registry/registry.dart";
import "package:pointycastleold/src/impl/base_block_cipher.dart";

/// Implementation of Electronic Code Book (ECB) mode on top of a [BlockCipher].
class ECBBlockCipher extends BaseBlockCipher {
  /// Intended for internal use.
  static final FactoryConfig FACTORY_CONFIG = new DynamicFactoryConfig.suffix(
      BlockCipher,
      "/ECB",
      (_, final Match match) => () {
            BlockCipher underlying = new BlockCipher(match.group(1));
            return new ECBBlockCipher(underlying);
          });

  final BlockCipher _underlyingCipher;

  ECBBlockCipher(this._underlyingCipher);

  String get algorithmName => "${_underlyingCipher.algorithmName}/ECB";

  int get blockSize => _underlyingCipher.blockSize;

  void reset() {
    _underlyingCipher.reset();
  }

  void init(bool forEncryption, CipherParameters params) {
    _underlyingCipher.init(forEncryption, params);
  }

  int processBlock(Uint8List inp, int inpOff, Uint8List out, int outOff) =>
      _underlyingCipher.processBlock(inp, inpOff, out, outOff);
}
