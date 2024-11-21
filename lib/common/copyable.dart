/// Copyable mixin
/// 
/// This mixin is used to create a copy of the object.
/// 
/// The [T] parameter is the type of the object to copy.
mixin Copyable<T> {
  /// Creates a copy of the object.
  /// 
  /// The [copyWith] method creates a copy of the object.
  T copyWith();
}
