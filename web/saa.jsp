<%-- 
    Document   : SAA
    Created on : 13/03/2019, 16:11:12
    Author     : Alexander
--%>
<%@page import="java.text.DecimalFormat" %>
<%@page import="Classes.Amortizacao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Amortização Americana</title>
    </head>
    <%
        Amortizacao saa = new Amortizacao();
        //Cria as variáveis com valores inicias igual a zero
        double vr = 0;
        double jr = 0;
        double np = 0;
        
        //Converte os formatos de cada variável como Double passados pelos parâmentros do formulário.
        try {
            vr = Double.parseDouble(request.getParameter("vr"));
            jr = Double.parseDouble(request.getParameter("jr"));
            np = Double.parseDouble(request.getParameter("np"));
        } catch (Exception ex) {

        }
    %>
     <body>
        <!--Adiciona o header a pagina.-->
        <%@include file="WEB-INF/jspf/header.jspf" %>
        
        <h1>Sistema de Amortização Americana</h1>
        
        <!--Adiciona o menu a pagina.-->
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <!--Formulário para realizar o cálculo da amortização americana.-->
        <form class="container-fluid format_tabela format_form">

                <div class="form-group form-horizontal">
                    <label class="col-sm-4 control-label" for="valor">Valor</label>
                    <div class="input-group">
                        <input class="form-control" type="number" name="vr" value=""  step="any"/>
                    </div>
                </div>

                <div class="form-group form-horizontal">
                    <label class="col-sm-4 control-label" for="prestacao">Número de prestações</label>
                    <div class="input-group">
                        <input class="form-control" type="number" name="np" value="" />
                    </div>      
                </div>

                <div class="form-group form-horizontal">
                    <label class="col-sm-4 control-label" for="juros">Taxa de Juros (% ao mês)</label>
                    <div class="input-group">
                        <input class="form-control" type="number" name="jr" value=""  step="any"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-4">
                        <input class="btn btn-primary" type="submit"  name="btnCalc" value="Calcular"/>
                    </div>
                </div>
            </form>
            
            <% 
                //Se os valores do form forem preenchidos, retorna calculados em uma tabela criada devidamente formatado.  
                if (request.getParameter("btnCalc") != null) { %>
                <div class="container-fluid format_tabela"><% DecimalFormat dv = new DecimalFormat("#,##0.00");
                out.print("Valor da Prestação R$ " + dv.format(saa.CalcPrestAmeric(vr, jr)));%></div>
                <%out.print(saa.createTable(vr, np, jr, saa.CalcPrestAmeric(vr, jr), "americ"));
            }%>
            
        <!--Adiciona o rodapé a pagina-->
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
