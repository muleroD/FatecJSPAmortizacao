/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.text.DecimalFormat;

/**
 *
 * @author alexander
 */
public class Calculos {
    double pmt = 0;
    public Double CalcPrestPrice(double vr, double np, double jr){
        double d1 = Math.pow((1+(jr/100)),np);
        
        pmt = vr / ((d1-1) / (d1*(jr/100)) );
        
        return pmt;
    }
    public Double CalcPrestAmeric(double vr, double jr){
        pmt = vr * (jr/100);
        
        return pmt;
    }
    public Double CalcPrestConst(double vr, double np){
        pmt = vr / np;
        
        return pmt;
    }
    public String createTable(double vr, double np, double jr, double pmt, String a){
        DecimalFormat df = new DecimalFormat("#,##0.00");
        double juros = 0;
        double amortizacao = 0;
        double saldo = vr;
        
        //somatorias
        double jurosSoma = 0;
        double amortizacaoSoma = 0;
        double prestacaoSoma = 0;
        
        String table = "<table class='table table-bordered container-fluid' style='width: 800px;'><tr>"
                + "<th>Nº</th>"
                + "<th>Prestação</th>"
                + "<th>Juros</th>"
                + "<th>Amortização</th>"
                + "<th>Saldo Devedor</th>"
                + "<tr>"
                + "<tr>"
                + "<td>"+0+"</td>"
                + "<td>"+df.format(0)+"</td>"
                + "<td>"+df.format(juros)+"</td>"
                + "<td>"+df.format(amortizacao)+"</td>"
                + "<td>"+df.format(saldo)+"</td>"
                + "</tr>";
        if (a=="const")
            amortizacao = pmt;
        for(int j = 1; j <= np; j++)
        {
            if (a=="americ" && j==np)
                pmt = saldo + pmt;
            
            juros = (saldo*(jr/100));
            
            if (a=="const")
                pmt = amortizacao+juros;
            
            prestacaoSoma = prestacaoSoma + pmt;
            jurosSoma = jurosSoma + juros;
            if (a=="americ" && j==np)
                amortizacao=saldo;
            else if (a=="price")
                amortizacao = pmt - juros;
            amortizacaoSoma = amortizacaoSoma + amortizacao;
            saldo = saldo - amortizacao;
            
            if (saldo<0)
                saldo=0;
            table = table + "<tr>"
                    + "<td>"+j+"</td>"
                    + "<td>"+df.format(pmt)+"</td>"
                    + "<td>"+df.format(juros)+"</td>"
                    + "<td>"+df.format(amortizacao)+"</td>"
                    + "<td>"+df.format(saldo)+"</td>"
                    + "</tr>";
        }
        table = table +"<tr>"
                    + "<td>TOTAL</td>"
                    + "<td>"+df.format(prestacaoSoma)+"</td>"
                    + "<td>"+df.format(jurosSoma)+"</td>"
                    + "<td>"+df.format(amortizacaoSoma)+"</td>"
                    + "<td>"+df.format(saldo)+"</td>"
                    + "</tr>" +"</table>";
        return table;
    }
}
