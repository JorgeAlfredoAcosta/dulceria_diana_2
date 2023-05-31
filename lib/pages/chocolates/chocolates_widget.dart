import 'package:dulceria_d_i_a_n_a_3/servicios/servicios_firebase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'chocolates_model.dart';
export 'chocolates_model.dart';

class ChocolatesWidget extends StatefulWidget {
  const ChocolatesWidget({Key? key}) : super(key: key);

  @override
  _ChocolatesWidgetState createState() => _ChocolatesWidgetState();
}

class _ChocolatesWidgetState extends State<ChocolatesWidget> {
  late ChocolatesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChocolatesModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFFFF930),
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Text(
              'Dulcería DIANA',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Poppins',
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: FutureBuilder<List>(
            future: getProductosChocolates(),
            builder: ((context, snapshot) {
              if(snapshot.hasData) {
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0
                          ),
                          child: Image.network(
                            snapshot.data?[index]['imagen'],
                            width: 200.0,
                            height: 225.0,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0
                          ),
                          child: Text(
                            snapshot.data?[index]['nombre'],
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(
                                context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0
                          ),
                          child: Text(
                            snapshot.data?[index]['descripcion'],
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(
                                context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 10.0, 0.0
                          ),
                          child: Text(
                            'Precio: ' + snapshot.data?[index]['precio'] + ' MXN',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(
                                context).bodyMedium.override(
                              fontFamily: 'Poppins',
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 20.0
                            ),
                            child: FFButtonWidget(
                              onPressed: () {
                                print('Button pressed ...');
                                if(int.parse(snapshot.data?[index]['inventario']) > 0) {
                                  addProductoEnCarrito(
                                      snapshot.data?[index]['nombre'],
                                      snapshot.data?[index]['precio']);
                                  showSnackbar(
                                      context,
                                      'El producto se ha agregado al carrito'
                                  );
                                } else {
                                  showSnackbar(context, 'Inventario agotado');
                                }
                              },
                              text: 'Agregar al carrito',
                              options: FFButtonOptions(
                                width: 130.0,
                                height: 40.0,
                                padding:
                                EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0
                                ),
                                iconPadding:
                                EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0
                                ),
                                color: Color(0xFF1DF94C),
                                textStyle:
                                FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.black,
                                  fontSize: 20.0,
                                ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
