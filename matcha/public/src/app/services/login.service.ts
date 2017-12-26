import { User } from './../user/user';
import { UserService } from './user.service';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { MessageService } from './message.service';

@Injectable()
export class LoginService {
  user: User;
  redirectUrl: string;
  userURL = '/users/';

  constructor(private _http: HttpClient, private router: Router, private messageService: MessageService) { }

  isLoggedIn(): Boolean {
    if (this.user) {
      return true;
    }
    return false;
  }


  logIn(inconnu: any) {
    this._http.post<User>(this.userURL + inconnu.pseudo, inconnu).subscribe(
      (user) => {
        if (user) {
          this.user = user;
          this.router.navigate(['']);
        } else {
          this.messageService.add('Désoler mais tu t\'es trompé sur quelque chose!');
        }
      },
      (err) => {
        console.log(err);
    });
    /* this.userService.getUserByPseudo(inconnu)
        .subscribe(
          (user) => {
            console.log(user);
            this.user = user;
            this.router.navigate(['']);
          },
          (err) => {
            console.log(err);
        }); */
  }

  logOut() {
    console.log('logOUt');
    this.user = undefined;
    this.router.navigate(['/login']);
  }
}
