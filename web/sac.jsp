<%@page import="java.text.DecimalFormat" %>
<%@page import="model.Calculos" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Amortização Constante</title>
    </head>
    <body>
        <!--Adiciona o header a pagina.-->
        <%@include file="WEB-INF/jspf/header.jspf" %>

        <h1>Sistema de Amortização Constante</h1>

        <!--Adiciona o menu a pagina.-->
        <%@include file="WEB-INF/jspf/menu.jspf" %>

        <!--Formulário para realizar o cálculo da amortização americana.-->
        <form class="container-fluid format_tabela format_form">

            <div class="form-group">
                <label>Valor</label>
                <div class="input-group">
                    <input class="form-control" type="number" name="valor"/>
                </div>
            </div>

            <div class="form-group">
                <label>Número de prestações</label>
                <div class="input-group">
                    <input class="form-control" type="number" name="prestacao"/>
                </div>      
            </div>

            <div class="form-group">
                <label>Taxa de Juros (% ao mês)</label>
                <div class="input-group">
                    <input class="form-control" type="text" name="juros"/>
                </div>
            </div>

            <div class="form-group">
                <input class="btn btn-primary" type="submit"  name="geraTabela" value="Calcular"/>
            </div>

        </form>

        <%
            Calculos amortizacao = new Calculos();
            //Cria as variáveis com valores inicias igual a zero
            double valor = 0;
            double juros = 0;
            double prestacao = 0;

            //Converte os formatos de cada variável como Double passados pelos parâmentros do formulário.
            try {
                valor = Double.parseDouble(request.getParameter("valor"));
                juros = Double.parseDouble(request.getParameter("juros"));
                prestacao = Double.parseDouble(request.getParameter("prestacao"));

                if (request.getParameter("geraTabela") != null) {
        %>
        <div class="container-fluid format_tabela">
            <%      DecimalFormat dv = new DecimalFormat("#,##0.00");
                out.print("Valor da Prestação R$ " + dv.format(amortizacao.Constante(valor, juros)));
            %>
        </div>
        <%
                    out.print(amortizacao.createTable(valor, prestacao, juros, amortizacao.Constante(valor, juros), "const"));
                }

            } catch (Exception ex) {
                out.println("<h4 style='color: red'>" + ex + "</h4>");
            }

        %>

        <!--Adiciona o rodapé a pagina-->
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
