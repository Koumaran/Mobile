import { Component } from '@angular/core';

// import data Service
import { DataService } from './data.service';

@Component({
  selector: 'mat-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  // define a users property to hold our user data
  users: Array<any>;

  // Create an instance of the DataService through dependency injection
  constructor(private _dataService: DataService) {
    // Access the Date Service's getUsers() method we defined
    this._dataService.getUsers()
      .subscribe(res => this.users = res);
  }
}
