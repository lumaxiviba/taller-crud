import { Component, inject } from '@angular/core';
import { Router } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { AuthService } from '../../services/auth.service';

@Component({
  selector: 'app-login',
  imports: [FormsModule],
  templateUrl: './login.html',
})
export class LoginComponent {
  credenciales = {
    username: '',
    password: '',
  };

  mensajeError: string = '';
  cargando: boolean = false;

  private _authService = inject(AuthService);
  private router = inject(Router);

  iniciarSesion() {
    this.cargando = true;
    this.mensajeError = '';

    this._authService.login(this.credenciales).subscribe({
      next: (respuesta) => {
        this.router.navigate(['/']); // Cambia esta ruta si tu tabla de autos está en otra URL
        this.cargando = false;
      },
      error: (err) => {
        // Si las credenciales están mal, mostramos error
        this.mensajeError = 'Usuario o contraseña incorrectos.';
        this.cargando = false;
        console.log('Error en login:', err);
      },
    });
  }
}
