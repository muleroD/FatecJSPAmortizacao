<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Tabela Price</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h1>Tabela Price</h1>
        <%@include file="WEB-INF/jspf/menu.jspf" %>

        <h2>Dados do financiamento</h2>

        <form>
            <div class="form-group">
                <label for="valorFinan">Valor financiado</label>
                <input type="text" class="form-control" id="exampleInputEmail1">
            </div>

            <div class="form-group">
                <label for="taxa">Taxas de abertura crédito + IOF</label>
                <input type="text" class="form-control" name="taxa">
            </div>

            <div class="form-group">
                <label for="numPrestacoes">Número de Prestações</label>
                <input type="text" class="form-control" name="numPrestacoes">
            </div>

            <div class="form-group">
                <label for="taxaCET">Taxa de juros CET</label>
                <input type="text" class="form-control" name="taxaCET">
            </div>

            <button type="submit" class="btn btn-primary" name="calcular">Calcular</button>
        </form>

        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
