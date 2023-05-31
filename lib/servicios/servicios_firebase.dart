import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore bd = FirebaseFirestore.instance;

bool sesionIniciada = false;

Future<List> getProductosPrincipales() async {
  List productos = [];

  CollectionReference coleccionPaginaPrincipal = bd.collection('paginaPrincipal');

  QuerySnapshot queryProductos = await coleccionPaginaPrincipal.get();

  queryProductos.docs.forEach((documento) {
    productos.add(documento.data());
  });

  return productos;
}

Future<List> getProductosDulces() async {
  List productos = [];

  CollectionReference coleccionPaginaDulces = bd.collection('paginaDulces');

  QuerySnapshot queryProductos = await coleccionPaginaDulces.get();

  queryProductos.docs.forEach((documento) {
    productos.add(documento.data());
  });

  return productos;
}

Future<List> getProductosChocolates() async {
  List productos = [];

  CollectionReference coleccionPaginaChocolates = bd.collection('paginaChocolates');

  QuerySnapshot queryProductos = await coleccionPaginaChocolates.get();

  queryProductos.docs.forEach((documento) {
    productos.add(documento.data());
  });

  return productos;
}

Future<List> getProductosFrituras() async {
  List productos = [];

  CollectionReference coleccionPaginaFrituras = bd.collection('paginaFrituras');

  QuerySnapshot queryProductos = await coleccionPaginaFrituras.get();

  queryProductos.docs.forEach((documento) {
    productos.add(documento.data());
  });

  return productos;
}

Future<List> getProductosPlasticosYDesechables() async {
  List productos = [];

  CollectionReference coleccionPaginaPlasticosYDesechables = bd.collection('paginaPlasticosYDesechables');

  QuerySnapshot queryProductos = await coleccionPaginaPlasticosYDesechables.get();

  queryProductos.docs.forEach((documento) {
    productos.add(documento.data());
  });

  return productos;
}

Future<List> getProductosCarrito() async {
  List productos = [];

  CollectionReference coleccionPaginaCarrito = bd.collection('paginaCarrito');

  QuerySnapshot queryProductos = await coleccionPaginaCarrito.get();

  queryProductos.docs.forEach((documento) {
    productos.add(documento.data());
  });

  return productos;
}

Future<void> addProductoEnCarrito(String nombre, String precio) async {
  await bd.collection('paginaCarrito').add({
    'nombre': nombre,
    'precio': precio,
  });
}

Future<bool> realizaCompra() async {
  if(sesionIniciada) {
    QuerySnapshot queryProductos = await bd.collection('paginaCarrito').get();

    if(queryProductos.size == 0) {
      return false;
    }

    for(var doc in queryProductos.docs) {
      final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      final producto = {
        'uid': doc.id,
        'nombre': data['nombre'],
      };

      await updateInventario(producto['nombre']);

      bd.collection('paginaCarrito').doc(producto['uid']).delete();
    }

    return true;
  } else {
    return false;
  }
}

