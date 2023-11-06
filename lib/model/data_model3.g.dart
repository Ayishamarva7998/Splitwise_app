// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model3.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupListAdapter extends TypeAdapter<GroupList> {
  @override
  final int typeId = 3;

  @override
  GroupList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupList(
      contacts: fields[0] as String,
      groupname: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GroupList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.contacts)
      ..writeByte(1)
      ..write(obj.groupname);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}