// Copyright (c) 2013-present, the authors of the Pointy Castle project
// This library is dually licensed under LGPL 3 and MPL 2.0.
// See file LICENSE for more information.

library pointycastleold.impl.padding.pkcs7;

import "dart:typed_data";

import "package:pointycastleold/api.dart";
import "package:pointycastleold/src/impl/base_padding.dart";
import "package:pointycastleold/src/registry/registry.dart";
import "package:pointycastleold/src/ufixnum.dart";

/// A [Padding] that adds PKCS7/PKCS5 padding to a block.
class PKCS7Padding extends BasePadding {
  static final FactoryConfig FACTORY_CONFIG =
      new StaticFactoryConfig(Padding, "PKCS7", () => PKCS7Padding());

  String get algorithmName => "PKCS7";

  void init([CipherParameters params]) {
    // nothing to do.
  }

  int addPadding(Uint8List data, int offset) {
    var code = (data.length - offset);

    while (offset < data.length) {
      data[offset] = code;
      offset++;
    }

    return code;
  }

  int padCount(Uint8List data) {
    var count = clip8(data[data.length - 1]);

    if (count > data.length || count == 0) {
      throw new ArgumentError("Invalid or corrupted pad block");
    }

    for (var i = 1; i <= count; i++) {
      if (data[data.length - i] != count) {
        throw new ArgumentError("Invalid or corrupted pad block");
      }
    }

    return count;
  }
}
