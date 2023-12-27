import 'associated_object.dart';

class EphemeralKeyModel {
  String? id;
  String? object;
  List<AssociatedObject>? associatedObjects;
  int? created;
  int? expires;
  bool? livemode;
  String? secret;

  EphemeralKeyModel({
    this.id,
    this.object,
    this.associatedObjects,
    this.created,
    this.expires,
    this.livemode,
    this.secret,
  });

  factory EphemeralKeyModel.fromIdEphkey1ORyIzGdbKjFdZ6XvElOudghObjectEphemeralKeyAssociatedObjectsIdCusPgUmjfCv702DggTypeCustomerCreated1703688091Expires1703691691LivemodeFalseSecretEkTestYwNjdF8xT0wzckVhzgjLakZkWjZylGpKnFc2bmFZdHlOttVrWEpGwtnnQkxzOu84M0lwQ2g00048mePxr(
      Map<String, dynamic> json) {
    return EphemeralKeyModel(
      id: json['id'] as String?,
      object: json['object'] as String?,
      associatedObjects: (json['associated_objects'] as List<dynamic>?)
          ?.map((e) => AssociatedObject
              .fromIdEphkey1ORyIzGdbKjFdZ6XvElOudghObjectEphemeralKeyAssociatedObjectsIdCusPgUmjfCv702DggTypeCustomerCreated1703688091Expires1703691691LivemodeFalseSecretEkTestYwNjdF8xT0wzckVhzgjLakZkWjZylGpKnFc2bmFZdHlOttVrWEpGwtnnQkxzOu84M0lwQ2g00048mePxr(
                  e as Map<String, dynamic>))
          .toList(),
      created: json['created'] as int?,
      expires: json['expires'] as int?,
      livemode: json['livemode'] as bool?,
      secret: json['secret'] as String?,
    );
  }

  Map<String, dynamic>
      toIdEphkey1ORyIzGdbKjFdZ6XvElOudghObjectEphemeralKeyAssociatedObjectsIdCusPgUmjfCv702DggTypeCustomerCreated1703688091Expires1703691691LivemodeFalseSecretEkTestYwNjdF8xT0wzckVhzgjLakZkWjZylGpKnFc2bmFZdHlOttVrWEpGwtnnQkxzOu84M0lwQ2g00048mePxr() {
    return {
      'id': id,
      'object': object,
      'associated_objects': associatedObjects
          ?.map((e) => e
              .toIdEphkey1ORyIzGdbKjFdZ6XvElOudghObjectEphemeralKeyAssociatedObjectsIdCusPgUmjfCv702DggTypeCustomerCreated1703688091Expires1703691691LivemodeFalseSecretEkTestYwNjdF8xT0wzckVhzgjLakZkWjZylGpKnFc2bmFZdHlOttVrWEpGwtnnQkxzOu84M0lwQ2g00048mePxr())
          .toList(),
      'created': created,
      'expires': expires,
      'livemode': livemode,
      'secret': secret,
    };
  }
}
