// Copyright (c) 2013-present, the authors of the Pointy Castle project
// This library is dually licensed under LGPL 3 and MPL 2.0.
// See file LICENSE for more information.

library pointycastleold.impl.ec_domain_parameters.gostr3410_2001_cryptopro_c;

import "package:pointycastleold/ecc/api.dart";
import "package:pointycastleold/ecc/ecc_base.dart";
import "package:pointycastleold/src/ec_standard_curve_constructor.dart";
import "package:pointycastleold/src/registry/registry.dart";

class ECCurve_gostr3410_2001_cryptopro_c extends ECDomainParametersImpl {
  static final FactoryConfig FACTORY_CONFIG = new StaticFactoryConfig(
      ECDomainParameters,
      "GostR3410-2001-CryptoPro-C",
      () => ECCurve_gostr3410_2001_cryptopro_c());

  factory ECCurve_gostr3410_2001_cryptopro_c() => constructFpStandardCurve(
      "GostR3410-2001-CryptoPro-C", ECCurve_gostr3410_2001_cryptopro_c._make,
      q: BigInt.parse(
          "9b9f605f5a858107ab1ec85e6b41c8aacf846e86789051d37998f7b9022d759b",
          radix: 16),
      a: BigInt.parse(
          "9b9f605f5a858107ab1ec85e6b41c8aacf846e86789051d37998f7b9022d7598",
          radix: 16),
      b: BigInt.parse("805a", radix: 16),
      g: BigInt.parse(
          "04000000000000000000000000000000000000000000000000000000000000000041ece55743711a8c3cbf3783cd08c0ee4d4dc440d4641a8f366e550dfdb3bb67",
          radix: 16),
      n: BigInt.parse(
          "9b9f605f5a858107ab1ec85e6b41c8aa582ca3511eddfb74f02f3a6598980bb9",
          radix: 16),
      h: BigInt.parse("1", radix: 16),
      seed: null);

  static ECCurve_gostr3410_2001_cryptopro_c _make(
          domainName, curve, G, n, _h, seed) =>
      new ECCurve_gostr3410_2001_cryptopro_c._super(
          domainName, curve, G, n, _h, seed);

  ECCurve_gostr3410_2001_cryptopro_c._super(domainName, curve, G, n, _h, seed)
      : super(domainName, curve, G, n, _h, seed);
}
