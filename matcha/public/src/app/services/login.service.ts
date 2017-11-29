import { User } from './../user/user';
import { UserService } from './user.service';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';

@Injectable()
export class LoginService {
  user: User;
  redirectUrl: string;

  constructor(private userService: UserService, private router: Router) { }

  isLoggedIn(): Boolean {
    if (this.user !== undefined) {
      return true;
    }
    return false;
  }

  logIn(inconnu: any) {
    console.log('In logIn');
    console.log(inconnu);
    this.userService.getUserByPseudo(inconnu)
        .subscribe(user => this.user = user);
    console.log(this.user);

    return this.user;
  }

  logOut() {
    console.log('logOUt');
    this.user = undefined;
    this.router.navigate(['/login']);
  }
}
