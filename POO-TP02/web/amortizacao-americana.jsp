<%-- 
    Document   : amortizacao-americana.jsp
    Created on : 29/08/2019, 00:21:41
    Author     : Camila
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf"%>
        <%if(request.getParameter("enviar") == null){%>
            <div class="row">
                <div class="container">
                    <form class="col-md-6">
                        <div class="form-group">
                            <label for="fin">Financiamento</label>
                            <input type="text" name="fin" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="i">Taxa de Juros</label>
                            <input type="text" name="i" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="n">Prazo</label>
                            <input type="text" name="n" class="form-control"/>
                        </div>
                        <input type="submit" name="enviar" value="Calcular" class="btn btn-primary">
                    </form>
                </div>
            </div>
        <%} else if(request.getParameter("enviar") != null){
            try{
                double sd = Double.parseDouble(request.getParameter("fin"));
                double i = Double.parseDouble(request.getParameter("i"))/100;
                int n = Integer.parseInt(request.getParameter("n"));
                double j = sd * i;
                double mensalidade = j;
        %>
                <div class="row">
                    <div class="container">
                        <table class="table table-striped text-center col-md-6">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Mês</th>
                                    <th scope="col">Prestação</th>
                                    <th scope="col">Amortização</th>
                                    <th scope="col">Juros</th>
                                    <th scope="col">Saldo Devedor</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">0</th>
                                    <th>-</th>
                                    <th>-</th>
                                    <th>-</th>
                                    <th><%=sd%></th>
                                </tr>
                                <%for(int cont = 1; cont <= n; cont++){
                                    String amortizacao = "-";
                                    if(cont == n){
                                        amortizacao = Double.toString(sd);
                                        mensalidade += sd;
                                        sd -= sd;
                                    }
                                %>
                                    <tr>
                                        <th scope="row"><%=cont%></th>
                                        <th>R$ <%=mensalidade%></th>
                                        <th>R$ <%=amortizacao%></th>
                                        <th>R$ <%=j%></th>
                                        <th>R$ <%=sd%></th>
                                    </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
            <%} catch(Exception e){%>
                <div class="row">
                    <div class="container">
                        <div class='jumbotron'>
                            <h1 class='display-4'>Ocorreu um erro inesperado!</h1>
                            <p class='lead'>
                                <%=e.getMessage()%>
                            </p>
                            <p class='lead'>
                                <a class='btn btn-primary btn-lg' href='tabela-price.jsp' role='button'>Voltar</a>
                            </p>
                        </div>
                    </div>
                </div>
            <%}
        }%>
        
        <%@include file="WEB-INF/jspf/footer.jspf" %>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>