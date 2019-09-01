<%-- 
    Document   : amortizacao-constante.jsp
    Created on : 29/08/2019, 00:21:18
    Author     : Tales
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Constante - Trabalho de POO</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body style="text-align: center;border: 1px solid #ccc; border-radius: 8px; width: 70%; margin: 30px auto 0">
<% 
if (request.getParameter("enviar")==null) {
%>
        <h2>Formulario</h2>
        <form>
            <div class="form-group">
              <input type="text" name="vf" class="form-control" placeholder="Valor financiado" style="width:200px;margin: 10px auto">
              <input type="text" name="nm" class="form-control" placeholder="Número de meses" style="width:200px;margin: 10px auto">
              <input type="text" name="tj" class="form-control" placeholder="Taxa de juros" style="width:200px;margin: 10px auto">        
            </div>
            <button name="enviar" class="btn btn-primary" style="width:200px;margin: 10px auto 30px">Enviar</button>
        </form>
<%
} else {
    double vf = Double.parseDouble(request.getParameter("vf"));
    int nm = Integer.parseInt(request.getParameter("nm"));
    double tj = Double.parseDouble(request.getParameter("tj"));
    double amortiza = vf/nm;
%>
        <h2>Amortização</h2>

        <p style="margin:0 0 20px 30px;text-align:left;"><b>Amortização:</b> <%=String.format("%.2f", vf)%>/<%=nm%> = <b><%= String.format("%.2f", amortiza) %></b></p>
        <p style="margin:0 0 10px 30px;text-align:left;"><b>1<sup>a</sup> parcela:</b> <%= String.format("%.2f", amortiza) %> + <%=tj%>% x <%= String.format("%.2f", vf) %> = <b><%= String.format("%.2f", amortiza + tj/100 * vf) %></b></p>
<% 
    if(nm>1){
        for(int i=2;i<=nm;i++){
%>
        <p style="margin:0 0 10px 30px;text-align:left;"><b><%=i%><sup>a</sup> parcela:</b> <%= String.format("%.2f", amortiza) %> + <%=tj%>% x (<%= String.format("%.2f", vf) %> - <%=i-1%> x <%= String.format("%.2f", amortiza) %>) = <b><%= String.format("%.2f", amortiza + tj/100 * (vf - (i-1) * amortiza))%></b></p>
<%
        }
    }
}
%>


    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
