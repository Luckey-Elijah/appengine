///
//  Generated code. Do not modify.
//  source: google/ads/googleads/v1/enums/ad_network_type.proto
///
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name

import 'dart:core' as $core
    show bool, Deprecated, double, int, List, Map, override, String;

import 'package:protobuf/protobuf.dart' as $pb;

export 'ad_network_type.pbenum.dart';

class AdNetworkTypeEnum extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AdNetworkTypeEnum',
      package: const $pb.PackageName('google.ads.googleads.v1.enums'))
    ..hasRequiredFields = false;

  AdNetworkTypeEnum() : super();
  AdNetworkTypeEnum.fromBuffer($core.List<$core.int> i,
      [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY])
      : super.fromBuffer(i, r);
  AdNetworkTypeEnum.fromJson($core.String i,
      [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY])
      : super.fromJson(i, r);
  AdNetworkTypeEnum clone() => AdNetworkTypeEnum()..mergeFromMessage(this);
  AdNetworkTypeEnum copyWith(void Function(AdNetworkTypeEnum) updates) =>
      super.copyWith((message) => updates(message as AdNetworkTypeEnum));
  $pb.BuilderInfo get info_ => _i;
  static AdNetworkTypeEnum create() => AdNetworkTypeEnum();
  AdNetworkTypeEnum createEmptyInstance() => create();
  static $pb.PbList<AdNetworkTypeEnum> createRepeated() =>
      $pb.PbList<AdNetworkTypeEnum>();
  static AdNetworkTypeEnum getDefault() =>
      _defaultInstance ??= create()..freeze();
  static AdNetworkTypeEnum _defaultInstance;
}