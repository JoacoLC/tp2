//¿Cuál es el punto de los comentarios en el código.................................................

//                           ;;;;;;;;
//                   .x$+;            :X$:
//                .X+                     .$:
//              ;$                           $;
//             X:                             :$
//            ;.                                $
//           .X       .....          :+++.       $
//           $       $$.+$$$;      .$$.$$$$.     +.
//           $      $$  $$$$$:     $$: $$$$$      +
//           $      $$$$$$$$$:     $$$$$$$$X      +
//          .$       $$$$$$$:      ;$$$$$$;      .+
//          .X                                   $
//           .$.                               .$
//             ;$             +++++          ;$.
//               .$.                      .Xx
//                  xX.             ::XXx.......xX.
//                     ;$$$$$;;;                  x;
//                       x                         $
//                       x                         $
//                       x       .        ...      $
//                       $       $     ..  $ X     $
//                       ;;     ...    ..  $ $    x
//                        $     . $    $x  $ .    $
//                        .:    $ +:   $xxx.  $:x$
//                         ;$  $;  ;$;$

//......................................................................si no va a haber arte ASCII?

//------------------------------- https://www.asciiart.eu/image-to-ascii -------------------------------

// Soy consciente de que gran parte de este código es ineficiente. Incluso considerando las limitaciones
// que nos pusiste respecto a lo que no podíamos usar, hice un uso mediocre de la funcionalidad disponible.
// Especialmente notable es la manera en la que creé distintas escenas para varios "estados" de la presentación
// que son prácticamente iguales. Podría simplemente haber chequeado "timer_escena" dentro de una misma escena.
// Escena escena escena.
// 
// No me queda mucho tiempo ya igual, y quiero dar por terminado este trabajo. Tengo el
// bocho quemado por la lucha incesante contra mi disfunción ejecutiva y sus intentos de frenarme.
//
// ¡Espero que te guste!
//
//                                                                                        El emoticón del nerd,
//                                                                                              -Joaco Labanda

void setup()
{
  size(640, 480, P2D);
  img_bckgrnd = loadImage("background.png");          // Declaradas en "images.pde"
  img_iconic1 = loadImage("L_iconicpose.png");    
  img_stareis = loadImage("L_stare_into_soul.png");
  img_iconic2 = loadImage("L_iconicpose2.png");
  img_literal = loadImage("L_expresionliteral.png");
  img_policef = loadImage("L_with_policeforce.png");
  img_senuelo = loadImage("L_convictosenuelo.png");
  img_tortura = loadImage("Misa_amane.png");
  img_lfocusd = loadImage("l_focused.png");
  img_negpens = loadImage("negro-pensante.png");

  img_btn     = loadImage("boton.png");              // Declarada en "boton.pde"

  fnt         = loadFont("Caladea-Bold-48.vlw");     // Declaradas en "text.pde"
  txt_char    = "Razones por\nlas que L\nde Death Note\nes re cul".toCharArray();
  textFont(fnt);
}

