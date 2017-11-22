
import { User } from './../user/user';
import { AppComponent } from './../app.component';
import { Component, OnInit, ViewEncapsulation, Input, Output, EventEmitter } from '@angular/core';
import { LoginService } from '../services/login.service';

@Component({
  selector: 'mat-authentification',
  templateUrl: './authentification.component.html',
  styleUrls: ['./authentification.component.css'],
  encapsulation: ViewEncapsulation.None
})
export class AuthentificationComponent implements OnInit {

  inscription: Boolean = false;
  passLost: Boolean = false;
  user: User;

  constructor(private longinService: LoginService) { }

  ngOnInit() {
  }

  loginUser() {
    this.user = this.longinService.logIn(this.user);
    console.log(this.user);
  }
}
