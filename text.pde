//===========================
//---- V A R I A B L E S ----
//------------ Y ------------
//--- C O N S T A N T E S ---
//===========================

PFont       fnt;

char[]      txt_char;
String      txt_str       = "";
short       txt_indice    = 0;
final byte  txtiempo_max  = 1;
byte        txt_tiempo    = txtiempo_max;
boolean     txt_pausado   = false;

float       cajatxt_w     = 8;
float       cajatxt_h     = 8;

//===========================
//---------------------------
//---- F U N C I O N E S ----
//---------------------------
//===========================

boolean caja_txt(String txt, float txt_posx, float txt_posy, float txt_w, float txt_h){ // No es la función más elegante que he escrito.
  fill(0, 0, 0, 200);
  rect(txt_posx - 32, txt_posy - 32, cajatxt_w, cajatxt_h); // La caja siempre va a estar bien alineada con el texto.
  fill(255);
  if (cajatxt_w == txt_w + 32 && cajatxt_h == txt_h + 32){
    text(txt, txt_posx, txt_posy, txt_w, txt_h);
    return true;
  }
  
  if (cajatxt_w < txt_w + 32) cajatxt_w += 16; // La caja crece hasta haberse acoplado al tamaño del texto.
  if (cajatxt_h < txt_h + 32) cajatxt_h += 16;
  if (cajatxt_w > txt_w + 32) cajatxt_w = txt_w + 32;
  if (cajatxt_h > txt_h + 32) cajatxt_h = txt_h + 32;
  return false; // Es útil que la función devuelva el estado de la caja
                // (si ya terminó de formarse o no) para saber cuándo
                // empezar a dibujar el texto, sin por eso couplear 
                // demasiado a esta función con la de txt_gradual (que puede
                // ser útil con o sin caja). 
}

void reset_cajatxt(){
  cajatxt_w = 8;
  cajatxt_h = 8;
}

void txt_gradual(){ // Hace aparecer caracteres de texto uno por uno.
  if (txt_tiempo < 0 && txt_indice < txt_char.length) {
    txt_str += txt_char[txt_indice];
    txt_tiempo = txtiempo_max;
    txt_indice++;
    txt_pausado = false; // En caso de que se haya hecho una pausa en el último
                         // caracter, reanudar la velocidad usual.
  } else txt_tiempo--;
}

void txt_pausa(short adonde, byte cuanto){ // Esta es bastante intuitiva, creo. :P
  if (!txt_pausado && txt_indice == adonde) {
    txt_tiempo   = cuanto;
    txt_pausado  = true;
  }
}

void pausa_y_avance() {
  if (txt_indice == txt_char.length) timer_escena--;
}
