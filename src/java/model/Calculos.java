package model;

import java.text.DecimalFormat;

public class Calculos {

    double pmt = 0;

    public Double Price(double valor, double prestacao, double juros) {
        double d1 = Math.pow((1 + (juros / 100)), prestacao);
        return valor / ((d1 - 1) / (d1 * (juros / 100)));
    }

    public Double Americana(double valor, double juros) {
        return valor * (juros / 100);
    }

    public Double Constante(double valor, double prestacao) {
        return valor / prestacao;
    }

    public String createTable(double valor, double prestacao, double juros, double pmt, String option) {
        DecimalFormat df = new DecimalFormat("#,##0.00");

        double jurosInicial = 0;
        double amortizacao = 0;
        double saldo = valor;

        //somatorias
        double jurosSoma = 0;
        double amortizacaoSoma = 0;
        double prestacaoSoma = 0;

        String table
                = "<table class='table table-bordered container-fluid' style='width: 800px;'>"
                + " <tr>"
                + "     <th>Nº</th>"
                + "     <th>Prestação</th>"
                + "     <th>Juros</th>"
                + "     <th>Amortização</th>"
                + "     <th>Saldo Devedor</th>"
                + " </tr>"
                + " <tr>"
                + "     <td>" + 0 + "</td>"
                + "     <td>" + df.format(0) + "</td>"
                + "     <td>" + df.format(jurosInicial) + "</td>"
                + "     <td>" + df.format(amortizacao) + "</td>"
                + "     <td>" + df.format(saldo) + "</td>"
                + " </tr>";

        if (option == "const") {
            amortizacao = pmt;
        }
        for (int j = 1; j <= prestacao; j++) {
            if (option == "americ" && j == prestacao) {
                pmt = saldo + pmt;
            }

            jurosInicial = (saldo * (juros / 100));

            if (option == "const") {
                pmt = amortizacao + jurosInicial;
            }

            prestacaoSoma = prestacaoSoma + pmt;
            jurosSoma = jurosSoma + jurosInicial;
            if (option == "americ" && j == prestacao) {
                amortizacao = saldo;
            } else if (option == "price") {
                amortizacao = pmt - jurosInicial;
            }
            amortizacaoSoma = amortizacaoSoma + amortizacao;
            saldo = saldo - amortizacao;

            if (saldo < 0) {
                saldo = 0;
            }

            table = table
                    + "<tr>"
                    + "<td>" + j + "</td>"
                    + "<td>" + df.format(pmt) + "</td>"
                    + "<td>" + df.format(jurosInicial) + "</td>"
                    + "<td>" + df.format(amortizacao) + "</td>"
                    + "<td>" + df.format(saldo) + "</td>"
                    + "</tr>";
        }
        table = table + "<tr>"
                + "<td>TOTAL</td>"
                + "<td>" + df.format(prestacaoSoma) + "</td>"
                + "<td>" + df.format(jurosSoma) + "</td>"
                + "<td>" + df.format(amortizacaoSoma) + "</td>"
                + "<td>" + df.format(saldo) + "</td>"
                + "</tr>" + "</table>";
        return table;
    }
}
