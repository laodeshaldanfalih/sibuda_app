// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CredentialEntity extends DataClass
    implements Insertable<CredentialEntity> {
  final int id;
  final String email;
  CredentialEntity({required this.id, required this.email});
  factory CredentialEntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CredentialEntity(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      email: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}email'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['email'] = Variable<String>(email);
    return map;
  }

  CredentialEntitiesCompanion toCompanion(bool nullToAbsent) {
    return CredentialEntitiesCompanion(
      id: Value(id),
      email: Value(email),
    );
  }

  factory CredentialEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CredentialEntity(
      id: serializer.fromJson<int>(json['id']),
      email: serializer.fromJson<String>(json['email']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'email': serializer.toJson<String>(email),
    };
  }

  CredentialEntity copyWith({int? id, String? email}) => CredentialEntity(
        id: id ?? this.id,
        email: email ?? this.email,
      );
  @override
  String toString() {
    return (StringBuffer('CredentialEntity(')
          ..write('id: $id, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, email.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CredentialEntity &&
          other.id == this.id &&
          other.email == this.email);
}

class CredentialEntitiesCompanion extends UpdateCompanion<CredentialEntity> {
  final Value<int> id;
  final Value<String> email;
  const CredentialEntitiesCompanion({
    this.id = const Value.absent(),
    this.email = const Value.absent(),
  });
  CredentialEntitiesCompanion.insert({
    required int id,
    required String email,
  })  : id = Value(id),
        email = Value(email);
  static Insertable<CredentialEntity> custom({
    Expression<int>? id,
    Expression<String>? email,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (email != null) 'email': email,
    });
  }

  CredentialEntitiesCompanion copyWith({Value<int>? id, Value<String>? email}) {
    return CredentialEntitiesCompanion(
      id: id ?? this.id,
      email: email ?? this.email,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CredentialEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('email: $email')
          ..write(')'))
        .toString();
  }
}

class $CredentialEntitiesTable extends CredentialEntities
    with TableInfo<$CredentialEntitiesTable, CredentialEntity> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CredentialEntitiesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _emailMeta = const VerificationMeta('email');
  late final GeneratedColumn<String?> email = GeneratedColumn<String?>(
      'email', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, email];
  @override
  String get aliasedName => _alias ?? 'credentials';
  @override
  String get actualTableName => 'credentials';
  @override
  VerificationContext validateIntegrity(Insertable<CredentialEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  CredentialEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CredentialEntity.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CredentialEntitiesTable createAlias(String alias) {
    return $CredentialEntitiesTable(_db, alias);
  }
}

