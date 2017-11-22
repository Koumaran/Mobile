import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'mat-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  logged: Boolean = false;
  route: Router;

  constructor(routes: Router) {
    this.route = routes;
  }

  changeLog(logged) {
    this.logged = logged;
  }
}
