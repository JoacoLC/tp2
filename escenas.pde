byte        escena        = 0;
short       timer_escena  = -1;
float       movimiento    = 1;

final short timer_razon   = 150;
final short timer_txtgrad = 50;

/*
  if (timer_escena < 0) {
    timer_escena = timer_ini;
  }
  else if (timer_escena > 0) {
    timer_escena--;
  }
  else {
    timer_escena--;
    escena++;
  }
*/ // Inicialmente esto iba a ser una serie de funciones, pero el performance hit
   // de todas las llamadas a las funciones fue tan espantoso que lo retiré.
   // Terminé dejando el patrón acá, listo para copiar y pegar.
   
   //    Adéndum: Al final, el problema era que estaba usando software rendering.
   //    El overhead de llamar funciones no tenía nada que ver. Creo.
   
   // Si pudiéramos usar máquinas de estado habría hecho otra cosa, obviamente.
   // Aunque a decir verdad, todavía no sé cómo implementarlas de manera limpia
   // sin recurrir a la programación orientada a obj*tos, con la cual ya tuve
   // mi pelea y divorcio hace poco. No es que Processing permita punteros a
   // funciones tampoco... o punteros en general.

void cambiar_txt(String str){
    txt_char     = str.toCharArray();
    txt_str      = "";
    txt_indice   = 0;
}
