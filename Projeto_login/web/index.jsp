
<%@page import="java.sql.*"%>
<%@page import="config.Conexao"%>
<%@page import="com.mysql.jdbc.Driver"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>EXEMPLO</title>
        <link href="css/estilo.css" rel="stylesheet">
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
           
    </head>
             <%     
                Statement st = null;
                ResultSet rs = null;
             %>
    <body>

         <div id="login">
        <h3 class="text-center text-white pt-5">Login</h3>
        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="" method="post">
                            <h3 class="text-center text-info">Login</h3>
                            <div class="form-group">
                                <label for="username" class="text-info">Email:</label><br>
                                <input type="text" name="usuario" id="username" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info">Senha:</label><br>
                                <input type="password" name="senha" id="password" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="remember-me" class="text-info"><span>Remember me</span> <span><input id="remember-me" name="remember-me" type="checkbox"></span></label><br>
                                <input type="submit" name="submit" class="btn btn-info btn-md" value="Login">
                            </div>
                            <div id="register-link" class="text-right">
                                <a href="#" class="text-info">Register here</a>
                            </div>
                        </form>
                         
                    </div>
                    
                        <%
                          String user = request.getParameter("usuario"); 
                          String pass = request.getParameter("senha"); 
                          String nomeUsuario = "";
                          String usuario = "";
                          String senha = "";
                          
                          int i = 0;


                          try{
                          st = new Conexao().conectar().createStatement();
                          rs = st.executeQuery("SELECT * FROM usuarios WHERE email = '"+user+"' and senha= '"+pass+"'");
                          while (rs.next()){
                             // out.println(rs.getString(2));
                             usuario = rs.getString(3);
                             senha = rs.getString(4);
                             nomeUsuario = rs.getString(2);
                             rs.last();
                             i = rs.getRow();
                          }
                          } catch (Exception e){
                              out.println(e);
                          }
                          
                          if((user == null) || (pass == null)){
                              out.println("Preencha os dados");
                          } else{
                              if(i>0){
                                  session.setAttribute("nomeUsuario", nomeUsuario);
                                  response.sendRedirect("usuarios.jsp");
                              }
                          }
                        %>
                </div>
            </div>
        </div>
    </div>    
    </body>
</html>
