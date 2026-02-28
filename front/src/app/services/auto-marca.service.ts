import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { AutoMarca } from '../models/auto-marca'; // Asegúrate de que la ruta sea correcta

@Injectable({
  providedIn: 'root',
})
export class AutoMarcaService {
  // Apunta al controlador de marcas
  private apiUrl = 'https://localhost:7000/api/AutoMarca';

  constructor(private http: HttpClient) {}

  getMarcas(): Observable<AutoMarca[]> {
    return this.http.get<AutoMarca[]>(this.apiUrl);
  }
}
