// Copyright (c) 2013-present, the authors of the Pointy Castle project
// This library is dually licensed under LGPL 3 and MPL 2.0.
// See file LICENSE for more information.

library pointycastleold.impl.block_cipher.modes.ctr;

import "package:pointycastleold/api.dart";
import "package:pointycastleold/adapters/stream_cipher_as_block_cipher.dart";
import "package:pointycastleold/stream/ctr.dart";
import "package:pointycastleold/src/registry/registry.dart";

class CTRBlockCipher extends StreamCipherAsBlockCipher {
  /// Intended for internal use.
  static final FactoryConfig FACTORY_CONFIG = new DynamicFactoryConfig.suffix(
      BlockCipher,
      "/CTR",
      (_, final Match match) => () {
            BlockCipher underlying = new BlockCipher(match.group(1));
            return new CTRBlockCipher(
                underlying.blockSize, new CTRStreamCipher(underlying));
          });

  CTRBlockCipher(int blockSize, StreamCipher underlyingCipher)
      : super(blockSize, underlyingCipher);
}
