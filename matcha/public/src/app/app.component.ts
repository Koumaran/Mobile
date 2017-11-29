import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { User } from './user/user';

@Component({
  selector: 'mat-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  user: User;
  logged: Boolean = false;
  route: Router;

  constructor(routes: Router) {
    this.route = routes;
  }

}
