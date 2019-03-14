<%-- 
    Document   : home
    Created on : 13/03/2019, 15:58:35
    Author     : Mulero
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Home</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>Home</h1>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <br>

        <h3>Integrantes</h3>
        <ul>
            <li>Alex</li>
            <li>Isabelly</li>
            <li>Richard</li>
        </ul>

        <br>

        <h3>Sobre aplicação</h3>
        <p>A seguinte aplicação é responsavel por calcular amortizações e também gerar a tabela price</p>

        <p>Sistema de Amortização Constante (SAC) é uma forma de amortização de um empréstimo por 
            prestações que incluem os juros, amortizando assim partes iguais do valor total do empréstimo.</p>

        <p>O Sistema de Amortização Americano é uma forma de pagamento de empréstimos que se caracteriza pelo pagamento apenas dos juros da dívida, 
            deixando o valor da dívida constante, que pode ser paga em apenas um único pagamento.</p>

        <p>Tabela Price, também chamado de sistema francês de amortização, 
            é um método usado em amortização de empréstimo cuja principal característica 
            é apresentar prestações (ou parcelas) iguais.</p>

        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