Future<void> updateInventario(String nombre) async {
  QuerySnapshot queryProductos = await bd.collection('paginaPrincipal').get();

  for(var doc in queryProductos.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    final producto = {
      'uid': doc.id,
      'imagen': data['imagen'],
      'nombre': data['nombre'],
      'descripcion': data['descripcion'],
      'precio': data['precio'],
      'inventario': data['inventario'],
    };

    if(producto['nombre'] == nombre) {
      String nuevoInventario;

      int viejoInventario = int.parse(data['inventario']);
      int resta = viejoInventario - 1;

      nuevoInventario = resta.toString();

      await bd.collection('paginaPrincipal').doc(producto['uid']).set({
        'imagen': data['imagen'],
        'nombre': data['nombre'],
        'descripcion': data['descripcion'],
        'precio': data['precio'],
        'inventario': nuevoInventario,
      });
    }
  }

  QuerySnapshot queryProductosDulces = await bd.collection('paginaDulces').get();

  for(var doc in queryProductosDulces.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    final producto = {
      'uid': doc.id,
      'imagen': data['imagen'],
      'nombre': data['nombre'],
      'descripcion': data['descripcion'],
      'precio': data['precio'],
      'inventario': data['inventario'],
    };

    if(producto['nombre'] == nombre) {
      String nuevoInventario;

      int viejoInventario = int.parse(data['inventario']);
      int resta = viejoInventario - 1;

      nuevoInventario = resta.toString();

      await bd.collection('paginaDulces').doc(producto['uid']).set({
        'imagen': data['imagen'],
        'nombre': data['nombre'],
        'descripcion': data['descripcion'],
        'precio': data['precio'],
        'inventario': nuevoInventario,
      });
    }
  }

  QuerySnapshot queryProductosChocolates = await bd.collection('paginaChocolates').get();

  for(var doc in queryProductosChocolates.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    final producto = {
      'uid': doc.id,
      'imagen': data['imagen'],
      'nombre': data['nombre'],
      'descripcion': data['descripcion'],
      'precio': data['precio'],
      'inventario': data['inventario'],
    };

    if(producto['nombre'] == nombre) {
      String nuevoInventario;

      int viejoInventario = int.parse(data['inventario']);
      int resta = viejoInventario - 1;

      nuevoInventario = resta.toString();

      await bd.collection('paginaChocolates').doc(producto['uid']).set({
        'imagen': data['imagen'],
        'nombre': data['nombre'],
        'descripcion': data['descripcion'],
        'precio': data['precio'],
        'inventario': nuevoInventario,
      });
    }
  }

  QuerySnapshot queryProductosFrituras = await bd.collection('paginaFrituras').get();

  for(var doc in queryProductosFrituras.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    final producto = {
      'uid': doc.id,
      'imagen': data['imagen'],
      'nombre': data['nombre'],
      'descripcion': data['descripcion'],
      'precio': data['precio'],
      'inventario': data['inventario'],
    };

    if(producto['nombre'] == nombre) {
      String nuevoInventario;

      int viejoInventario = int.parse(data['inventario']);
      int resta = viejoInventario - 1;

      nuevoInventario = resta.toString();

      await bd.collection('paginaFrituras').doc(producto['uid']).set({
        'imagen': data['imagen'],
        'nombre': data['nombre'],
        'descripcion': data['descripcion'],
        'precio': data['precio'],
        'inventario': nuevoInventario,
      });
    }
  }

  QuerySnapshot queryProductosPyD = await bd.collection('paginaPlasticosYDesechables').get();

  for(var doc in queryProductosPyD.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    final producto = {
      'uid': doc.id,
      'imagen': data['imagen'],
      'nombre': data['nombre'],
      'descripcion': data['descripcion'],
      'precio': data['precio'],
      'inventario': data['inventario'],
    };

    if(producto['nombre'] == nombre) {
      String nuevoInventario;

      int viejoInventario = int.parse(data['inventario']);
      int resta = viejoInventario - 1;

      nuevoInventario = resta.toString();

      await bd.collection('paginaPlasticosYDesechables').doc(producto['uid']).set({
        'imagen': data['imagen'],
        'nombre': data['nombre'],
        'descripcion': data['descripcion'],
        'precio': data['precio'],
        'inventario': nuevoInventario,
      });
    }
  }
}

Future<void> deleteProductosCarrito() async {
  QuerySnapshot queryProductos = await bd.collection('paginaCarrito').get();

  for(var doc in queryProductos.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    final producto = {
      'uid': doc.id,
      'nombre': data['nombre'],
    };
    
    bd.collection('paginaCarrito').doc(producto['uid']).delete();
  }
}

Future<bool> getUsuario(String correo, String contrasena) async {
  QuerySnapshot queryUsuarios = await bd.collection('usuarios').get();

  for(var doc in queryUsuarios.docs) {
    final Map<String, dynamic> data =  doc.data() as Map<String, dynamic>;

    final usuario = {
      'uid': doc.id,
      'nombre': data['nombre'],
      'correo': data['correo'],
      'contrasena': data['contrasena'],
    };

    if(usuario['correo'] == correo && usuario['contrasena'] == contrasena) {
      sesionIniciada = true;

      return true;
    }
  }

  return false;
}

Future<bool> addUsuarios(String nombre, String correo, String contrasena) async {
  if(!sesionIniciada) {
    await bd.collection('usuarios').add({
      'nombre': nombre,
      'correo': correo,
      'contrasena': contrasena,
    });

    Future<bool> res = getUsuario(correo, contrasena);

    if(await res) {
      sesionIniciada = true;

      return true;
    } else {
      return false;
    }
  } else {
    return false;
  }
}