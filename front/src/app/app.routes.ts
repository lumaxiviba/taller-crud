import { Routes } from '@angular/router';
import { MantenimientoAutoListComponent } from './pages/mantenimiento/mantenimiento-auto-list/mantenimiento-auto-list.component';
import { MantenimientoAutoEditarComponent } from './pages/mantenimiento/mantenimiento-auto-editar/mantenimiento-auto-editar.component';

export const routes: Routes = [
  {
    path: '',
    component: MantenimientoAutoListComponent,
  },
  {
    path: 'mantenimiento/nuevo',
    component: MantenimientoAutoEditarComponent,
  },
  {
    path: 'mantenimiento/editar/:id',
    component: MantenimientoAutoEditarComponent,
  },
  {
    path: '**',
    redirectTo: '',
    pathMatch: 'full',
  },
];
