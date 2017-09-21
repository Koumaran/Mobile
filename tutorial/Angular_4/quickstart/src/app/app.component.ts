import { Component } from '@angular/core';

@Component({
  selector: 'my-app',
  template: `
  <div class="container">
  <h1>{{title}}</h1>
  <nav>
    <a routerLink="/dashboard">Dashboard</a>
    <a routerLink="/heroes">Heroes</a>
  </nav>
  <router-outlet></router-outlet>
  </div>
  `,
  styles: [`
  .container {
    display: table;
    margin: 0 auto;
  }
  `]
})
export class AppComponent {
  title = 'Tour of Heros';
}
