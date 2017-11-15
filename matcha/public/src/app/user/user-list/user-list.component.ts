import { Component, OnInit, ViewEncapsulation, Input, EventEmitter, Output } from '@angular/core';
import { User } from '../user';

@Component({
  selector: 'mat-user-list',
  templateUrl: './user-list.component.html',
  styleUrls: ['./user-list.component.css'],
  encapsulation: ViewEncapsulation.None
})
export class UserListComponent implements OnInit {
  @Input() users;
  @Output() destroyUserEvent = new EventEmitter();
  @Output() updateUserEvent = new EventEmitter();

  constructor() { }

  ngOnInit() {
  }

  destroy(user: User) {
    this.destroyUserEvent.emit(user);
  }

  update(users) {
    this.updateUserEvent.emit(users);
  }
}
