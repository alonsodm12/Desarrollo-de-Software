
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JPanel.java to edit this template
 */
package Ejercicio4;

/**
 *
 * @author jaime
 */
import java.awt.Color;
import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
public class Salpicadero extends javax.swing.JPanel {

   
    private double velocidad_angular=30;
    private double velocidad_lineal=0;
    private double distancia_recorrida=0;
    private double distancia_r=0;
    private double distancia_actual=0;
    private double revoluciones=1;
    private EstadoMotor estadoMotor = EstadoMotor.APAGADO;
    CadenaFiltros cadenaF=new CadenaFiltros(this);
    


    FiltroCalcularVelocidad filtro=new FiltroCalcularVelocidad(15);
    FiltroRepercutirRozamiento filtroF=new FiltroRepercutirRozamiento();
    
    public Salpicadero(){
                        
        initComponents();
        setVisible(true);
                
        // Configurar los listeners de los botones
        Encender.addActionListener((ActionEvent e) -> {
            toggleEncender(); 
        });
        Acelerar.addActionListener((ActionEvent e) -> {
            toggleAcelerar(); 
        });

        Frenar.addActionListener((ActionEvent e) -> {
            toggleFrenar(); 
        });
        
        
        Encender.setForeground(Color.GREEN);
        Acelerar.setForeground(Color.GREEN);
        Frenar.setForeground(Color.RED);
        
        Encender.setBackground(Color.WHITE);
        Acelerar.setBackground(Color.WHITE);
        Frenar.setBackground(Color.WHITE);
        
        Frenar.setEnabled(false);
        Acelerar.setEnabled(false);

    }
    public double ejecutar(double revoluciones, EstadoMotor estadoMotor){
                
        if (estadoMotor == EstadoMotor.ENCENDIDO)
            velocidad_lineal = 2 * Math.PI * 0.15 * revoluciones * (60.00 / 1000.00);
            velocidad_angular = revoluciones;
            //suponiendo que el tiempo es 10 segundos
            double tiempo=10.00/3600.00;
            distancia_recorrida = velocidad_lineal * tiempo; 
            
            
        
            actualizarIndicadores(velocidad_lineal, revoluciones, distancia_recorrida, distancia_recorrida);

        return distancia_recorrida ;

    }

    private void toggleEncender() {
        if (estadoMotor == EstadoMotor.APAGADO) {
            estadoMotor = EstadoMotor.ENCENDIDO;
            Estado.setText(String.valueOf( estadoMotor));
            Encender.setText("Apagar");
            revoluciones=200;
            Frenar.setEnabled(true);
            Acelerar.setEnabled(true);
            Encender.setForeground(Color.RED);
        } else {
            estadoMotor = EstadoMotor.APAGADO;
            Estado.setText(String.valueOf( estadoMotor));
            Encender.setText("Encender");
            Frenar.setEnabled(false);
            Acelerar.setEnabled(false);
            Encender.setForeground(Color.GREEN);
            revoluciones=0;
            velocidad_lineal=0;
            distancia_actual=0;
        }
        actualizarIndicadores(velocidad_lineal,revoluciones,distancia_r,distancia_actual);

    }

    private void toggleAcelerar() {
        if (estadoMotor == EstadoMotor.ENCENDIDO) {
            estadoMotor = EstadoMotor.ACELERANDO;
            Estado.setText(String.valueOf( estadoMotor));
            Frenar.setEnabled(false);
            Encender.setEnabled(false);
            Acelerar.setText("Soltar acelerador");
            Acelerar.setForeground(Color.BLACK); 
            revoluciones=filtro.ejecutar(revoluciones, estadoMotor);
            revoluciones=filtroF.ejecutar(revoluciones, estadoMotor);
            double distancia=ejecutar(revoluciones, estadoMotor);
            cadenaF.ejecutar(revoluciones, estadoMotor);
            distancia_actual+=distancia;
            distancia_r+=distancia;
            velocidad_lineal+=2*Math.PI*0.15*revoluciones*(60.00/1000.00);         
        } else {
            estadoMotor = EstadoMotor.ENCENDIDO;
            Estado.setText(String.valueOf( estadoMotor));
            Acelerar.setText("Acelerar");
            Frenar.setEnabled(true);
            Encender.setEnabled(true);
            Acelerar.setForeground(Color.GREEN); 
        }  
        if(velocidad_lineal>400)
            velocidad_lineal=400;
        actualizarIndicadores(velocidad_lineal,revoluciones,distancia_r,distancia_actual);
    }

