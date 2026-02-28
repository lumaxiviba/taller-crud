import { ComponentFixture, TestBed } from '@angular/core/testing';
import { MantenimientoAutoListComponent } from './mantenimiento-auto-list.component';

describe('MantenimientoAutoListComponent', () => {
  let component: MantenimientoAutoListComponent;
  let fixture: ComponentFixture<MantenimientoAutoListComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [MantenimientoAutoListComponent],
    }).compileComponents();

    fixture = TestBed.createComponent(MantenimientoAutoListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
