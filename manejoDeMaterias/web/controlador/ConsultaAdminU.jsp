<%-- 
    Document   : ConsultaMaestro
    Created on : 16-oct-2020, 8:59:59
    Author     : Angeles Gaona
--%>


<!-- Los import -->
<%@ page language="java" %>
<%@ page import = "java.sql.Connection"%>
<%@ page import = "java.sql.DriverManager"%> 
<%@ page import = "java.sql.ResultSet"%> 
<%@ page import = "java.sql.Statement"%> 
<html>
    <head>
       <meta charset="utf-8">
<link href="prueba.css" rel="stylesheet" type="text/css">
<title>Documento sin título</title>

</head>
<body>
<h1>MATERIAS</h1>
<table width="25%">
    <tr>
        <td colspan="2" align="center">
          <form action="crearUsuario.html" method="get">
          <input type="submit" name="button" id="button" value=" Insertar Usuario ">
          </form>
      
      </td>
<td colspan="2" align="center">
          <form action="editarU.html" method="get">
          <input type="submit" name="button" id="button" value=" Editar Usuario ">
          </form>
      
      </td>
      
      <td colspan="2" align="center">
          <form action="borrarU.html" method="get">
          <input type="submit" name="button" id="button" value=" Borrar Usuario ">
          </form>
      
      </td>
       <td colspan="2" align="center">
          <form action="ConsultaAdminS.jsp" method="get">
          <input type="submit" name="button" id="button" value=" Revisar Materias ">
          </form>
      
      </td>
      <td colspan="2" align="center">
          <form action="tipoDocente.html" method="get">
          <input type="submit" name="button" id="button" value=" Salir ">
          </form>
      
      </td>
    </tr>
      
<%
try
{
   // Conexion con bd
  Class.forName("com.mysql.jdbc.Driver");
   java.sql.Connection miConexion=java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/docentes","root","");
            if (!miConexion.isClosed())
   {
      // La consulta
      Statement st = miConexion.createStatement();
      ResultSet rs = st.executeQuery("SELECT * FROM usuarios");
 

      // Ponemos los resultados en un table de html
      out.println("<table border=\"1\">"
              +"<tr><td><label> MATRICULA </label></td>"
              +"<td><label> NOMBRE </label></td>"
              +"<td><label> CORREO </label></td>"
              +"<td><label> TELEFONO </label></td>"
              +"<td><label> DEPARTAMENTO </label></td></tr>");
      while (rs.next())
      {
         out.println("<tr>");
         out.println("<td>"+rs.getObject("Matricula")+"</td>");
         out.println("<td>"+rs.getObject("Nombre")+"</td>");
         out.println("<td>"+rs.getObject("Correo")+"</td>");
         out.println("<td>"+rs.getObject("Telefono")+"</td>");
         out.println("<td>"+rs.getObject("Departamento")+"</td>");
         out.println("</tr>");
      }
      out.println("</table>");

      // cierre de la conexion
      miConexion.close();
   }
   else
      // Error en la conexion
      out.println("fallo");
}
catch (Exception e)
{
   // Error en algun momento.
   out.println("Excepcion "+e);
   e.printStackTrace();
}
%>

</table>
</body>
</html>