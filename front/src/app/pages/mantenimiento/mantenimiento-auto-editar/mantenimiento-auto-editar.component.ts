import { Component, EventEmitter, inject, Input, Output, OnChanges } from '@angular/core';
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
export class MantenimientoAutoEditarComponent implements OnChanges {
  @Input() auto: Auto | null = null;
  @Input() marcas: AutoMarca[] = [];
  @Input() modo: 'crear' | 'editar' = 'crear';

  @Output() cancelado = new EventEmitter<void>();
  @Output() guardado = new EventEmitter<void>();

  _autoService = inject(AutoService);

  autoForm: Auto = { id: 0, idMarca: 0, placa: '', modelo: '', color: '', anio: 2026 };

  ngOnChanges(): void {
    if (this.modo === 'editar' && this.auto) {
      this.autoForm = { ...this.auto };
    } else {
      this.autoForm = { id: 0, idMarca: 0, placa: '', modelo: '', color: '', anio: 2026 };
    }
  }

  guardar() {
    if (this.modo === 'crear') {
      this._autoService.createAuto(this.autoForm).subscribe({
        next: () => this.guardado.emit(),
        error: (err: any) => console.log('Error al crear:', err),
      });
    } else {
      this._autoService.updateAuto(this.autoForm).subscribe({
        next: () => this.guardado.emit(),
        error: (err: any) => console.log('Error al actualizar:', err),
      });
    }
  }

  cancelar() {
    this.cancelado.emit();
  }
}
