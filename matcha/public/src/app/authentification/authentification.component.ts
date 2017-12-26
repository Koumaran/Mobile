import { MessageService } from './../services/message.service';
import { NgForm } from '@angular/forms';

import { AppComponent } from './../app.component';
import { Component, OnInit, ViewEncapsulation, Input, Output, EventEmitter } from '@angular/core';
import { LoginService } from '../services/login.service';
import { Router } from '@angular/router';
import { User } from '../user/user';

@Component({
  selector: 'mat-authentification',
  templateUrl: './authentification.component.html',
  styleUrls: ['./authentification.component.css'],
  encapsulation: ViewEncapsulation.None
})
export class AuthentificationComponent implements OnInit {

  inscription: Boolean = false;
  passLost: Boolean = false;
  user =  new User();
  error: string;

  constructor(
    private loginService: LoginService,
    private messageService: MessageService,
    private router: Router
  ) { }

  ngOnInit() {
  }

  loginUser(f: NgForm) {
    if (f.valid) {
      this.loginService.logIn(f.value);
    }
  }
}
