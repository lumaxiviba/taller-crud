import {
  Component,
  EventEmitter,
  inject,
  Input,
  Output,
  OnChanges,
  OnInit,
  ChangeDetectorRef,
} from '@angular/core';
import { Auto } from '../../../models/auto';
import { AutoMarca } from '../../../models/auto-marca';
import { AutoService } from '../../../services/auto.service';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-mantenimiento-auto-editar',
  imports: [FormsModule],
  templateUrl: './mantenimiento-auto-editar.component.html',
  styleUrls: ['./mantenimiento-auto-editar.component.css'],
})
export class MantenimientoAutoEditarComponent implements OnChanges, OnInit {
  @Input() auto: Auto | null = null;
  @Input() marcas: AutoMarca[] = [];
  @Input() modo: 'crear' | 'editar' = 'crear';

  @Output() cancelado = new EventEmitter<void>();
  @Output() guardado = new EventEmitter<void>();

  _autoService = inject(AutoService);
  private cdr = inject(ChangeDetectorRef);

  // Agregamos las variables para guardar las listas
  listaTipos: any[] = [];
  listaCombustibles: any[] = [];

  // Actualizamos el modelo inicial para que incluya tipo y combustible
  autoForm: Auto = {
    id: 0,
    idMarca: 0,
    placa: '',
    modelo: '',
    color: '',
    anio: 2026,
    IdTipo: 0, // Actualizado
    IdCombustible: 0,
  };

  ngOnInit() {
    this.cargarListasDesplegables();
  }

  cargarListasDesplegables() {
    this._autoService.getTipos().subscribe({
      next: (data) => {
        this.listaTipos = data;
        this.cdr.detectChanges(); // <--- El empujón definitivo
      },
      error: (err) => console.error('Error cargando tipos', err),
    });

    this._autoService.getCombustibles().subscribe({
      next: (data) => {
        this.listaCombustibles = data;
        this.cdr.detectChanges(); // <--- El empujón definitivo
      },
      error: (err) => console.error('Error cargando combustibles', err),
    });
  }
  ngOnChanges(): void {
    if (this.modo === 'editar' && this.auto) {
      this.autoForm = { ...this.auto };

      // --- EL HACK DE LECTURA ---
      // Atrapamos el dato venga como venga y lo forzamos a ser Número
      this.autoForm.IdTipo = Number(
        this.auto.IdTipo || (this.auto as any).idTipo || (this.auto as any).id_tipo_auto || 0,
      );
      this.autoForm.IdCombustible = Number(
        this.auto.IdCombustible ||
          (this.auto as any).idCombustible ||
          (this.auto as any).id_combustible ||
          0,
      );
      // --------------------------
    } else {
      this.autoForm = {
        id: 0,
        idMarca: 0,
        placa: '',
        modelo: '',
        color: '',
        anio: 2026,
        IdTipo: 0,
        IdCombustible: 0,
      };
    }
  }

  guardar() {
    // Nos aseguramos de que sean números enteros
    this.autoForm.idMarca = Number(this.autoForm.idMarca);
    this.autoForm.IdTipo = Number(this.autoForm.IdTipo);
    this.autoForm.IdCombustible = Number(this.autoForm.IdCombustible);

    // --- EL HACK DE ENVÍO ---
    // Clonamos el formulario y le metemos todas las combinaciones de nombres
    // para que C# lo atrape sí o sí.
    const payloadAcorazado = {
      ...this.autoForm,
      idTipo: this.autoForm.IdTipo,
      id_tipo_auto: this.autoForm.IdTipo,
      idCombustible: this.autoForm.IdCombustible,
      id_combustible: this.autoForm.IdCombustible,
    };
    // -------------------------

    if (this.modo === 'crear') {
      // Enviamos nuestro payload acorazado
      this._autoService.createAuto(payloadAcorazado as any).subscribe({
        next: () => this.guardado.emit(),
        error: (err) => console.error('Error al crear:', err),
      });
    } else {
      // Enviamos nuestro payload acorazado
      this._autoService.updateAuto(payloadAcorazado as any).subscribe({
        next: () => this.guardado.emit(),
        error: (err) => console.error('Error al actualizar:', err),
      });
    }
  }
  cancelar() {
    this.cancelado.emit();
  }
}