    private void toggleFrenar() {
        if (estadoMotor == EstadoMotor.ENCENDIDO) {
            estadoMotor = EstadoMotor.FRENANDO;
            Estado.setText(String.valueOf( estadoMotor));
            Acelerar.setEnabled(false);
            Encender.setEnabled(false);
            Frenar.setText("Soltar freno");
            Frenar.setForeground(Color.BLACK);
            cadenaF.ejecutar(revoluciones, estadoMotor);
            revoluciones=filtro.ejecutar(revoluciones, estadoMotor);
            revoluciones=filtroF.ejecutar(revoluciones, estadoMotor);
            double distancia=ejecutar(revoluciones, estadoMotor);
            distancia_actual+=distancia;
            distancia_r+=distancia;
            velocidad_lineal-=2*Math.PI*0.15*revoluciones*(60.00/1000.00);
        } else {
            estadoMotor = EstadoMotor.ENCENDIDO;
            Estado.setText(String.valueOf( estadoMotor));
            Frenar.setText("Frenar");
            Acelerar.setEnabled(true);
            Encender.setEnabled(true);
            Frenar.setForeground(Color.RED);               
        }  
        if(velocidad_lineal<0)
            velocidad_lineal=0;
        actualizarIndicadores(velocidad_lineal,revoluciones,distancia_r,distancia_actual);
    }

    
    // Método para actualizar los indicadores del salpicadero
    public void actualizarIndicadores(double velocidad, double revoluciones, double distanciaT,double distanciaR) {
        Velocidad.setText(String.valueOf(velocidad));
        Revoluciones.setText(String.valueOf(revoluciones));
        ContadorT.setText(String.valueOf(distanciaT));
        contadorR.setText(String.valueOf(distanciaR));
    }


    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        Estado = new javax.swing.JLabel();
        Acelerar = new javax.swing.JToggleButton();
        Frenar = new javax.swing.JToggleButton();
        Encender = new javax.swing.JToggleButton();
        Mandos = new javax.swing.JLabel();
        Salpicadero = new javax.swing.JLabel();
        Velocimetro = new javax.swing.JLabel();
        contador = new javax.swing.JLabel();
        Cuentakm = new javax.swing.JLabel();
        cuentarevoluciones = new javax.swing.JLabel();
        Km1 = new javax.swing.JLabel();
        Contadorvel = new javax.swing.JLabel();
        RPM = new javax.swing.JLabel();
        Velocidad = new java.awt.TextField();
        contadorR = new java.awt.TextField();
        ContadorT = new java.awt.TextField();
        Revoluciones = new java.awt.TextField();

        Estado.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        Estado.setLabelFor(Estado);
        Estado.setText("Estado");
        Estado.setOpaque(true);

