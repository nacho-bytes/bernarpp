
import 'dart:async' show FutureOr;

import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, Emitter;

import 'navigation_state.dart';

export 'navigation_state.dart';

/// An event for the navigation bloc.
sealed class NavigationEvent {}

/// An event to navigate to a specific index.
/// 
/// The [NavigationGoToIndexEvent] class is an event that allows
/// the user to navigate to a specific index in the list of destinations.
final class NavigationGoToIndexEvent extends NavigationEvent {
  /// Constructor for the [NavigationGoToIndexEvent] class.
  /// 
  /// This constructor initializes the index to navigate to.
  /// 
  /// The [index] parameter is required and must be greater than or equal to 0.
  /// The [index] parameter must be less than the number of destinations.
  NavigationGoToIndexEvent({
    required this.index,
  }) : assert(
    index >= 0,
    'The index must be greater than or equal to 0.',
  );

  /// The index to navigate to.
  final int index;
}

/// An event to navigate to a specific destination label.
/// 
/// The [NavigationGoToLabelEvent] class is an event that allows
/// the user to navigate to a specific destination label.
final class NavigationGoToLabelEvent extends NavigationEvent {
  /// Constructor for the [NavigationGoToLabelEvent] class.
  /// 
  /// This constructor initializes the label to navigate to.
  /// 
  /// The [label] parameter is required and must not be empty.
  NavigationGoToLabelEvent({
    required this.label,
  }) : assert(
    label.isNotEmpty,
    'The label must not be empty.',
  );

  /// The label to navigate to.
  final String label;
}

/// Bloc for the navigation bar.
/// 
/// The [NavigationBloc] class is a simple
/// bloc that handles the navigation bar, allowing
/// the user to switch between different destinations.
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  /// Constructor for the [NavigationBloc] class.
  /// 
  /// This constructor initializes the list of destinations
  /// and the initial index.
  /// 
  /// The [destinations] parameter is required and must not be null.
  /// The [initialIndex] parameter is optional and defaults to 0.
  /// The [initialIndex] parameter must be less than the number of destinations.
  /// Two [destinations] cannot have the same label.
  NavigationBloc({
    required final List<NavigationStateDestination> destinations,
    final int initialIndex = 0,
  }) : super(
    NavigationState(
      index: initialIndex,
      destinations: destinations,
    ),
  ) {
    on<NavigationGoToIndexEvent>(_onGoToIndex);
    on<NavigationGoToLabelEvent>(_onGoToLabel);
  }

  FutureOr<void> _onGoToIndex(
    final NavigationGoToIndexEvent event,
    final Emitter<NavigationState> emit,
  ) {
    if (event.index < 0 || event.index >= state.destinations.length) {
      throw ArgumentError(
        'The index must be greater than or equal to'
        ' 0 and less than the number of destinations.',
      );
    }
    emit(
      state.copyWith(
        index: event.index,
      ),
    );
  }

  FutureOr<void> _onGoToLabel(
    final NavigationGoToLabelEvent event,
    final Emitter<NavigationState> emit,
  ) {
    final int index = state.destinations.indexWhere(
      (final NavigationStateDestination destination) =>
        destination.label == event.label,
    );
    if (index == -1) {
      throw ArgumentError(
        'The label does not exist in the list of destinations.',
      );
    }
    emit(
      state.copyWith(
        index: index,
      ),
    );
  }
}
