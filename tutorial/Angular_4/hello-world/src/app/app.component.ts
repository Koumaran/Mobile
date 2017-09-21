import { Component, ViewEncapsulation } from '@angular/core';

@Component({
  selector: 'app-root',
  template: `
  <h1>Mon premier Component</h1>
  <app-course></app-course>
  <app-cadre>un contenue dans mon cadre</app-cadre>
  `,
  styles: [`
  H1 {
    color: red;
  }
          `],
  encapsulation: ViewEncapsulation.Native
})
export class AppComponent {
  title = 'app';
}
