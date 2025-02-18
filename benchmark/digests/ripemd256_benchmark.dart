// Copyright (c) 2013-present, the authors of the Pointy Castle project
// This library is dually licensed under LGPL 3 and MPL 2.0.
// See file LICENSE for more information.

library pointycastleold.benchmark.digests.ripemd256_benchmark;

import "../benchmark/digest_benchmark.dart";

main() {
  new DigestBenchmark("RIPEMD-256").report();
}
