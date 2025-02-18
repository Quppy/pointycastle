// Copyright (c) 2013-present, the authors of the Pointy Castle project
// This library is dually licensed under LGPL 3 and MPL 2.0.
// See file LICENSE for more information.

library pointycastleold.test.digests.sha224_test;

import "package:pointycastleold/pointycastle.dart";

import "../test/digest_tests.dart";

void main() {
  runDigestTests(new Digest("SHA-224"), [
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
    "10cffc69eddba6e8eafae57155284bd074778e0903e251ea9c8f9f62",
    "En un lugar de La Mancha, de cuyo nombre no quiero acordarme...",
    "f62bf1175f02176cfb00c370aea1c7203ba45a91cf776535380ab1a5",
  ]);
}
