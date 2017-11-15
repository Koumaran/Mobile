import { Component, OnInit, ViewEncapsulation, Output, EventEmitter } from '@angular/core';
import { User } from './../user';

@Component({
  selector: 'mat-user-new',
  templateUrl: './user-new.component.html',
  styleUrls: ['./user-new.component.css'],
  encapsulation: ViewEncapsulation.None
})
export class UserNewComponent implements OnInit {
  newUser = new User(0);
  @Output() createNewUserEvent = new EventEmitter();

  constructor() { }

  ngOnInit() {
  }

  create() {
    // call server to save
    this.createNewUserEvent.emit(this.newUser);
    this.newUser = new User(0);
  }
}
