import { UserService } from '../services/user.service';
import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { User } from './user';

@Component({
  selector: 'mat-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css'],
  encapsulation: ViewEncapsulation.None
})
export class UserComponent implements OnInit {
  users: User[];

  constructor(private _userService: UserService) { }

  ngOnInit() {
    this.getUsers();
  }

  getUsers(): void {
    this._userService.getUsers()
      .subscribe(users => this.users = users);
  }
  // effectuer si les donner sont correcte.... ici ou en aval
  create(newUser: User): void {
    this._userService.create(newUser)
      .subscribe(user => {
        this.users.push(user);
      });
  }

  destroy(user: User): void {
    this.users = this.users.filter(u => u !== user);
    this._userService.destroy(user).subscribe();
  }

  update(user: User) {
    this._userService.update(user)
      .subscribe(users => console.log(users));
  }
}
