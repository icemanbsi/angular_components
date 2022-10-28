///
//  Generated code. Do not modify.
//  source: date_range.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use datepickerDateRangeDescriptor instead')
const DatepickerDateRange$json = const {
  '1': 'DatepickerDateRange',
  '2': const [
    const {
      '1': 'date_range',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.ngcomponents.lib.material_datepicker.proto.DateRange',
      '10': 'dateRange'
    },
    const {'1': 'days_ago', '3': 2, '4': 1, '5': 5, '9': 0, '10': 'daysAgo'},
    const {'1': 'weeks_ago', '3': 3, '4': 1, '5': 5, '9': 0, '10': 'weeksAgo'},
    const {
      '1': 'months_ago',
      '3': 4,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'monthsAgo'
    },
    const {
      '1': 'quarters_ago',
      '3': 10,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'quartersAgo'
    },
    const {
      '1': 'broadcast_months_ago',
      '3': 8,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'broadcastMonthsAgo'
    },
    const {'1': 'years_ago', '3': 5, '4': 1, '5': 5, '9': 0, '10': 'yearsAgo'},
    const {
      '1': 'last_n_days',
      '3': 6,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'lastNDays'
    },
    const {
      '1': 'last_n_days_to_today',
      '3': 9,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'lastNDaysToToday'
    },
    const {
      '1': 'next_n_days_from_today',
      '3': 12,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'nextNDaysFromToday'
    },
    const {
      '1': 'all_time_range',
      '3': 7,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'allTimeRange'
    },
    const {'1': 'start_weekday', '3': 11, '4': 1, '5': 5, '10': 'startWeekday'},
  ],
  '8': const [
    const {'1': 'relative_preset'},
  ],
};

/// Descriptor for `DatepickerDateRange`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List datepickerDateRangeDescriptor = $convert.base64Decode(
    'ChNEYXRlcGlja2VyRGF0ZVJhbmdlElQKCmRhdGVfcmFuZ2UYASABKAsyNS5uZ2NvbXBvbmVudHMubGliLm1hdGVyaWFsX2RhdGVwaWNrZXIucHJvdG8uRGF0ZVJhbmdlUglkYXRlUmFuZ2USGwoIZGF5c19hZ28YAiABKAVIAFIHZGF5c0FnbxIdCgl3ZWVrc19hZ28YAyABKAVIAFIId2Vla3NBZ28SHwoKbW9udGhzX2FnbxgEIAEoBUgAUgltb250aHNBZ28SIwoMcXVhcnRlcnNfYWdvGAogASgFSABSC3F1YXJ0ZXJzQWdvEjIKFGJyb2FkY2FzdF9tb250aHNfYWdvGAggASgFSABSEmJyb2FkY2FzdE1vbnRoc0FnbxIdCgl5ZWFyc19hZ28YBSABKAVIAFIIeWVhcnNBZ28SIAoLbGFzdF9uX2RheXMYBiABKAVIAFIJbGFzdE5EYXlzEjAKFGxhc3Rfbl9kYXlzX3RvX3RvZGF5GAkgASgFSABSEGxhc3RORGF5c1RvVG9kYXkSNAoWbmV4dF9uX2RheXNfZnJvbV90b2RheRgMIAEoBUgAUhJuZXh0TkRheXNGcm9tVG9kYXkSJgoOYWxsX3RpbWVfcmFuZ2UYByABKAhIAFIMYWxsVGltZVJhbmdlEiMKDXN0YXJ0X3dlZWtkYXkYCyABKAVSDHN0YXJ0V2Vla2RheUIRCg9yZWxhdGl2ZV9wcmVzZXQ=');
@$core.Deprecated('Use dateRangeDescriptor instead')
const DateRange$json = const {
  '1': 'DateRange',
  '2': const [
    const {
      '1': 'start',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.ngcomponents.lib.material_datepicker.proto.Date',
      '10': 'start'
    },
    const {
      '1': 'end',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.ngcomponents.lib.material_datepicker.proto.Date',
      '10': 'end'
    },
  ],
};

/// Descriptor for `DateRange`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dateRangeDescriptor = $convert.base64Decode(
    'CglEYXRlUmFuZ2USRgoFc3RhcnQYASABKAsyMC5uZ2NvbXBvbmVudHMubGliLm1hdGVyaWFsX2RhdGVwaWNrZXIucHJvdG8uRGF0ZVIFc3RhcnQSQgoDZW5kGAIgASgLMjAubmdjb21wb25lbnRzLmxpYi5tYXRlcmlhbF9kYXRlcGlja2VyLnByb3RvLkRhdGVSA2VuZA==');
