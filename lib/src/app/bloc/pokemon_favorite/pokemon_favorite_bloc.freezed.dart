// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_favorite_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PokemonFavoriteState {

 List<Pokemon> get pokemons;
/// Create a copy of PokemonFavoriteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonFavoriteStateCopyWith<PokemonFavoriteState> get copyWith => _$PokemonFavoriteStateCopyWithImpl<PokemonFavoriteState>(this as PokemonFavoriteState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonFavoriteState&&const DeepCollectionEquality().equals(other.pokemons, pokemons));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(pokemons));

@override
String toString() {
  return 'PokemonFavoriteState(pokemons: $pokemons)';
}


}

/// @nodoc
abstract mixin class $PokemonFavoriteStateCopyWith<$Res>  {
  factory $PokemonFavoriteStateCopyWith(PokemonFavoriteState value, $Res Function(PokemonFavoriteState) _then) = _$PokemonFavoriteStateCopyWithImpl;
@useResult
$Res call({
 List<Pokemon> pokemons
});




}
/// @nodoc
class _$PokemonFavoriteStateCopyWithImpl<$Res>
    implements $PokemonFavoriteStateCopyWith<$Res> {
  _$PokemonFavoriteStateCopyWithImpl(this._self, this._then);

  final PokemonFavoriteState _self;
  final $Res Function(PokemonFavoriteState) _then;

/// Create a copy of PokemonFavoriteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pokemons = null,}) {
  return _then(_self.copyWith(
pokemons: null == pokemons ? _self.pokemons : pokemons // ignore: cast_nullable_to_non_nullable
as List<Pokemon>,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonFavoriteState].
extension PokemonFavoriteStatePatterns on PokemonFavoriteState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Success value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Success value)  success,}){
final _that = this;
switch (_that) {
case _Success():
return success(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Success value)?  success,}){
final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<Pokemon> pokemons)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that.pokemons);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<Pokemon> pokemons)  success,}) {final _that = this;
switch (_that) {
case _Success():
return success(_that.pokemons);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<Pokemon> pokemons)?  success,}) {final _that = this;
switch (_that) {
case _Success() when success != null:
return success(_that.pokemons);case _:
  return null;

}
}

}

/// @nodoc


class _Success implements PokemonFavoriteState {
  const _Success({required final  List<Pokemon> pokemons}): _pokemons = pokemons;
  

 final  List<Pokemon> _pokemons;
@override List<Pokemon> get pokemons {
  if (_pokemons is EqualUnmodifiableListView) return _pokemons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pokemons);
}


/// Create a copy of PokemonFavoriteState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&const DeepCollectionEquality().equals(other._pokemons, _pokemons));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_pokemons));

@override
String toString() {
  return 'PokemonFavoriteState.success(pokemons: $pokemons)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $PokemonFavoriteStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@override @useResult
$Res call({
 List<Pokemon> pokemons
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of PokemonFavoriteState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pokemons = null,}) {
  return _then(_Success(
pokemons: null == pokemons ? _self._pokemons : pokemons // ignore: cast_nullable_to_non_nullable
as List<Pokemon>,
  ));
}


}

/// @nodoc
mixin _$PokemonFavoriteEvent {

 Pokemon get pokemon;
/// Create a copy of PokemonFavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PokemonFavoriteEventCopyWith<PokemonFavoriteEvent> get copyWith => _$PokemonFavoriteEventCopyWithImpl<PokemonFavoriteEvent>(this as PokemonFavoriteEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PokemonFavoriteEvent&&(identical(other.pokemon, pokemon) || other.pokemon == pokemon));
}


@override
int get hashCode => Object.hash(runtimeType,pokemon);

@override
String toString() {
  return 'PokemonFavoriteEvent(pokemon: $pokemon)';
}


}

/// @nodoc
abstract mixin class $PokemonFavoriteEventCopyWith<$Res>  {
  factory $PokemonFavoriteEventCopyWith(PokemonFavoriteEvent value, $Res Function(PokemonFavoriteEvent) _then) = _$PokemonFavoriteEventCopyWithImpl;
@useResult
$Res call({
 Pokemon pokemon
});




}
/// @nodoc
class _$PokemonFavoriteEventCopyWithImpl<$Res>
    implements $PokemonFavoriteEventCopyWith<$Res> {
  _$PokemonFavoriteEventCopyWithImpl(this._self, this._then);

  final PokemonFavoriteEvent _self;
  final $Res Function(PokemonFavoriteEvent) _then;

/// Create a copy of PokemonFavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? pokemon = null,}) {
  return _then(_self.copyWith(
pokemon: null == pokemon ? _self.pokemon : pokemon // ignore: cast_nullable_to_non_nullable
as Pokemon,
  ));
}

}


/// Adds pattern-matching-related methods to [PokemonFavoriteEvent].
extension PokemonFavoriteEventPatterns on PokemonFavoriteEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Toggle value)?  toggle,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Toggle() when toggle != null:
return toggle(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Toggle value)  toggle,}){
final _that = this;
switch (_that) {
case _Toggle():
return toggle(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Toggle value)?  toggle,}){
final _that = this;
switch (_that) {
case _Toggle() when toggle != null:
return toggle(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Pokemon pokemon)?  toggle,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Toggle() when toggle != null:
return toggle(_that.pokemon);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Pokemon pokemon)  toggle,}) {final _that = this;
switch (_that) {
case _Toggle():
return toggle(_that.pokemon);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Pokemon pokemon)?  toggle,}) {final _that = this;
switch (_that) {
case _Toggle() when toggle != null:
return toggle(_that.pokemon);case _:
  return null;

}
}

}

/// @nodoc


class _Toggle implements PokemonFavoriteEvent {
  const _Toggle({required this.pokemon});
  

@override final  Pokemon pokemon;

/// Create a copy of PokemonFavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleCopyWith<_Toggle> get copyWith => __$ToggleCopyWithImpl<_Toggle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Toggle&&(identical(other.pokemon, pokemon) || other.pokemon == pokemon));
}


@override
int get hashCode => Object.hash(runtimeType,pokemon);

@override
String toString() {
  return 'PokemonFavoriteEvent.toggle(pokemon: $pokemon)';
}


}

/// @nodoc
abstract mixin class _$ToggleCopyWith<$Res> implements $PokemonFavoriteEventCopyWith<$Res> {
  factory _$ToggleCopyWith(_Toggle value, $Res Function(_Toggle) _then) = __$ToggleCopyWithImpl;
@override @useResult
$Res call({
 Pokemon pokemon
});




}
/// @nodoc
class __$ToggleCopyWithImpl<$Res>
    implements _$ToggleCopyWith<$Res> {
  __$ToggleCopyWithImpl(this._self, this._then);

  final _Toggle _self;
  final $Res Function(_Toggle) _then;

/// Create a copy of PokemonFavoriteEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? pokemon = null,}) {
  return _then(_Toggle(
pokemon: null == pokemon ? _self.pokemon : pokemon // ignore: cast_nullable_to_non_nullable
as Pokemon,
  ));
}


}

// dart format on
