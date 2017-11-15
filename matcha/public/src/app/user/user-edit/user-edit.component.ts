import { Component, OnInit, ViewEncapsulation, Input, Output, EventEmitter } from '@angular/core';
import { User } from '../user';

@Component({
  selector: 'mat-user-edit',
  templateUrl: './user-edit.component.html',
  styleUrls: ['./user-edit.component.css'],
  encapsulation: ViewEncapsulation.None
})
export class UserEditComponent implements OnInit {
  @Input() user: User;
  @Output() updateUserEvent = new EventEmitter();
  userEdit = new User(0);
  constructor() { }

  ngOnInit() {
    Object.assign(this.userEdit, this.user);
  }

  update() {
    this.userEdit.editable = false;
    this.updateUserEvent.emit({original: this.user, edited: this.userEdit});
  }

}
