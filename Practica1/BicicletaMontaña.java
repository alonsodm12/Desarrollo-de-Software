//jaime
package Practica1;
import java.util.Random;

import Practica1.Bicicleta;

public class BicicletaMontaña extends Bicicleta{

    Random rand = new Random();

    //constructor
    BicicletaMontaña(){
        super();
    }

    @Override
    public Bicicleta crearBicicleta(){

        do{
        int iden=rand.nextInt(1000);//Limite de bicicletas
        boolean esta=false;
        Bicicleta bm=null;

        //Comprobar si esta en el array
        for(int i=0;i<bicicletas.length && !esta;i++){
            if(bicicletas.get(i)==iden)
                esta = true;
        }
        if(!esta)
        bm=new BicicletaMontaña(iden);

        }while(esta=false);

        return bm;
    }
    
}