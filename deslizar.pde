float       l_veloc   = 15;
float       l_decel   = 0.25;
float       l_posx    = - 320;
final float min_vel = 0.8;

//void deslizar() {
//  if (origen != destn) {
//    veloc -= decel;
//    if (veloc < min_vel) veloc = min_vel;
//    pos += ((origen - destn) / (origen - destn) * -1) * veloc;
//  }
//}
float deslizar(float _pos, float _veloc, float _destn){
  if (_pos >= _destn){
      _pos   = _destn;
      _veloc = 0;
      return _pos;
      
  }else if (_pos < _destn){
      _pos += _veloc;
      return _pos;
  }
  
  return _pos;
}

float desacelerar(float _veloc, float _decel)
{
  _veloc -= _decel;
  if (_veloc < min_vel) _veloc = min_vel;
  return _veloc;
}
