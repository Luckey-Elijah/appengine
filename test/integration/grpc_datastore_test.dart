// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'package:test/test.dart' as test;

import 'package:appengine/src/grpc_api_impl/auth_utils.dart';
import 'package:appengine/src/grpc_api_impl/grpc.dart' as grpc;
import 'package:appengine/src/grpc_api_impl/datastore_impl.dart';
import 'package:gcloud/db.dart' as db;
import 'package:googleapis_auth/auth_io.dart';

import 'common_e2e.dart' show withServiceAccount;
import 'db/db_impl_test.dart' as db_tests;
import 'raw_datastore_test_impl.dart' as datastore_tests;

main() async {
  final endpoint = Uri.parse('https://datastore.googleapis.com');
  final scopes = <String>[
    'https://www.googleapis.com/auth/cloud-platform',
    'https://www.googleapis.com/auth/datastore',
  ];

  final now = new DateTime.now().millisecondsSinceEpoch;
  final String namespace = '${Platform.operatingSystem}${now}';

  await withServiceAccount(
      (String project, ServiceAccountCredentials serviceAccount) async {
    final accessTokenProvider =
        new ServiceAccountTokenProvider(serviceAccount, scopes);
    final dialer = new grpc.Dialer(endpoint);
    final client = new grpc.Client(dialer, accessTokenProvider, 10);
    final datastore = new GrpcDatastoreImpl(client, project);

    // Once all tests are done we'll close the resources.
    test.tearDownAll(() async {
      await client.close();
      await accessTokenProvider.close();
    });

    // Run low-level datastore tests.
    datastore_tests.runTests(datastore, namespace);

    // Run high-level db tests.
    db_tests.runTests(new db.DatastoreDB(datastore), namespace);
  });
}