<%-- 
    Document   : tabela-price.jsp
    Created on : 29/08/2019, 00:22:18
    Author     : Marlon
--%>

<%@page import="java.text.DecimalFormat"%>
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
        <div class="row">
            <div class="container">
                <h2>TABELA PRICE - Sistema de amortização crescente</h2>
            </div>
        </div>
        <%if(request.getParameter("submit") == null){%>
            <div class="row">
                <div class="container">
                    <form>
                        <div class="form-group">
                            <label for="valor">Valor inicial</label>
                            <input type="text" name="valor" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="taxa">Taxa de Juros</label>
                            <input type="text" name="taxa" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <label for="parcelas">Parcelas</label>
                            <input type="text" name="parcelas" class="form-control"/>
                        </div>
                        <input type="submit" name="submit" value="Calcular" class="btn btn-primary">
                    </form>
                </div>
            </div>
        <%} else if(request.getParameter("submit") != null){
            try{
                double pv = Double.parseDouble(request.getParameter("valor"));
                String taxa = request.getParameter("taxa");
                double i = Double.parseDouble(taxa)/100;
                int n = Integer.parseInt(request.getParameter("parcelas"));
                double potencia = Math.pow((1 + i), n);
                double pmt = pv / ((potencia - 1) / (potencia * i));
                DecimalFormat real = new DecimalFormat("R$ #0.00");
                double saldoDevedor = pv;
        %>
                <div class="row">
                    <div class="container">
                        <table class="table table-striped text-center">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Parcela</th>
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
                                    <th><%=real.format(pv)%></th>
                                </tr>
                                <%for(int index = 1; index <= n; index++){
                                    double j = saldoDevedor * i;
                                    double a = pmt - j;
                                    saldoDevedor -= a;
                                %>
                                    <tr>
                                        <th scope="row"><%=index%></th>
                                        <th><%=real.format(pmt)%></th>
                                        <th><%=real.format(a)%></th>
                                        <th><%=real.format(j)%></th>
                                        <th><%=real.format(saldoDevedor)%></th>
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