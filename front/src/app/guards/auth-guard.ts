import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';
import { AuthService } from '../services/auth.service';

export const authGuard: CanActivateFn = (route, state) => {
  const _authService = inject(AuthService);
  const router = inject(Router);

  // Le preguntamos al servicio si el usuario tiene un token guardado
  if (_authService.isLoggedIn()) {
    return true; // ¡Tiene pase VIP, déjalo entrar!
  } else {
    // Si no tiene token, lo mandamos directo a la pantalla de Login
    router.navigate(['/login']);
    return false;
  }
};
