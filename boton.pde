PImage img_btn;

boolean boton(String _text, float fnt_size, float posx, float posy) {
  if ( mouseX >= posx && mouseX <= posx + img_btn.width &&
      mouseY >= posx && mouseY <= posx + img_btn.height){
       tint(255, 255, 255, 128);
       if (mousePressed) return true;
   } else tint(255);
   
   image(img_btn, posx, posy);
   textSize(fnt_size);
   text(_text, posx + img_btn.width / 4, posy + img_btn.height / 2 + fnt_size / 4);
   
   tint(255);
   
   return false;
}
