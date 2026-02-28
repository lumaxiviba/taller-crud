import { ChangeDetectionStrategy, Component, inject, OnInit, signal } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { AutoService } from '../../../services/auto.service';
import { AutoMarcaService } from '../../../services/auto-marca.service';
import { Auto } from '../../../models/auto';
import { AutoMarca } from '../../../models/auto-marca';
import { MantenimientoAutoEditarComponent } from '../mantenimiento-auto-editar/mantenimiento-auto-editar.component';

@Component({
  selector: 'app-mantenimiento-auto-list',
  imports: [MantenimientoAutoEditarComponent, FormsModule],
  templateUrl: './mantenimiento-auto-list.component.html',
  styleUrls: ['./mantenimiento-auto-list.component.css'],
  changeDetection: ChangeDetectionStrategy.OnPush,
})
export class MantenimientoAutoListComponent implements OnInit {
  _autoService = inject(AutoService);
  _autoMarcaService = inject(AutoMarcaService);

  autos = signal<Auto[]>([]);
  autosOriginales: Auto[] = [];
  marcas: AutoMarca[] = [];

  mostrarModal = false;
  modoEdicion: 'crear' | 'editar' = 'crear';
  autoSeleccionado: Auto | null = null;

  filtroPlaca: string = '';
  filtroModelo: string = '';

  constructor() {}

  ngOnInit() {
    this.getAllAutos();
    this.getMarcas();
  }

  getMarcas() {
    this._autoMarcaService.getMarcas().subscribe({
      next: (data: any) => {
        this.marcas = data;
      },
      error: (err: any) => {
        console.log('ocurrió un error', err);
      },
    });
  }

  getAllAutos() {
    this._autoService.getAutos().subscribe({
      next: (data: any) => {
        this.autosOriginales = data;
        this.autos.set(data);
      },
      error: (err: any) => {
        console.log('ocurrió un error', err);
      },
      complete: () => {
        console.log('getAllAutos completed');
      },
    });
  }

  buscar(): void {
    const textoPlaca = this.filtroPlaca.trim().toLowerCase();
    const textoModelo = this.filtroModelo.trim().toLowerCase();

    const filtrados = this.autosOriginales.filter((auto) => {
      const coincidePlaca = auto.placa.toLowerCase().includes(textoPlaca);
      const coincideModelo = auto.modelo.toLowerCase().includes(textoModelo);
      return coincidePlaca && coincideModelo;
    });

    this.autos.set(filtrados);
  }

  limpiarFiltros(): void {
    this.filtroPlaca = '';
    this.filtroModelo = '';
    this.autos.set(this.autosOriginales);
  }

  abrirAgregar(): void {
    this.modoEdicion = 'crear';
    this.autoSeleccionado = null;
    this.mostrarModal = true;
  }

  abrirEditar(auto: Auto): void {
    this.modoEdicion = 'editar';
    this.autoSeleccionado = { ...auto };
    this.mostrarModal = true;
  }

  cerrarModal(): void {
    this.mostrarModal = false;
    this.autoSeleccionado = null;
  }

  onGuardado(): void {
    this.cerrarModal();
    this.getAllAutos();
  }

  eliminarAuto(auto: Auto): void {
    const confirmado = window.confirm(
      `¿Está seguro de eliminar el vehículo con placa ${auto.placa} y modelo ${auto.modelo}?`,
    );

    if (!confirmado) {
      return;
    }

    this._autoService.deleteAuto(auto.id).subscribe({
      next: () => {
        this.getAllAutos();
      },
      error: (err: any) => {
        console.log('ocurrió un error al eliminar', err);
      },
    });
  }
}
