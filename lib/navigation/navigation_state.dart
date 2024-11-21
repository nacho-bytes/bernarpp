import 'package:flutter/material.dart' show Widget;

import '../common/copyable.dart';

/// The state of the navigation bar.
/// 
/// The [NavigationState] class is a simple
/// class that holds the index of the selected destination.
class NavigationState with Copyable<NavigationState> {
  /// Constructor for the [NavigationState] class.
  ///
  /// This constructor initializes the index of the selected destination.
  /// 
  /// The [index] parameter is required and must be greater than or equal to 0.
  /// The [destinations] parameter is required and must not be empty.
  /// The [index] parameter must be less than the number of destinations.
  /// The labels of the [destinations] must be unique.
  NavigationState({
    required this.index,
    required this.destinations,
  }) :
    assert(
      index >= 0,
      'The index must be greater than or equal to 0.',
    ),
    assert(
      destinations.isNotEmpty,
      'The list of destinations must not be empty.',
    ),
    assert(
      index < destinations.length,
      'The index must be less than the number of destinations.',
    ),
    assert(
      destinations.map(
        (final NavigationStateDestination destination) => destination.label,
        ).toSet().length == destinations.length,
      'The labels of the destinations must be unique.',
    );

  /// The index of the selected destination.
  final int index;

  /// The list of destinations.
  final List<NavigationStateDestination> destinations;

  @override
  NavigationState copyWith({
    final int? index,
    final List<NavigationStateDestination>? destinations,
  }) => NavigationState(
    index: index ?? this.index,
    destinations: destinations ?? this.destinations,
  );
}

/// A destination in the navigation bar.
/// 
/// The [NavigationStateDestination] class is a simple class that holds the
/// destination and the widget associated with it.
class NavigationStateDestination with Copyable<NavigationStateDestination> {
  /// Constructor for the [NavigationStateDestination] class.
  /// 
  /// This constructor initializes the destination and the widget associated
  /// with it.
  /// 
  /// The [label] parameter is required and must not be empty.
  const NavigationStateDestination({
    required this.label,
    required this.destination,
    required this.widget,
  }) :
    assert(
      label.length > 0,
      'The label must not be empty.',
    );

  /// The label of the destination.
  final String label;

  /// The destination.
  final Widget destination;

  /// The widget associated with the destination.
  final Widget widget;

  @override
  NavigationStateDestination copyWith({
    final String? label,
    final Widget? destination,
    final Widget? widget,
  }) => NavigationStateDestination(
    label: label ?? this.label,
    destination: destination ?? this.destination,
    widget: widget ?? this.widget,
  );
}