        Acelerar.setText("Acelerar");
        Acelerar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                AcelerarActionPerformed(evt);
            }
        });

        Frenar.setText("Frenar");

        Encender.setText("Encender");

        Mandos.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        Mandos.setText("Mandos");

        Salpicadero.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        Salpicadero.setText("Salpicadero");

        Velocimetro.setText("Velocimetro");

        contador.setText("contador reciente");

        Cuentakm.setText("Cuentakilómetros");

        cuentarevoluciones.setText("Cuentarrevoluciones");

        Km1.setText("Km/h");

        Contadorvel.setText("contador total");

        RPM.setText("RPM");

        Velocidad.setText("textField1");
        Velocidad.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                VelocidadActionPerformed(evt);
            }
        });

        contadorR.setText("textField1");
        contadorR.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                contadorRActionPerformed(evt);
            }
        });

        ContadorT.setText("textField1");
        ContadorT.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ContadorTActionPerformed(evt);
            }
        });

        Revoluciones.setText("textField1");
        Revoluciones.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                RevolucionesActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(this);
        this.setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(16, 16, 16)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(Cuentakm)
                            .addComponent(Velocimetro))
                        .addGap(0, 0, Short.MAX_VALUE))
                    .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                        .addGap(0, 0, Short.MAX_VALUE)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                            .addComponent(Mandos, javax.swing.GroupLayout.DEFAULT_SIZE, 166, Short.MAX_VALUE)
                            .addComponent(Estado, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                        .addGap(185, 185, 185))
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                            .addComponent(RPM)
                            .addComponent(Km1)
                            .addComponent(Contadorvel)
                            .addComponent(cuentarevoluciones)
                            .addComponent(contador)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(Encender, javax.swing.GroupLayout.PREFERRED_SIZE, 116, javax.swing.GroupLayout.PREFERRED_SIZE)
                                .addGap(18, 18, 18)))
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addGap(68, 68, 68)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(contadorR, javax.swing.GroupLayout.PREFERRED_SIZE, 166, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(Velocidad, javax.swing.GroupLayout.PREFERRED_SIZE, 166, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(ContadorT, javax.swing.GroupLayout.PREFERRED_SIZE, 166, javax.swing.GroupLayout.PREFERRED_SIZE)
                                    .addComponent(Revoluciones, javax.swing.GroupLayout.PREFERRED_SIZE, 166, javax.swing.GroupLayout.PREFERRED_SIZE))
                                .addContainerGap())
                            .addGroup(layout.createSequentialGroup()
                                .addGap(9, 9, 9)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addGroup(layout.createSequentialGroup()
                                        .addComponent(Salpicadero, javax.swing.GroupLayout.PREFERRED_SIZE, 146, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(0, 0, Short.MAX_VALUE))
                                    .addGroup(layout.createSequentialGroup()
                                        .addGap(0, 4, Short.MAX_VALUE)
                                        .addComponent(Acelerar, javax.swing.GroupLayout.PREFERRED_SIZE, 117, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(43, 43, 43)
                                        .addComponent(Frenar, javax.swing.GroupLayout.PREFERRED_SIZE, 116, javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addGap(26, 26, 26))))))))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addGap(24, 24, 24)
                .addComponent(Mandos, javax.swing.GroupLayout.PREFERRED_SIZE, 32, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addComponent(Estado, javax.swing.GroupLayout.PREFERRED_SIZE, 33, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(11, 11, 11)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(Encender, javax.swing.GroupLayout.PREFERRED_SIZE, 44, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Acelerar, javax.swing.GroupLayout.PREFERRED_SIZE, 47, javax.swing.GroupLayout.PREFERRED_SIZE)
                    .addComponent(Frenar, javax.swing.GroupLayout.PREFERRED_SIZE, 47, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(Salpicadero, javax.swing.GroupLayout.PREFERRED_SIZE, 51, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(8, 8, 8)
                .addComponent(Velocimetro)
                .addGap(42, 42, 42)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(Km1)
                    .addComponent(Velocidad, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(54, 54, 54)
                .addComponent(Cuentakm)
                .addGap(55, 55, 55)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(contador)
                    .addComponent(contadorR, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(64, 64, 64)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(Contadorvel)
                        .addGap(52, 52, 52)
                        .addComponent(cuentarevoluciones))
                    .addComponent(ContadorT, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 28, Short.MAX_VALUE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(RPM)
                    .addComponent(Revoluciones, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(94, 94, 94))
        );
    }// </editor-fold>//GEN-END:initComponents

    private void VelocidadActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_VelocidadActionPerformed
    }//GEN-LAST:event_VelocidadActionPerformed

    private void contadorRActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_contadorRActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_contadorRActionPerformed

    private void ContadorTActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ContadorTActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_ContadorTActionPerformed

    private void RevolucionesActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_RevolucionesActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_RevolucionesActionPerformed

    private void AcelerarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_AcelerarActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_AcelerarActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JToggleButton Acelerar;
    private java.awt.TextField ContadorT;
    private javax.swing.JLabel Contadorvel;
    private javax.swing.JLabel Cuentakm;
    private javax.swing.JToggleButton Encender;
    public javax.swing.JLabel Estado;
    private javax.swing.JToggleButton Frenar;
    private javax.swing.JLabel Km1;
    private javax.swing.JLabel Mandos;
    private javax.swing.JLabel RPM;
    private java.awt.TextField Revoluciones;
    private javax.swing.JLabel Salpicadero;
    private java.awt.TextField Velocidad;
    private javax.swing.JLabel Velocimetro;
    private javax.swing.JLabel contador;
    private java.awt.TextField contadorR;
    private javax.swing.JLabel cuentarevoluciones;
    // End of variables declaration//GEN-END:variables
}
