library pointycastleold.src.registry.impl;

import 'package:pointycastleold/asymmetric/oaep.dart';
import 'package:pointycastleold/asymmetric/pkcs1.dart';
import 'package:pointycastleold/asymmetric/rsa.dart';
import 'package:pointycastleold/block/aes_fast.dart';
import 'package:pointycastleold/block/modes/cbc.dart';
import 'package:pointycastleold/block/modes/cfb.dart';
import 'package:pointycastleold/block/modes/ctr.dart';
import 'package:pointycastleold/block/modes/ecb.dart';
import 'package:pointycastleold/block/modes/gctr.dart';
import 'package:pointycastleold/block/modes/ofb.dart';
import 'package:pointycastleold/block/modes/sic.dart';
import 'package:pointycastleold/digests/blake2b.dart';
import 'package:pointycastleold/digests/md2.dart';
import 'package:pointycastleold/digests/md4.dart';
import 'package:pointycastleold/digests/md5.dart';
import 'package:pointycastleold/digests/ripemd128.dart';
import 'package:pointycastleold/digests/ripemd160.dart';
import 'package:pointycastleold/digests/ripemd256.dart';
import 'package:pointycastleold/digests/ripemd320.dart';
import 'package:pointycastleold/digests/sha1.dart';
import 'package:pointycastleold/digests/sha224.dart';
import 'package:pointycastleold/digests/sha256.dart';
import 'package:pointycastleold/digests/sha3.dart';
import 'package:pointycastleold/digests/sha384.dart';
import 'package:pointycastleold/digests/sha512.dart';
import 'package:pointycastleold/digests/sha512t.dart';
import 'package:pointycastleold/digests/tiger.dart';
import 'package:pointycastleold/digests/whirlpool.dart';
import 'package:pointycastleold/ecc/curves/brainpoolp160r1.dart';
import 'package:pointycastleold/ecc/curves/brainpoolp160t1.dart';
import 'package:pointycastleold/ecc/curves/brainpoolp192r1.dart';
import 'package:pointycastleold/ecc/curves/brainpoolp192t1.dart';
import 'package:pointycastleold/ecc/curves/brainpoolp224r1.dart';
import 'package:pointycastleold/ecc/curves/brainpoolp224t1.dart';
import 'package:pointycastleold/ecc/curves/brainpoolp256r1.dart';
import 'package:pointycastleold/ecc/curves/brainpoolp256t1.dart';
import 'package:pointycastleold/ecc/curves/brainpoolp320r1.dart';
import 'package:pointycastleold/ecc/curves/brainpoolp320t1.dart';
import 'package:pointycastleold/ecc/curves/brainpoolp384r1.dart';
import 'package:pointycastleold/ecc/curves/brainpoolp384t1.dart';
import 'package:pointycastleold/ecc/curves/brainpoolp512r1.dart';
import 'package:pointycastleold/ecc/curves/brainpoolp512t1.dart';
import 'package:pointycastleold/ecc/curves/gostr3410_2001_cryptopro_a.dart';
import 'package:pointycastleold/ecc/curves/gostr3410_2001_cryptopro_b.dart';
import 'package:pointycastleold/ecc/curves/gostr3410_2001_cryptopro_c.dart';
import 'package:pointycastleold/ecc/curves/gostr3410_2001_cryptopro_xcha.dart';
import 'package:pointycastleold/ecc/curves/gostr3410_2001_cryptopro_xchb.dart';
import 'package:pointycastleold/ecc/curves/prime192v1.dart';
import 'package:pointycastleold/ecc/curves/prime192v2.dart';
import 'package:pointycastleold/ecc/curves/prime192v3.dart';
import 'package:pointycastleold/ecc/curves/prime239v1.dart';
import 'package:pointycastleold/ecc/curves/prime239v2.dart';
import 'package:pointycastleold/ecc/curves/prime239v3.dart';
import 'package:pointycastleold/ecc/curves/prime256v1.dart';
import 'package:pointycastleold/ecc/curves/secp112r1.dart';
import 'package:pointycastleold/ecc/curves/secp112r2.dart';
import 'package:pointycastleold/ecc/curves/secp128r1.dart';
import 'package:pointycastleold/ecc/curves/secp128r2.dart';
import 'package:pointycastleold/ecc/curves/secp160k1.dart';
import 'package:pointycastleold/ecc/curves/secp160r1.dart';
import 'package:pointycastleold/ecc/curves/secp160r2.dart';
import 'package:pointycastleold/ecc/curves/secp192k1.dart';
import 'package:pointycastleold/ecc/curves/secp192r1.dart';
import 'package:pointycastleold/ecc/curves/secp224k1.dart';
import 'package:pointycastleold/ecc/curves/secp224r1.dart';
import 'package:pointycastleold/ecc/curves/secp256k1.dart';
import 'package:pointycastleold/ecc/curves/secp256r1.dart';
import 'package:pointycastleold/ecc/curves/secp384r1.dart';
import 'package:pointycastleold/ecc/curves/secp521r1.dart';
import 'package:pointycastleold/key_derivators/pbkdf2.dart';
import 'package:pointycastleold/key_derivators/scrypt.dart';
import 'package:pointycastleold/key_generators/ec_key_generator.dart';
import 'package:pointycastleold/key_generators/rsa_key_generator.dart';
import 'package:pointycastleold/macs/hmac.dart';
import 'package:pointycastleold/macs/cmac.dart';
import 'package:pointycastleold/macs/cbc_block_cipher_mac.dart';
import 'package:pointycastleold/padded_block_cipher/padded_block_cipher_impl.dart';
import 'package:pointycastleold/paddings/pkcs7.dart';
import 'package:pointycastleold/paddings/iso7816d4.dart';
import 'package:pointycastleold/random/auto_seed_block_ctr_random.dart';
import 'package:pointycastleold/random/block_ctr_random.dart';
import 'package:pointycastleold/random/fortuna_random.dart';
import 'package:pointycastleold/signers/ecdsa_signer.dart';
import 'package:pointycastleold/signers/rsa_signer.dart';
import 'package:pointycastleold/src/registry/registry.dart';
import 'package:pointycastleold/stream/ctr.dart';
import 'package:pointycastleold/stream/salsa20.dart';
import 'package:pointycastleold/stream/sic.dart';

