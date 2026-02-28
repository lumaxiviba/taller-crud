import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Auto } from '../models/auto'; // Asegúrate de que la ruta coincida con tu carpeta models

@Injectable({
  providedIn: 'root',
})
export class AutoService {
  // Esta es la URL exacta que probaste en tu navegador y funcionó
  private apiUrl = 'https://localhost:7000/api/Auto';

  constructor(private http: HttpClient) {}

  getAutos(): Observable<Auto[]> {
    return this.http.get<Auto[]>(this.apiUrl);
  }

  getAuto(id: number): Observable<Auto> {
    return this.http.get<Auto>(`${this.apiUrl}/${id}`);
  }

  createAuto(auto: Auto): Observable<number> {
    return this.http.post<number>(this.apiUrl, auto);
  }

  updateAuto(auto: Auto): Observable<boolean> {
    return this.http.put<boolean>(this.apiUrl, auto);
  }

  deleteAuto(id: number): Observable<boolean> {
    return this.http.delete<boolean>(`${this.apiUrl}/${id}`);
  }
}
