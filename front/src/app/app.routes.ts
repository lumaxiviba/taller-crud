import { Routes } from '@angular/router';
import { MantenimientoAutoListComponent } from './pages/mantenimiento/mantenimiento-auto-list/mantenimiento-auto-list.component';
import { MantenimientoAutoEditarComponent } from './pages/mantenimiento/mantenimiento-auto-editar/mantenimiento-auto-editar.component';

import { authGuard } from './guards/auth-guard';
import { LoginComponent } from './components/login/login';

export const routes: Routes = [
  {
    path: 'login',
    component: LoginComponent,
  },

  {
    path: '',
    component: MantenimientoAutoListComponent,
    canActivate: [authGuard], // <--- CANDADO
  },
  {
    path: 'mantenimiento/nuevo',
    component: MantenimientoAutoEditarComponent,
    canActivate: [authGuard], // <--- CANDADO
  },
  {
    path: 'mantenimiento/editar/:id',
    component: MantenimientoAutoEditarComponent,
    canActivate: [authGuard], // <--- CANDADO
  },

  // Comodín: Si escriben una URL que no existe, los mandamos al Login
  {
    path: '**',
    redirectTo: 'login',
    pathMatch: 'full',
  },
];
