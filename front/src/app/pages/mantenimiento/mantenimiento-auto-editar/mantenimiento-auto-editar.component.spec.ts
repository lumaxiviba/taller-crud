import { ComponentFixture, TestBed } from '@angular/core/testing';
import { MantenimientoAutoEditarComponent } from './mantenimiento-auto-editar.component';

describe('MantenimientoAutoEditarComponent', () => {
  let component: MantenimientoAutoEditarComponent;
  let fixture: ComponentFixture<MantenimientoAutoEditarComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MantenimientoAutoEditarComponent],
    }).compileComponents();

    fixture = TestBed.createComponent(MantenimientoAutoEditarComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
