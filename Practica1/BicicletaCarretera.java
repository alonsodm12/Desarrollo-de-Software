//jaime
package Practica1;
import java.util.Random;

import java.util.Random;

import Practica1.Bicicleta;

public class BicicletaCarretera extends Bicicleta{

    Random rand = new Random();

    //constructor
    BicicletaCarretera(int identificador){
        super(identificador);
    }

    @Override
    public Bicicleta crearBicicleta(){
        boolean esta=false;
        Bicicleta bc=null;

        do{
        int iden=rand.nextInt(1000);//Limite de bicicletas
        
        //Comprobar si esta en el array
        for(int i=0;i<bicicletas.length && !esta;i++){
            if(bicicletas.get(i)==iden)
                esta = true;
        }
            if(!esta)
                bc=new BicicletaCarretera(iden);

        }while(esta=false);

        return bc;
    }
    
}