import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, tap } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  private http = inject(HttpClient);
  private apiUrl = 'https://localhost:7000/api/Auth/login';

  constructor() {}

  login(credenciales: any): Observable<any> {
    return this.http.post(this.apiUrl, credenciales).pipe(
      tap((respuesta: any) => {
        if (respuesta && respuesta.token) {
          localStorage.setItem('xtreme_token', respuesta.token);
        }
      }),
    );
  }

  // Método para cerrar sesión (borra el token)
  logout(): void {
    localStorage.removeItem('xtreme_token');
  }

  // Método para obtener el token guardado (lo usará el interceptor)
  getToken(): string | null {
    return localStorage.getItem('xtreme_token');
  }

  // Método para saber si hay alguien logueado (lo usará el Guard)
  isLoggedIn(): boolean {
    return this.getToken() !== null;
  }
}
