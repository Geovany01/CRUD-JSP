package modelo;

import java.awt.HeadlessException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

public class Cliente extends Persona {

    private String nit;
    Conexion nuevaConexion;

    public Cliente() {

    }

    public Cliente(String nit, int id, String nombres, String apellidos,
            String direccion, String telefono, String fechaNacimiento) {
        super(id, nombres, apellidos, direccion, telefono, fechaNacimiento);
        this.nit = nit;
    }

    public String getNit() {
        return nit;
    }

    public void setNit(String nit) {
        this.nit = nit;
    }

    public DefaultTableModel leer() {
        DefaultTableModel tabla = new DefaultTableModel();
        try {
            nuevaConexion = new Conexion();
            String query = "SELECT c.id_cliente as id,c.nit,c.nombres,c.apellidos,c.direccion,c.telefono,c.fecha_nacimiento FROM clientes as c;";
            nuevaConexion.abrirConexion();
            ResultSet consulta = nuevaConexion.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"id", "NIT", "Nombres", "Apellidos", "Direccion", "Telefono", "FNacimiento"};
            tabla.setColumnIdentifiers(encabezado);
            String datos[] = new String[7];
            while(consulta.next()) {
                datos[0] = consulta.getString("id");
            datos[1] = consulta.getString("nit");
            datos[2] = consulta.getString("nombres");
            datos[3] = consulta.getString("apellidos");
            datos[4] = consulta.getString("direccion");
            datos[5] = consulta.getString("telefono");
            datos[6] = consulta.getString("fecha_nacimiento");
                tabla.addRow(datos);
            }
            nuevaConexion.cerrarConexion();
        } catch(Exception ex) {
            System.out.println("Exception = " + ex.getMessage());
        }
        return tabla;
    }
    
    @Override
    public int agregar() {
        int retorno = 0;
        try {
            PreparedStatement parametro;
            String query;
            nuevaConexion = new Conexion();
            nuevaConexion.abrirConexion();
            query = "INSERT INTO clientes(nit, nombres, apellidos, direccion,"
                    + "telefono, fecha_nacimiento) VALUES(?,?,?,?,?,?);";
            parametro = (PreparedStatement) nuevaConexion.conexionBD.prepareStatement(query);
            parametro.setString(1, getNit());
            parametro.setString(2, getNombres());
            parametro.setString(3, getApellidos());
            parametro.setString(4, getDireccion());
            parametro.setString(5, getTelefono());
            parametro.setString(6, getFechaNacimiento());
            retorno = parametro.executeUpdate();
            nuevaConexion.cerrarConexion();
            /*JOptionPane.showMessageDialog(null, Integer.toString(exec) 
                    + " Registros Ingresados", "Mensaje", JOptionPane.INFORMATION_MESSAGE);*/

        } catch (HeadlessException | SQLException ex) {
            System.out.println("Error..." + ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }

    @Override
    public int modificar() {
        int retorno = 0;
        try {
            PreparedStatement parametro;
            String query;
            nuevaConexion = new Conexion();
            nuevaConexion.abrirConexion();
            query = "update clientes set nit=?, nombres=?, apellidos=?, direccion=?,"
                    + "telefono=?, fecha_nacimiento=? where id_cliente = ?;";
            parametro = (PreparedStatement) nuevaConexion.conexionBD.prepareStatement(query);
            parametro.setString(1, getNit());
            parametro.setString(2, getNombres());
            parametro.setString(3, getApellidos());
            parametro.setString(4, getDireccion());
            parametro.setString(5, getTelefono());
            parametro.setString(6, getFechaNacimiento());
            parametro.setInt(7, getId());
            retorno = parametro.executeUpdate();
            nuevaConexion.cerrarConexion();
            /*JOptionPane.showMessageDialog(null, Integer.toString(exec) 
                    + " Registros Ingresados", "Mensaje", JOptionPane.INFORMATION_MESSAGE);*/

        } catch (HeadlessException | SQLException ex) {
            System.out.println("Error..." + ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }
    
    @Override
    public int eliminar() {
        int retorno = 0;
        try {
            PreparedStatement parametro;
            String query;
            nuevaConexion = new Conexion();
            nuevaConexion.abrirConexion();
            query = "delete from clientes where id_cliente = ?;";
            parametro = (PreparedStatement) nuevaConexion.conexionBD.prepareStatement(query);
            parametro.setInt(1, getId());
            retorno = parametro.executeUpdate();
            nuevaConexion.cerrarConexion();
            /*JOptionPane.showMessageDialog(null, Integer.toString(exec) 
                    + " Registros Ingresados", "Mensaje", JOptionPane.INFORMATION_MESSAGE);*/

        } catch (HeadlessException | SQLException ex) {
            System.out.println("Error..." + ex.getMessage());
            retorno = 0;
        }
        return retorno;
    }
    
}
