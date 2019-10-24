import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:objc_plugin/objc_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('objc_plugin');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await ObjcPlugin.platformVersion, '42');
  });
}