class ProfileEntity extends DataClass implements Insertable<ProfileEntity> {
  final int id;
  final int role;
  final String name;
  final String nik;
  final DateTime birthDate;
  final int birthPlace;
  ProfileEntity(
      {required this.id,
      required this.role,
      required this.name,
      required this.nik,
      required this.birthDate,
      required this.birthPlace});
  factory ProfileEntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ProfileEntity(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      role: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}role'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      nik: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}nik'])!,
      birthDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}birth_date'])!,
      birthPlace: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}birth_place'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['role'] = Variable<int>(role);
    map['name'] = Variable<String>(name);
    map['nik'] = Variable<String>(nik);
    map['birth_date'] = Variable<DateTime>(birthDate);
    map['birth_place'] = Variable<int>(birthPlace);
    return map;
  }

  ProfileEntitiesCompanion toCompanion(bool nullToAbsent) {
    return ProfileEntitiesCompanion(
      id: Value(id),
      role: Value(role),
      name: Value(name),
      nik: Value(nik),
      birthDate: Value(birthDate),
      birthPlace: Value(birthPlace),
    );
  }

  factory ProfileEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ProfileEntity(
      id: serializer.fromJson<int>(json['id']),
      role: serializer.fromJson<int>(json['role']),
      name: serializer.fromJson<String>(json['name']),
      nik: serializer.fromJson<String>(json['nik']),
      birthDate: serializer.fromJson<DateTime>(json['birthDate']),
      birthPlace: serializer.fromJson<int>(json['birthPlace']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'role': serializer.toJson<int>(role),
      'name': serializer.toJson<String>(name),
      'nik': serializer.toJson<String>(nik),
      'birthDate': serializer.toJson<DateTime>(birthDate),
      'birthPlace': serializer.toJson<int>(birthPlace),
    };
  }

  ProfileEntity copyWith(
          {int? id,
          int? role,
          String? name,
          String? nik,
          DateTime? birthDate,
          int? birthPlace}) =>
      ProfileEntity(
        id: id ?? this.id,
        role: role ?? this.role,
        name: name ?? this.name,
        nik: nik ?? this.nik,
        birthDate: birthDate ?? this.birthDate,
        birthPlace: birthPlace ?? this.birthPlace,
      );
  @override
  String toString() {
    return (StringBuffer('ProfileEntity(')
          ..write('id: $id, ')
          ..write('role: $role, ')
          ..write('name: $name, ')
          ..write('nik: $nik, ')
          ..write('birthDate: $birthDate, ')
          ..write('birthPlace: $birthPlace')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          role.hashCode,
          $mrjc(
              name.hashCode,
              $mrjc(nik.hashCode,
                  $mrjc(birthDate.hashCode, birthPlace.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProfileEntity &&
          other.id == this.id &&
          other.role == this.role &&
          other.name == this.name &&
          other.nik == this.nik &&
          other.birthDate == this.birthDate &&
          other.birthPlace == this.birthPlace);
}

class ProfileEntitiesCompanion extends UpdateCompanion<ProfileEntity> {
  final Value<int> id;
  final Value<int> role;
  final Value<String> name;
  final Value<String> nik;
  final Value<DateTime> birthDate;
  final Value<int> birthPlace;
  const ProfileEntitiesCompanion({
    this.id = const Value.absent(),
    this.role = const Value.absent(),
    this.name = const Value.absent(),
    this.nik = const Value.absent(),
    this.birthDate = const Value.absent(),
    this.birthPlace = const Value.absent(),
  });
  ProfileEntitiesCompanion.insert({
    required int id,
    required int role,
    required String name,
    required String nik,
    required DateTime birthDate,
    required int birthPlace,
  })  : id = Value(id),
        role = Value(role),
        name = Value(name),
        nik = Value(nik),
        birthDate = Value(birthDate),
        birthPlace = Value(birthPlace);
  static Insertable<ProfileEntity> custom({
    Expression<int>? id,
    Expression<int>? role,
    Expression<String>? name,
    Expression<String>? nik,
    Expression<DateTime>? birthDate,
    Expression<int>? birthPlace,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (role != null) 'role': role,
      if (name != null) 'name': name,
      if (nik != null) 'nik': nik,
      if (birthDate != null) 'birth_date': birthDate,
      if (birthPlace != null) 'birth_place': birthPlace,
    });
  }

  ProfileEntitiesCompanion copyWith(
      {Value<int>? id,
      Value<int>? role,
      Value<String>? name,
      Value<String>? nik,
      Value<DateTime>? birthDate,
      Value<int>? birthPlace}) {
    return ProfileEntitiesCompanion(
      id: id ?? this.id,
      role: role ?? this.role,
      name: name ?? this.name,
      nik: nik ?? this.nik,
      birthDate: birthDate ?? this.birthDate,
      birthPlace: birthPlace ?? this.birthPlace,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (role.present) {
      map['role'] = Variable<int>(role.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (nik.present) {
      map['nik'] = Variable<String>(nik.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    if (birthPlace.present) {
      map['birth_place'] = Variable<int>(birthPlace.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProfileEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('role: $role, ')
          ..write('name: $name, ')
          ..write('nik: $nik, ')
          ..write('birthDate: $birthDate, ')
          ..write('birthPlace: $birthPlace')
          ..write(')'))
        .toString();
  }
}

class $ProfileEntitiesTable extends ProfileEntities
    with TableInfo<$ProfileEntitiesTable, ProfileEntity> {
  final GeneratedDatabase _db;
  final String? _alias;
  $ProfileEntitiesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES credentials(id)');
  final VerificationMeta _roleMeta = const VerificationMeta('role');
  late final GeneratedColumn<int?> role = GeneratedColumn<int?>(
      'role', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES roles(id)');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _nikMeta = const VerificationMeta('nik');
  late final GeneratedColumn<String?> nik = GeneratedColumn<String?>(
      'nik', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _birthDateMeta = const VerificationMeta('birthDate');
  late final GeneratedColumn<DateTime?> birthDate = GeneratedColumn<DateTime?>(
      'birth_date', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _birthPlaceMeta = const VerificationMeta('birthPlace');
  late final GeneratedColumn<int?> birthPlace = GeneratedColumn<int?>(
      'birth_place', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES cities(id)');
  @override
  List<GeneratedColumn> get $columns =>
      [id, role, name, nik, birthDate, birthPlace];
  @override
  String get aliasedName => _alias ?? 'profiles';
  @override
  String get actualTableName => 'profiles';
  @override
  VerificationContext validateIntegrity(Insertable<ProfileEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
          _roleMeta, role.isAcceptableOrUnknown(data['role']!, _roleMeta));
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('nik')) {
      context.handle(
          _nikMeta, nik.isAcceptableOrUnknown(data['nik']!, _nikMeta));
    } else if (isInserting) {
      context.missing(_nikMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(_birthDateMeta,
          birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta));
    } else if (isInserting) {
      context.missing(_birthDateMeta);
    }
    if (data.containsKey('birth_place')) {
      context.handle(
          _birthPlaceMeta,
          birthPlace.isAcceptableOrUnknown(
              data['birth_place']!, _birthPlaceMeta));
    } else if (isInserting) {
      context.missing(_birthPlaceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ProfileEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ProfileEntity.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ProfileEntitiesTable createAlias(String alias) {
    return $ProfileEntitiesTable(_db, alias);
  }
}

class RoleEntity extends DataClass implements Insertable<RoleEntity> {
  final int id;
  final String name;
  RoleEntity({required this.id, required this.name});
  factory RoleEntity.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return RoleEntity(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  RoleEntitiesCompanion toCompanion(bool nullToAbsent) {
    return RoleEntitiesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory RoleEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return RoleEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  RoleEntity copyWith({int? id, String? name}) => RoleEntity(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('RoleEntity(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RoleEntity && other.id == this.id && other.name == this.name);
}

class RoleEntitiesCompanion extends UpdateCompanion<RoleEntity> {
  final Value<int> id;
  final Value<String> name;
  const RoleEntitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  RoleEntitiesCompanion.insert({
    required int id,
    required String name,
  })  : id = Value(id),
        name = Value(name);
  static Insertable<RoleEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  RoleEntitiesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return RoleEntitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RoleEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $RoleEntitiesTable extends RoleEntities
    with TableInfo<$RoleEntitiesTable, RoleEntity> {
  final GeneratedDatabase _db;
  final String? _alias;
  $RoleEntitiesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'roles';
  @override
  String get actualTableName => 'roles';
  @override
  VerificationContext validateIntegrity(Insertable<RoleEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  RoleEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    return RoleEntity.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $RoleEntitiesTable createAlias(String alias) {
    return $RoleEntitiesTable(_db, alias);
  }
}

class CityEntity extends DataClass implements Insertable<CityEntity> {
  final int id;
  final String name;
  CityEntity({required this.id, required this.name});
  factory CityEntity.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CityEntity(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  CityEntitiesCompanion toCompanion(bool nullToAbsent) {
    return CityEntitiesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory CityEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CityEntity(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  CityEntity copyWith({int? id, String? name}) => CityEntity(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('CityEntity(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CityEntity && other.id == this.id && other.name == this.name);
}

class CityEntitiesCompanion extends UpdateCompanion<CityEntity> {
  final Value<int> id;
  final Value<String> name;
  const CityEntitiesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  CityEntitiesCompanion.insert({
    required int id,
    required String name,
  })  : id = Value(id),
        name = Value(name);
  static Insertable<CityEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  CityEntitiesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return CityEntitiesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CityEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $CityEntitiesTable extends CityEntities
    with TableInfo<$CityEntitiesTable, CityEntity> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CityEntitiesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'cities';
  @override
  String get actualTableName => 'cities';
  @override
  VerificationContext validateIntegrity(Insertable<CityEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  CityEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CityEntity.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CityEntitiesTable createAlias(String alias) {
    return $CityEntitiesTable(_db, alias);
  }
}

class PregnancyCheckUpIdEntity extends DataClass
    implements Insertable<PregnancyCheckUpIdEntity> {
  final int id;
  final int week;
  final String motherNik;
  PregnancyCheckUpIdEntity(
      {required this.id, required this.week, required this.motherNik});
  factory PregnancyCheckUpIdEntity.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PregnancyCheckUpIdEntity(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      week: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}week'])!,
      motherNik: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}mother_nik'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['week'] = Variable<int>(week);
    map['mother_nik'] = Variable<String>(motherNik);
    return map;
  }

  PregnancyCheckUpIdEntitiesCompanion toCompanion(bool nullToAbsent) {
    return PregnancyCheckUpIdEntitiesCompanion(
      id: Value(id),
      week: Value(week),
      motherNik: Value(motherNik),
    );
  }

  factory PregnancyCheckUpIdEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return PregnancyCheckUpIdEntity(
      id: serializer.fromJson<int>(json['id']),
      week: serializer.fromJson<int>(json['week']),
      motherNik: serializer.fromJson<String>(json['motherNik']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'week': serializer.toJson<int>(week),
      'motherNik': serializer.toJson<String>(motherNik),
    };
  }

  PregnancyCheckUpIdEntity copyWith({int? id, int? week, String? motherNik}) =>
      PregnancyCheckUpIdEntity(
        id: id ?? this.id,
        week: week ?? this.week,
        motherNik: motherNik ?? this.motherNik,
      );
  @override
  String toString() {
    return (StringBuffer('PregnancyCheckUpIdEntity(')
          ..write('id: $id, ')
          ..write('week: $week, ')
          ..write('motherNik: $motherNik')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(week.hashCode, motherNik.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PregnancyCheckUpIdEntity &&
          other.id == this.id &&
          other.week == this.week &&
          other.motherNik == this.motherNik);
}

class PregnancyCheckUpIdEntitiesCompanion
    extends UpdateCompanion<PregnancyCheckUpIdEntity> {
  final Value<int> id;
  final Value<int> week;
  final Value<String> motherNik;
  const PregnancyCheckUpIdEntitiesCompanion({
    this.id = const Value.absent(),
    this.week = const Value.absent(),
    this.motherNik = const Value.absent(),
  });
  PregnancyCheckUpIdEntitiesCompanion.insert({
    this.id = const Value.absent(),
    required int week,
    required String motherNik,
  })  : week = Value(week),
        motherNik = Value(motherNik);
  static Insertable<PregnancyCheckUpIdEntity> custom({
    Expression<int>? id,
    Expression<int>? week,
    Expression<String>? motherNik,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (week != null) 'week': week,
      if (motherNik != null) 'mother_nik': motherNik,
    });
  }

  PregnancyCheckUpIdEntitiesCompanion copyWith(
      {Value<int>? id, Value<int>? week, Value<String>? motherNik}) {
    return PregnancyCheckUpIdEntitiesCompanion(
      id: id ?? this.id,
      week: week ?? this.week,
      motherNik: motherNik ?? this.motherNik,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (week.present) {
      map['week'] = Variable<int>(week.value);
    }
    if (motherNik.present) {
      map['mother_nik'] = Variable<String>(motherNik.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PregnancyCheckUpIdEntitiesCompanion(')
          ..write('id: $id, ')
          ..write('week: $week, ')
          ..write('motherNik: $motherNik')
          ..write(')'))
        .toString();
  }
}

class $PregnancyCheckUpIdEntitiesTable extends PregnancyCheckUpIdEntities
    with TableInfo<$PregnancyCheckUpIdEntitiesTable, PregnancyCheckUpIdEntity> {
  final GeneratedDatabase _db;
  final String? _alias;
  $PregnancyCheckUpIdEntitiesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _weekMeta = const VerificationMeta('week');
  late final GeneratedColumn<int?> week = GeneratedColumn<int?>(
      'week', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _motherNikMeta = const VerificationMeta('motherNik');
  late final GeneratedColumn<String?> motherNik = GeneratedColumn<String?>(
      'mother_nik', aliasedName, false,
      typeName: 'TEXT',
      requiredDuringInsert: true,
      $customConstraints: 'REFERENCES profiles(nik)');
  @override
  List<GeneratedColumn> get $columns => [id, week, motherNik];
  @override
  String get aliasedName => _alias ?? 'pregnancy_check_up_ids';
  @override
  String get actualTableName => 'pregnancy_check_up_ids';
  @override
  VerificationContext validateIntegrity(
      Insertable<PregnancyCheckUpIdEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('week')) {
      context.handle(
          _weekMeta, week.isAcceptableOrUnknown(data['week']!, _weekMeta));
    } else if (isInserting) {
      context.missing(_weekMeta);
    }
    if (data.containsKey('mother_nik')) {
      context.handle(_motherNikMeta,
          motherNik.isAcceptableOrUnknown(data['mother_nik']!, _motherNikMeta));
    } else if (isInserting) {
      context.missing(_motherNikMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PregnancyCheckUpIdEntity map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return PregnancyCheckUpIdEntity.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PregnancyCheckUpIdEntitiesTable createAlias(String alias) {
    return $PregnancyCheckUpIdEntitiesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $CredentialEntitiesTable credentialEntities =
      $CredentialEntitiesTable(this);
  late final $ProfileEntitiesTable profileEntities =
      $ProfileEntitiesTable(this);
  late final $RoleEntitiesTable roleEntities = $RoleEntitiesTable(this);
  late final $CityEntitiesTable cityEntities = $CityEntitiesTable(this);
  late final $PregnancyCheckUpIdEntitiesTable pregnancyCheckUpIdEntities =
      $PregnancyCheckUpIdEntitiesTable(this);
  late final CredentialDao credentialDao = CredentialDao(this as AppDatabase);
  late final ProfileDao profileDao = ProfileDao(this as AppDatabase);
  late final RoleDao roleDao = RoleDao(this as AppDatabase);
  late final CityDao cityDao = CityDao(this as AppDatabase);
  late final PregnancyCheckUpIdDao pregnancyCheckUpIdDao =
      PregnancyCheckUpIdDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        credentialEntities,
        profileEntities,
        roleEntities,
        cityEntities,
        pregnancyCheckUpIdEntities
      ];
}