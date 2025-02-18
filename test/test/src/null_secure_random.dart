// Copyright (c) 2013-present, the authors of the Pointy Castle project
// This library is dually licensed under LGPL 3 and MPL 2.0.
// See file LICENSE for more information.

library pointycastleold.impl.secure_random.test.src.null_secure_random;

import "package:pointycastleold/api.dart";
import "package:pointycastleold/src/impl/secure_random_base.dart";
import "package:pointycastleold/src/registry/registry.dart";
import "package:pointycastleold/src/ufixnum.dart";

/// An implementation of [SecureRandom] that return numbers in growing sequence.
class NullSecureRandom extends SecureRandomBase {
  static final FactoryConfig FACTORY_CONFIG =
      new StaticFactoryConfig(SecureRandom, "Null", () => NullSecureRandom());

  var _nextValue = 0;

  String get algorithmName => "Null";

  void seed(CipherParameters params) {}

  int nextUint8() => clip8(_nextValue++);
}
