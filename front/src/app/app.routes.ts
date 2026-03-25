import { Routes } from '@angular/router';
import { authGuard } from './guards/auth-guard';

export const routes: Routes = [
  {
    path: 'login',
    loadComponent: () => import('./components/login/login').then(m => m.LoginComponent),
  },
  {
    path: '',
    redirectTo: 'mantenimiento',
    pathMatch: 'full',
  },
  {
    path: 'mantenimiento',
    canActivate: [authGuard], 
    children: [
      {
        path: '', 
        loadComponent: () => import('./pages/mantenimiento/mantenimiento-auto-list/mantenimiento-auto-list.component').then(m => m.MantenimientoAutoListComponent),
      },
      {
        path: 'nuevo',
        loadComponent: () => import('./pages/mantenimiento/mantenimiento-auto-editar/mantenimiento-auto-editar.component').then(m => m.MantenimientoAutoEditarComponent),
      },
      {
        path: 'editar/:id',
        loadComponent: () => import('./pages/mantenimiento/mantenimiento-auto-editar/mantenimiento-auto-editar.component').then(m => m.MantenimientoAutoEditarComponent),
      }
    ]
  },
  {
    path: '**',
    redirectTo: 'login',
    pathMatch: 'full',
  },
];