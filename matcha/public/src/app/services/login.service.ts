import { User } from './../user/user';
import { UserService } from './user.service';
import { Injectable } from '@angular/core';

@Injectable()
export class LoginService {
  user: User;

  constructor(private userService: UserService) { }

  logIn(inconnu: User) {
    this.userService.getUserByPseudo(inconnu.pseudo, inconnu.pseudo).then(user => this.user = user).catch(err => console.log(err));
    return this.user;
  }
}
