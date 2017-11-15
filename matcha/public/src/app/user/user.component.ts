import { UserService } from './user.service';
import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { User } from './user';

@Component({
  selector: 'mat-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css'],
  encapsulation: ViewEncapsulation.None
})
export class UserComponent implements OnInit {
  users: Array<User> = [
  /*   new User(1, 'jega', 'jegathas', 'sivanesan', 'email@email.com'),
    new User(2, 'jega', 'jegathas', 'sivanesan', 'email@email.com'),
    new User(3, 'jega', 'jegathas', 'sivanesan', 'email@email.com') */
  ];

  constructor(private _userService: UserService) { }

  ngOnInit() {
    this.getUsers();
  }

  getUsers() {
    this._userService.getUsers()
      .then(users => this.users = users)
      .catch(err => console.log(err));
  }

  create(user: User) {
    this._userService.create(user)
      .then(status => this.getUsers())
      .catch(err => console.log(err));

    this.users.push(user);
  }

  destroy(user: User) {
    this._userService.destroy(user)
    .then(status => this.getUsers())
    .catch(err => console.log(err));
  }

  update(users: any) {
    const i = this.users.indexOf(users.original);
    this.users[i] = users.edited;

  }
}
