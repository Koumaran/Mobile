import { DataService } from './../data.service';
import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'mat-create-user',
  templateUrl: './create-user.component.html',
  styleUrls: ['./create-user.component.css'],
  encapsulation: ViewEncapsulation.None
})
export class CreateUserComponent implements OnInit {

  user = {};

  constructor(private dataService: DataService) { }

  ngOnInit() {
  }

  createUser() {
    this.dataService.saveUser(this.user);
  }

}
