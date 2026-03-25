import { Injectable, inject } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, tap } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class AuthService {
  private http = inject(HttpClient);
  private apiUrl = 'https://localhost:7000/api/Auth/login';
  private readonly TOKEN_KEY = 'xtreme_token';

  constructor() {}

  login(credenciales: any): Observable<any> {
    return this.http.post(this.apiUrl, credenciales).pipe(
      tap((respuesta: any) => {
        if (respuesta && respuesta.token) {
          localStorage.setItem(this.TOKEN_KEY, respuesta.token);
        }
      }),
    );
  }

  logout(): void {
    localStorage.removeItem(this.TOKEN_KEY);
  }

  getToken(): string | null {
    return localStorage.getItem(this.TOKEN_KEY);
  }

  isLoggedIn(): boolean {
    return this.getToken() !== null;
  }
}