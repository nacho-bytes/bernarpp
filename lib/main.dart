// bernarpp is an application designed to simplify the management 
// of events, finances, and group coordination for musical organizations.
// Copyright (C) 2024 Nacho Diez Lambies

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.

// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

import 'package:flutter/material.dart' show BuildContext, ColorScheme, Colors, MaterialApp, Scaffold, StatelessWidget, ThemeData, Widget, runApp;

void main() {
  runApp(const Bernarpp());
}

/// The main widget of the application.
///
/// [Bernarpp] is a stateless widget ([StatelessWidget]) that serves as the 
/// entry point of the application. It sets up the overall theme and the 
/// initial home page of the app.
class Bernarpp extends StatelessWidget {
  /// Constructor for the [Bernarpp] class.
  ///
  /// This constructor is marked as constant, enabling optimizations when
  /// used in the widget tree.
  const Bernarpp({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const Scaffold(),
  );
}
