// Copyright (c) 2013-present, the authors of the Pointy Castle project
// This library is dually licensed under LGPL 3 and MPL 2.0.
// See file LICENSE for more information.

library pointycastleold.impl.ec_domain_parameters.gostr3410_2001_cryptopro_xcha;

import "package:pointycastleold/ecc/api.dart";
import "package:pointycastleold/ecc/ecc_base.dart";
import "package:pointycastleold/src/ec_standard_curve_constructor.dart";
import "package:pointycastleold/src/registry/registry.dart";

class ECCurve_gostr3410_2001_cryptopro_xcha extends ECDomainParametersImpl {
  static final FactoryConfig FACTORY_CONFIG = new StaticFactoryConfig(
      ECDomainParameters,
      "GostR3410-2001-CryptoPro-XchA",
      () => ECCurve_gostr3410_2001_cryptopro_xcha());

  factory ECCurve_gostr3410_2001_cryptopro_xcha() => constructFpStandardCurve(
      "GostR3410-2001-CryptoPro-XchA",
      ECCurve_gostr3410_2001_cryptopro_xcha._make,
      q: BigInt.parse(
          "fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd97",
          radix: 16),
      a: BigInt.parse(
          "fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffd94",
          radix: 16),
      b: BigInt.parse("a6", radix: 16),
      g: BigInt.parse(
          "0400000000000000000000000000000000000000000000000000000000000000018d91e471e0989cda27df505a453f2b7635294f2ddf23e3b122acc99c9e9f1e14",
          radix: 16),
      n: BigInt.parse(
          "ffffffffffffffffffffffffffffffff6c611070995ad10045841b09b761b893",
          radix: 16),
      h: BigInt.parse("1", radix: 16),
      seed: null);

  static ECCurve_gostr3410_2001_cryptopro_xcha _make(
          domainName, curve, G, n, _h, seed) =>
      new ECCurve_gostr3410_2001_cryptopro_xcha._super(
          domainName, curve, G, n, _h, seed);

  ECCurve_gostr3410_2001_cryptopro_xcha._super(
      domainName, curve, G, n, _h, seed)
      : super(domainName, curve, G, n, _h, seed);
}
