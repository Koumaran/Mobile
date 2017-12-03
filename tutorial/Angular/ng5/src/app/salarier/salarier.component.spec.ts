import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SalarierComponent } from './salarier.component';

describe('SalarierComponent', () => {
  let component: SalarierComponent;
  let fixture: ComponentFixture<SalarierComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SalarierComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SalarierComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
