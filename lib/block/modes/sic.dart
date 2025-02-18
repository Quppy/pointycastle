// Copyright (c) 2013-present, the authors of the Pointy Castle project
// This library is dually licensed under LGPL 3 and MPL 2.0.
// See file LICENSE for more information.

library pointycastleold.impl.block_cipher.modes.sic;

import "package:pointycastleold/api.dart";
import "package:pointycastleold/adapters/stream_cipher_as_block_cipher.dart";
import "package:pointycastleold/stream/sic.dart";
import "package:pointycastleold/src/registry/registry.dart";

/**
 * See [SICStreamCipher].
 */
class SICBlockCipher extends StreamCipherAsBlockCipher {
  /// Intended for internal use.
  static final FactoryConfig FACTORY_CONFIG = new DynamicFactoryConfig.suffix(
      BlockCipher,
      "/SIC",
      (_, final Match match) => () {
            BlockCipher underlying = new BlockCipher(match.group(1));
            return new SICBlockCipher(
                underlying.blockSize, new SICStreamCipher(underlying));
          });

  SICBlockCipher(int blockSize, StreamCipher underlyingCipher)
      : super(blockSize, underlyingCipher);
}