void registerFactories(FactoryRegistry registry) {
  _registerAsymmetricCiphers(registry);
  _registerBlockCiphers(registry);
  _registerDigests(registry);
  _registerECCurves(registry);
  _registerKeyDerivators(registry);
  _registerKeyGenerators(registry);
  _registerMacs(registry);
  _registerPaddedBlockCiphers(registry);
  _registerPaddings(registry);
  _registerRandoms(registry);
  _registerSigners(registry);
  _registerStreamCiphers(registry);
}

void _registerAsymmetricCiphers(FactoryRegistry registry) {
  registry.register(OAEPEncoding.FACTORY_CONFIG);
  registry.register(PKCS1Encoding.FACTORY_CONFIG);
  registry.register(RSAEngine.FACTORY_CONFIG);
}

void _registerBlockCiphers(FactoryRegistry registry) {
  registry.register(AESFastEngine.FACTORY_CONFIG);

  // modes
  registry.register(CBCBlockCipher.FACTORY_CONFIG);
  registry.register(CFBBlockCipher.FACTORY_CONFIG);
  registry.register(CTRBlockCipher.FACTORY_CONFIG);
  registry.register(ECBBlockCipher.FACTORY_CONFIG);
  registry.register(GCTRBlockCipher.FACTORY_CONFIG);
  registry.register(OFBBlockCipher.FACTORY_CONFIG);
  registry.register(SICBlockCipher.FACTORY_CONFIG);
}

void _registerDigests(FactoryRegistry registry) {
  registry.register(Blake2bDigest.FACTORY_CONFIG);
  registry.register(MD2Digest.FACTORY_CONFIG);
  registry.register(MD4Digest.FACTORY_CONFIG);
  registry.register(MD5Digest.FACTORY_CONFIG);
  registry.register(RIPEMD128Digest.FACTORY_CONFIG);
  registry.register(RIPEMD160Digest.FACTORY_CONFIG);
  registry.register(RIPEMD256Digest.FACTORY_CONFIG);
  registry.register(RIPEMD320Digest.FACTORY_CONFIG);
  registry.register(SHA1Digest.FACTORY_CONFIG);
  registry.register(SHA3Digest.FACTORY_CONFIG);
  registry.register(SHA224Digest.FACTORY_CONFIG);
  registry.register(SHA256Digest.FACTORY_CONFIG);
  registry.register(SHA384Digest.FACTORY_CONFIG);
  registry.register(SHA512Digest.FACTORY_CONFIG);
  registry.register(SHA512tDigest.FACTORY_CONFIG);
  registry.register(TigerDigest.FACTORY_CONFIG);
  registry.register(WhirlpoolDigest.FACTORY_CONFIG);
}