void draw()
{
  //=======================
  //-----------------------
  //----- T Í T U L O -----
  //-----------------------
  //=======================

  if (escena == 0) {
    if (timer_escena < 0) {
    cambiar_txt("Razones por\nlas que L\nde Death Note\nes re cul");
    l_veloc   = 15;
    l_decel   = 0.25;
    l_posx    = - 320;
    timer_escena = 1;
    } if (timer_escena == 1) {
    background(255);
    image(img_bckgrnd, 0, 0);
    l_veloc  =  desacelerar(l_veloc, l_decel); // Al principio todo esto era una sola función,
    l_decel  += 0.007;                         // pero Processing no me dejaba modificar un valor
    l_posx   =  deslizar(l_posx, l_veloc, 0);  // desde una función si ese valor fue pasado como
                                               // argumento en vez de ser cambiado directamente.

    // Por ejemplo, esto funcionaría:

    // boolean test;
    //
    // void cambiar(){
    //   if(test)        test = false;
    //   else if(!test)  test = true;
    // }

    // Pero esto no:

    // boolean test;
    //
    // void cambiar(boolean _test){
    //   if(_test)        _test = false;
    //   else if(!_test)  _test = true;
    // }
    //
    // cambiar(test);

    image(img_iconic1, l_posx, 96);
    if (l_posx == 0) {
      textSize(48);
      if (caja_txt(txt_str, 250, 48, 350, 255)) txt_gradual(); // Declarados en "text.pde"
    }
    if (txt_str.length() == 45) {
      if (boton("COMENZAR", 24, 320, 300)) { // "boton()" declarado en "boton.pde"
        timer_escena = -1;
        escena++;
      }
    }
   }

    //=======================
    //------ R A Z Ó N ------
    //-----------------------
    //-------- U N O --------
    //=======================
    
  } else if (escena == 1) {
    if (timer_escena < 0) {
      timer_escena = timer_razon;
    }
    if (timer_escena > 0) {
    background(0);
    fill(255);
    text("Razón 1:\n\n\n\n\nEs buena representación accidental del autismo", 32, 32, width, height);
    timer_escena--;
    } else {
      timer_escena--;
      escena++;
    }
    
  } else if (escena == 2) { // No estoy seguro de si este estilo de indentación fue buena idea. 
    if (timer_escena < 0) { // El quilombo que genera tanto nivel de anidado no es de mi agrado, 
    movimiento = 1;         // pero esto también es medio difícil de leer a su manera.
    cambiar_txt("No entiende las normas sociales, muestra poca expresividad facial y tiene habla monótona.");
    textSize(32);
    reset_cajatxt();
    timer_escena = timer_txtgrad;
    }
    else if (timer_escena > 0) {
    background(255);
    txt_pausa(byte(32), byte(10));
    image(img_stareis, 0, 0, img_stareis.width + movimiento, img_stareis.height + movimiento);
    if (caja_txt(txt_str, 80, 320, 512, 124)) txt_gradual();
    movimiento += 0.3;
    pausa_y_avance();
    }
    else {
    timer_escena--;
    escena++;
    }
    
  } else if (escena == 3) {
    if (timer_escena < 0) {
    movimiento = 1;
    cambiar_txt("Debido a su sentido vestibular\nalterado, requiere poses\nextrañas para concentrarse.");
    timer_escena = timer_txtgrad;
    }
    else if (timer_escena > 0) {
    background(255);
    txt_pausa(byte(40), byte(15));
    image(img_iconic2, 0, 0, img_iconic2.width + movimiento, img_iconic2.height + movimiento);
    caja_txt(txt_str, 80, 320, 512, 124);
    txt_gradual();
    movimiento += 0.3;
    pausa_y_avance();
    }
    else {
    timer_escena--;
    escena++;
    }
     
  } else if (escena == 4) {
    if (timer_escena < 0){
    movimiento = 1;
    cambiar_txt("Además, siempre se expresa de\nforma simple, literal y sin\ntapujos.");
    timer_escena = timer_txtgrad;
    }
    else if (timer_escena > 0) {
    background(255);
    txt_pausa(byte(7), byte(20));
    txt_pausa(byte(43), byte(13));
    txt_pausa(byte(51), byte(13));
    image(img_literal, movimiento - 300, 0);
    caja_txt(txt_str, 80, 320, 512, 124);
    txt_gradual();
    movimiento += 0.3;
    pausa_y_avance();
    }
    else {
    timer_escena--;
    escena++;
    }
    
  } else if (escena == 5) {
    if (timer_escena < 0){
    movimiento = 0;
    cambiar_txt("Le cuesta hacer amigos y hace\nhiperfoco en su trabajo de\ndetective por mucho tiempo.");
    timer_escena = timer_txtgrad;
    }
    else if (timer_escena > 0) {
    background(255);
    txt_pausa(byte(22), byte(15));
    image(img_lfocusd, -64 - movimiento, 0);
    caja_txt(txt_str, 80, 320, 512, 124);
    txt_gradual();
    movimiento += 0.3;
    pausa_y_avance();
    }
    else {
    timer_escena--;
    escena++;
    }
    
  } else if (escena == 6) {
    if (timer_escena < 0) {
    cambiar_txt("A veces, ni frena para ir a\ndormir.");
    timer_escena = timer_txtgrad;
    }
    else if (timer_escena > 0) {
    background(255);
    txt_pausa(byte(8), byte(15));
    image(img_lfocusd, -64 - movimiento, 0);
    caja_txt(txt_str, 80, 320, 512, 124);
    txt_gradual();
    movimiento += 0.3;
    pausa_y_avance();
    }
    else {
    timer_escena--;
    escena++;
    }
  
  //=======================
  //------ R A Z Ó N ------
  //-----------------------
  //-------- D O S --------
  //=======================
  
  } else if (escena == 7) {
    if (timer_escena < 0) {
    textSize(48);
    timer_escena = timer_razon;
    }
    else if (timer_escena > 0) {
    background(0);
    text("Razón 2:\n\n\n\n\n\nAyudó a la policía", 32, 32, width, height);
    timer_escena--;
    }
    else {
    timer_escena--;
    escena++;
    }
  
  } else if (escena == 8) {
    if (timer_escena < 0){
    textSize(32);
    movimiento = 0;
    cambiar_txt("L ayudó a la fuerza policial\njaponesa, que son los buenos, a\natrapar a Kira, que es el malo.");
    reset_cajatxt();
    timer_escena = timer_txtgrad;
    }
    else if (timer_escena > 0) {
    background(255);
    txt_pausa(byte(58), byte(15));
    image(img_policef, movimiento - 300, 0, img_policef.width + movimiento, img_policef.height + movimiento);
    if (caja_txt(txt_str, 80, 320, 512, 124)) txt_gradual();
    movimiento += 0.3;
    pausa_y_avance();
    }
    else {
    timer_escena--;
    escena++;
    }
    
  } else if (escena == 9) {
    if (timer_escena < 0){
    cambiar_txt("Por ende, L también es uno\nde los buenos.");
    timer_escena = timer_txtgrad;
    }
    else if (timer_escena > 0) {
    background(255);
    txt_pausa(byte(9), byte(15));
    image(img_policef, movimiento - 300, 0, img_policef.width + movimiento, img_policef.height + movimiento);
    caja_txt(txt_str, 80, 320, 512, 124);
    txt_gradual();
    movimiento += 0.2;
    pausa_y_avance();
    }
    else {
    timer_escena--;
    escena++;
    }
  
  //=======================
  //------ R A Z Ó N ------
  //-----------------------
  //------- T R E S -------
  //=======================
  
  } else if (escena == 10) {
    if (timer_escena < 0) {
    textSize(48);
    timer_escena = timer_razon;
    }
    else if (timer_escena > 0) {
    background(0);
    text("Razón 3:\n\n\n\nUsó a un convicto como señuelo para atrapar\na Kira", 32, 32, width, height);
    timer_escena--;
    }
    else {
    timer_escena--;
    escena++;
    }
  }
  
  else if (escena == 11) {
    if (timer_escena < 0) {
    textSize(32);
    cambiar_txt("Era un criminal e iba a recibir\nla pena de muerte\nde todas formas.");
    timer_escena = timer_txtgrad;
    reset_cajatxt();
    }
    else if (timer_escena > 0) {
    background(255);
    txt_pausa(byte(9), byte(15));
    image(img_senuelo, 0, 0, img_senuelo.width + movimiento, img_senuelo.height + movimiento);
    if (caja_txt(txt_str, 80 + random(5), 320 + random(5), 512, 124)) txt_gradual();
    movimiento += 0.2;
    pausa_y_avance();
    }
    else {
    timer_escena--;
    escena++;
    }
    
  } else if (escena == 12) {
    if (timer_escena < 0) {
    cambiar_txt("La pena de muerte es buena,\nKira tenía razón en eso.");
    timer_escena = timer_txtgrad;
    }
    else if (timer_escena > 0) {
    background(255);
    txt_pausa(byte(27), byte(15));
    image(img_senuelo, 0, 0, img_senuelo.width + movimiento, img_senuelo.height + movimiento);
    caja_txt(txt_str, 80 + random(5), 320 + random(5), 512, 124);
    txt_gradual();
    movimiento += 0.2;
    pausa_y_avance();
    }
    else {
    timer_escena--;
    escena++;
    }
  } else if (escena == 13) {
    if (timer_escena < 0) {
    movimiento = 16;
    cambiar_txt("Pero no tenía razón en pensar\nque era el bueno, porque estaba\nen contra de la policía.");
    timer_escena = 350;
    }
    else if (timer_escena > 0) {
    background(255);
    txt_pausa(byte(47), byte(15));
    if (timer_escena % 32 >= 16) movimiento++;
    else movimiento--;
    tint(random(192, 255), random(192, 255), random(192,255));
    image(img_negpens, 0, 0, img_negpens.width + movimiento, img_negpens.height + movimiento);
    tint(255);
    caja_txt(txt_str, 80, 320, 512, 124);
    txt_gradual();
    timer_escena--;
    }
    else {
    timer_escena--;
    escena++;
    }
  
  } else if (escena == 14) {
    if (timer_escena < 0) {
    cambiar_txt("Creo que no voy a pensar más en esto.");
    timer_escena = timer_txtgrad;
    }
    else if (timer_escena > 0) {
    background(255);
    txt_gradual();
    fill(0);
    text(txt_str, 32, 420);
    pausa_y_avance();
    }
    else {
    timer_escena--;
    escena++;
    }
    
  } else if (escena == 15) {
    if (timer_escena < 0) {
    textSize(48);
    timer_escena = timer_razon;
    }
    else if (timer_escena > 0) {
    background(0);
    fill(255);
    text("Razón 4:\n\n\n\nProbablemente esté perseguido por crímenes\nde lesa humanidad", 32, 32, width, height);
    timer_escena--;
    }
    else {
    timer_escena--;
    escena++;
    }
    
  } else if (escena == 16) {
    if (timer_escena < 0) {
    cambiar_txt("Secuestró y torturó\na Misa Amane\nde manera\naparentemente\nfetichista por casi\nun mes,");
    timer_escena = 2;
    }
    else if (timer_escena > 0) {
    background(0);
    tint(255, 255, 255, 128);
    image(img_tortura, random(5), random(5));
    txt_gradual();
    text(txt_str, 32, 32, 512, 480);
    if (txt_indice == txt_char.length) timer_escena--;
    }
    else {
    timer_escena--;
    escena++;
    }
  
  } else if (escena == 17) {
    if (timer_escena < 0) {
    cambiar_txt("teniéndola retenida\ny encadenada\na la fuerza mientras\nle hacía preguntas\nincómodas\ny solo la dejaba salir\npara ir al baño.");
    timer_escena = timer_txtgrad;
    }
    else if (timer_escena > 0) {
    background(0);
    tint(255, 255, 255, 128);
    image(img_tortura, random(5), random(5));
    txt_gradual();
    text(txt_str, 32, 32, 512, 480);
    pausa_y_avance();
    }
    else {
    timer_escena--;
    escena++;
    }
    
  } else if (escena == 18) {
    if (timer_escena < 0) {
    cambiar_txt("Eso es bueno.\nCreo.\nPorque L estaba\ncon la policía.\nQue son los buenos.");
    timer_escena = timer_txtgrad;
    }
    else if (timer_escena > 0) {
    background(0);
    txt_pausa(byte(13), byte(60));
    txt_pausa(byte(19), byte(60));
    txt_pausa(byte(52), byte(60));
    tint(255, 255, 255, 128);
    image(img_tortura, random(5), random(5));
    txt_gradual();
    text(txt_str, 32, 32, 512, 480);
    pausa_y_avance();
    }
    else {
    timer_escena--;
    escena++;
    }
  } else if (escena == 19) {
    if (timer_escena < 0) {
    textSize(32);
    txt_str      = "";
    timer_escena = 700;
    }
    else if (timer_escena > 0) {
    background(0);
    if      (timer_escena == 610)  txt_str =   "En fin, ¡espero que les haya\ngustado mi análisis!\n\n";
    else if (timer_escena == 500)  txt_str +=  "Creo que miré al personaje con\nbastante profundidad, realmente\nes un héroe y un genio.\n\n\n\n\n";
    else if (timer_escena == 300)  txt_str +=  "¡Nos vemos en el próximo TP!";
    text(txt_str, 32, 32, 512, 480);
    timer_escena--;
    } else if (timer_escena == 0) {
      background(0);
      image(img_bckgrnd, 0, 0);
      if (boton("¡OTRA VEZ!", 24, width/2 - img_btn.width/2, height/2 - img_btn.height/2)) {
        tint(255);
        reset_cajatxt();
        timer_escena = -1;
        escena       = 0;
      } // Linda indentación. Súper buena práctica.
    }
  }
}

// ¿C...compilador-senpai? >//<

// Por favor dejá de ignorarme, Compilador-senpai...

// ... UwU
