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
      } else if (error?.status !== 401) {
        Swal.fire({
          icon: 'warning',
          title: 'Ocurrió un problema',
          text: `Error en el servidor (Código: ${error.status || 'Desconocido'}).`,
          confirmButtonColor: '#f8bb86',
        });
      }

      return throwError(() => error);
    }),
  );
};
