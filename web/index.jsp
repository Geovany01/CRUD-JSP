<%-- 
    Document   : index
    Created on : 6/09/2021, 19:09:24
    Author     : gvosc
--%>
<%@page import="modelo.Cliente"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Formulario Empleados</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    </head>
    <body>

        <div class="container">
            <!-- Modal -->
            <div class="modal fade" id="modalCliente" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-body">
                            <form action="SrCliente" method="post" class="form-group">
                                <label for="lblId"><b>ID</b></label>
                                <input type="text" name="txtId" id="txtId" class="form-control" value="0"  readonly>
                                <label for="lblNit"><b>NIT</b></label>
                                <input type="text" name="txtNit" id="txtNit" class="form-control" placeholder="Ejemplo: E001" >
                                <label for="lblNombres"><b>Nombres</b></label>
                                <input type="text" name="txtNombres" id="txtNombres" class="form-control" placeholder="Ejemplo: Nombre1 Nombre2">
                                <label for="lblApellidos"><b>Apellidos</b></label>
                                <input type="text" name="txtApellidos" id="txtApellidos" class="form-control" placeholder="Ejemplo: Apellido1 Apellido2">
                                <label for="lblDireccion"><b>Direccion</b></label>
                                <input type="text" name="txtDireccion" id="txtDireccion" class="form-control" placeholder="Ejemplo: #Casa Ave calle lug">
                                <label for="lblTelefono"><b>Telefono</b></label>
                                <input type="number" name="txtTelefono" id="txtTelefono" class="form-control" placeholder="Ejemplo: 12345678">
                                <label for="lblFechaNacimiento"><b>Nacimiento</b></label>
                                <input type="date" name="txtFechaNacimiento" id="txtFechaNacimiento" class="form-control" placeholder="yyy-MM-DD">
                                <br>
                                <button name="btn_agregar" id="btn_agregar" value="agregar" class="btn btn-primary btn-lg">Agregar</button>
                                <button name="btn_modificar" id="btn_modificar" value="modificar" class="btn btn-success btn-lg">Modifi</button>
                                <button name="btn_eliminar" id="btn_eliminar" value="eliminar" class="btn btn-danger btn-lg">Eliminar</button>
                                <button type="button" id="btn_close" class="btn btn-secondary btn-lg" data-bs-dismiss="modal">Close</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>




            <br>
            <h1>Clientes</h1>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>NIT</th>
                        <th>Nombres</th>
                        <th>Apellidos</th>
                        <th>Direccion</th>
                        <th>Telefono</th>
                        <th>Nacimiento</th>
                    </tr>
                </thead>
                <tbody id="tblClientes">
                    <%
         Cliente cliente = new Cliente();
         DefaultTableModel tabla = new DefaultTableModel();
         tabla = cliente.leer();
         for (int t=0;t <tabla.getRowCount();t++){
             out.println("<tr data-id="+tabla.getValueAt(t, 0)+">");
             out.println("<td>"+ tabla.getValueAt(t, 1)+"</td>");
             out.println("<td>"+ tabla.getValueAt(t, 2)+"</td>");
             out.println("<td>"+ tabla.getValueAt(t, 3)+"</td>");
             out.println("<td>"+ tabla.getValueAt(t, 4)+"</td>");
             out.println("<td>"+ tabla.getValueAt(t, 5)+"</td>");
             out.println("<td>"+ tabla.getValueAt(t, 6)+"</td>");
             out.println("</tr>");
         }
        
                    %>
                </tbody>
            </table>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modalCliente" onclick="limpiar()">Nuevo Cliente</button>
        </div>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script type="text/javascript">

                    function limpiar() {
                        $("#txtId").val(0);
                        $("#txtNit").val('');
                        $("#txtNombres").val('');
                        $("#txtApellidos").val('');
                        $("#txtDireccion").val('');
                        $("#txtTelefono").val('');
                        $("#txtFechaNacimiento").val('');
                    }

                    $('#tblClientes').on('click', 'tr td', function (evt) {
                        var target, id, nit, nombres, apellidos, direccion, telefono, nacimiento;
                        target = $(event.target);
                        id = target.parent().data('id');
                        codigo = target.parent("tr").find("td").eq(0).html();
                        nombres = target.parent("tr").find("td").eq(1).html();
                        apellidos = target.parent("tr").find("td").eq(2).html();
                        direccion = target.parent("tr").find("td").eq(3).html();
                        telefono = target.parent("tr").find("td").eq(4).html();
                        nacimiento = target.parent("tr").find("td").eq(5).html();


                        $("#txtId").val(id);
                        $("#txtNit").val(codigo);
                        $("#txtNombres").val(nombres);
                        $("#txtApellidos").val(apellidos);
                        $("#txtDireccion").val(direccion);
                        $("#txtTelefono").val(telefono);
                        $("#txtFechaNacimiento").val(nacimiento);
                        $("#modalCliente").modal('show');
                    });
        </script>
    </body>
</html>
