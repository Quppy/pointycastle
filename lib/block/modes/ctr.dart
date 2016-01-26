// Copyright (c) 2013-present, Iván Zaera Avellón - izaera@gmail.com

// This library is dually licensed under LGPL 3 and MPL 2.0. See file LICENSE for more information.

// This Source Code Form is subject to the terms of the Mozilla Public License, v. 2.0. If a copy of
// the MPL was not distributed with this file, you can obtain one at http://mozilla.org/MPL/2.0/.

library cipher.impl.block_cipher.modes.ctr;

import "package:cipher/api.dart";
import "package:cipher/adapters/stream_cipher_as_block_cipher.dart";
import "package:cipher/stream/ctr.dart";
import "package:cipher/src/registry/registry.dart";

class CTRBlockCipher extends StreamCipherAsBlockCipher {

  /// Intended for internal use.
  static final FactoryConfig FACTORY_CONFIG =
      new DynamicFactoryConfig.suffix("/CTR", (final String algorithmName, _) => () {
        int sep = algorithmName.lastIndexOf("/");
        BlockCipher underlying = new BlockCipher(algorithmName.substring(0, sep));
        return new CTRBlockCipher(underlying.blockSize, new CTRStreamCipher(underlying));
      });

  CTRBlockCipher(int blockSize, StreamCipher underlyingCipher)
      : super(blockSize, underlyingCipher);

}