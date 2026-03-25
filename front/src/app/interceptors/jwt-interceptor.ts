import { HttpInterceptorFn, HttpErrorResponse } from '@angular/common/http';
import { inject } from '@angular/core';
import { AuthService } from '../services/auth.service';
import { catchError, throwError, timeout, TimeoutError } from 'rxjs';
import Swal from 'sweetalert2';

export const jwtInterceptor: HttpInterceptorFn = (req, next) => {
  const authService = inject(AuthService);
  const token = authService.getToken();

  let peticion = req;
  if (token) {
    peticion = req.clone({
      setHeaders: {
        Authorization: `Bearer ${token}`,
      },
    });
  }

  return next(peticion).pipe(
    timeout(1500),
    catchError((error: any) => {
      
      if (error instanceof TimeoutError || error?.status === 0) {
        Swal.fire({
          icon: 'error',
          title: 'Sin conexión',
          text: 'El servidor de Xtreme Performance no responde.',
          confirmButtonColor: '#d33',
          confirmButtonText: 'Entendido',
        });
      } 
      else if (error instanceof HttpErrorResponse) {
        switch (error.status) {
          case 400: 
            Swal.fire({
              icon: 'warning',
              title: 'Datos incorrectos',
              text: 'Revisa la información enviada. Faltan datos o tienen un formato incorrecto.',
              confirmButtonColor: '#f8bb86',
            });
            break;

          case 401:
            Swal.fire({
              icon: 'info',
              title: 'Sesión expirada',
              text: 'Tu sesión es inválida o ha expirado. Por favor, vuelve a iniciar sesión.',
              confirmButtonColor: '#3085d6',
            });
            break;

          case 403:
            Swal.fire({
              icon: 'error',
              title: 'Acceso denegado',
              text: 'Tu rol no tiene los privilegios necesarios para realizar esta acción.',
              confirmButtonColor: '#d33',
            });
            break;

          case 500: 
            Swal.fire({
              icon: 'error',
              title: 'Error del servidor',
              text: 'Ocurrió un problema interno en la base de datos o el código. El administrador ha sido notificado.',
              confirmButtonColor: '#d33',
            });
            break;

          default: 
            Swal.fire({
              icon: 'warning',
              title: 'Ocurrió un problema',
              text: `Error desconocido (Código: ${error.status}).`,
              confirmButtonColor: '#f8bb86',
            });
            break;
        }
      }

      return throwError(() => error);
    }),
  );
};