void _registerECCurves(FactoryRegistry registry) {
  registry.register(ECCurve_brainpoolp160r1.FACTORY_CONFIG);
  registry.register(ECCurve_brainpoolp160t1.FACTORY_CONFIG);
  registry.register(ECCurve_brainpoolp192r1.FACTORY_CONFIG);
  registry.register(ECCurve_brainpoolp192t1.FACTORY_CONFIG);
  registry.register(ECCurve_brainpoolp224r1.FACTORY_CONFIG);
  registry.register(ECCurve_brainpoolp224t1.FACTORY_CONFIG);
  registry.register(ECCurve_brainpoolp256r1.FACTORY_CONFIG);
  registry.register(ECCurve_brainpoolp256t1.FACTORY_CONFIG);
  registry.register(ECCurve_brainpoolp320r1.FACTORY_CONFIG);
  registry.register(ECCurve_brainpoolp320t1.FACTORY_CONFIG);
  registry.register(ECCurve_brainpoolp384r1.FACTORY_CONFIG);
  registry.register(ECCurve_brainpoolp384t1.FACTORY_CONFIG);
  registry.register(ECCurve_brainpoolp512r1.FACTORY_CONFIG);
  registry.register(ECCurve_brainpoolp512t1.FACTORY_CONFIG);
  registry.register(ECCurve_gostr3410_2001_cryptopro_a.FACTORY_CONFIG);
  registry.register(ECCurve_gostr3410_2001_cryptopro_b.FACTORY_CONFIG);
  registry.register(ECCurve_gostr3410_2001_cryptopro_c.FACTORY_CONFIG);
  registry.register(ECCurve_gostr3410_2001_cryptopro_xcha.FACTORY_CONFIG);
  registry.register(ECCurve_gostr3410_2001_cryptopro_xchb.FACTORY_CONFIG);
  registry.register(ECCurve_prime192v1.FACTORY_CONFIG);
  registry.register(ECCurve_prime192v2.FACTORY_CONFIG);
  registry.register(ECCurve_prime192v3.FACTORY_CONFIG);
  registry.register(ECCurve_prime239v1.FACTORY_CONFIG);
  registry.register(ECCurve_prime239v2.FACTORY_CONFIG);
  registry.register(ECCurve_prime239v3.FACTORY_CONFIG);
  registry.register(ECCurve_prime256v1.FACTORY_CONFIG);
  registry.register(ECCurve_secp112r1.FACTORY_CONFIG);
  registry.register(ECCurve_secp112r2.FACTORY_CONFIG);
  registry.register(ECCurve_secp128r1.FACTORY_CONFIG);
  registry.register(ECCurve_secp128r2.FACTORY_CONFIG);
  registry.register(ECCurve_secp160k1.FACTORY_CONFIG);
  registry.register(ECCurve_secp160r1.FACTORY_CONFIG);
  registry.register(ECCurve_secp160r2.FACTORY_CONFIG);
  registry.register(ECCurve_secp192k1.FACTORY_CONFIG);
  registry.register(ECCurve_secp192r1.FACTORY_CONFIG);
  registry.register(ECCurve_secp224k1.FACTORY_CONFIG);
  registry.register(ECCurve_secp224r1.FACTORY_CONFIG);
  registry.register(ECCurve_secp256k1.FACTORY_CONFIG);
  registry.register(ECCurve_secp256r1.FACTORY_CONFIG);
  registry.register(ECCurve_secp384r1.FACTORY_CONFIG);
  registry.register(ECCurve_secp521r1.FACTORY_CONFIG);
}

void _registerKeyDerivators(FactoryRegistry registry) {
  registry.register(PBKDF2KeyDerivator.FACTORY_CONFIG);
  registry.register(Scrypt.FACTORY_CONFIG);
}

void _registerKeyGenerators(FactoryRegistry registry) {
  registry.register(ECKeyGenerator.FACTORY_CONFIG);
  registry.register(RSAKeyGenerator.FACTORY_CONFIG);
}

void _registerMacs(FactoryRegistry registry) {
  registry.register(HMac.FACTORY_CONFIG);
  registry.register(CMac.FACTORY_CONFIG);
  registry.register(CBCBlockCipherMac.FACTORY_CONFIG);
}

void _registerPaddedBlockCiphers(FactoryRegistry registry) {
  registry.register(PaddedBlockCipherImpl.FACTORY_CONFIG);
}

void _registerPaddings(FactoryRegistry registry) {
  registry.register(PKCS7Padding.FACTORY_CONFIG);
  registry.register(ISO7816d4Padding.FACTORY_CONFIG);
}

void _registerRandoms(FactoryRegistry registry) {
  registry.register(AutoSeedBlockCtrRandom.FACTORY_CONFIG);
  registry.register(BlockCtrRandom.FACTORY_CONFIG);
  registry.register(FortunaRandom.FACTORY_CONFIG);
}

void _registerSigners(FactoryRegistry registry) {
  registry.register(ECDSASigner.FACTORY_CONFIG);
  registry.register(RSASigner.FACTORY_CONFIG);
}

void _registerStreamCiphers(FactoryRegistry registry) {
  registry.register(CTRStreamCipher.FACTORY_CONFIG);
  registry.register(Salsa20Engine.FACTORY_CONFIG);
  registry.register(SICStreamCipher.FACTORY_CONFIG);
}
