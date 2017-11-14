import { Injectable } from '@angular/core';
import { Http, Headers, RequestOptions } from '@angular/http';
import 'rxjs/add/operator/map';

@Injectable()
export class DataService {

  result: any;

  constructor(private _http: Http) { }

  getUsers() {
    return this._http.get('/api/users')
      .map(result => this.result = result.json().data);
  }

  saveUser(user) {
    this._http.post('/api/users', user)
      .subscribe(res => {
        console.log('User successfully added');
      }, (err) => {
        console.log(err);
      });
  }
}
