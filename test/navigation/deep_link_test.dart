import 'package:dietdriven/generated/deeplink.pb.dart';
import 'package:dietdriven/navigation/prelude.dart';
import 'package:test/test.dart';

import 'generate_invalid_deep_links.dart';
import 'generate_valid_deep_links.dart';

// FIXME: this didn't break the CI/CD
void main() {
  for (final deepLinkProto in generateAllValidProtoDeepLinks()) {
    test("Serialize and deserialize valid deep link", () {
      print(deepLinkProto);
      print("");
      final deepLink = DeepLink.deserializeProto(deepLinkProto);
      expect(deepLink.isValid(), true);
      final serializedProto = deepLink.serializeProto();
      print(serializedProto);
      final identity = DeepLink.deserializeProto(serializedProto);
      expect(identity, deepLink);
    });
  }

  for (final deepLinkProto in generateAllInvalidProtoDeepLinks()) {
    test("Fail to deserialize invalid deep link", () {
      print(deepLinkProto);
      final deepLink = DeepLink.deserializeProto(deepLinkProto);
      expect(deepLink.isValid(), false);
    });
  }
}

