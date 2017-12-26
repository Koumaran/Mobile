import { HttpClient } from '@angular/common/http';
import { User } from './../user/user';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs/Observable';
import { of } from 'rxjs/observable/of';
import { catchError, map, tap } from 'rxjs/operators';
import { Http } from '@angular/http';
import { RequestOptions } from '@angular/http/src/base_request_options';
import { Headers } from '@angular/http/src/headers';
import { MessageService } from './message.service';


@Injectable()
export class UserService {

  userURL = '/users/';

  constructor(private _http: HttpClient, private messageService: MessageService) { }

// A revoir la gestion des erreur sur api REST ici
  private handleError<T> (operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      // TODO: send the error to remote logging infrastructure
      console.log('handleError :');
      console.log(error); // log to console instead

      // let the app keep running by returning an empty result
      return of(result as T);

    };
  }

  getUsers(): Observable<User[]> {
    return this._http.get<User[]>(this.userURL)
      .pipe(
        catchError(this.handleError('getUsers', []))
      );
  }

// a corriger
  getUser(user: User) {
    return this._http.get<User>(this.userURL + user._id).pipe(
      catchError(this.handleError<User>('getHero id=${user._id}'))
    );
  }

  getUserByPseudo(inconnu: any): Observable<User> {
    return this._http.post<User>(this.userURL + inconnu.pseudo, inconnu).pipe(
      catchError(this.handleError<User>('getUserByPseudo = ${pseudo}'))
    );
  }

  create(newUser: User): Observable<User> {
    return this._http.post<User>('/users', newUser).pipe(
      catchError(this.handleError<User>('create User)'))
    );
  }

  destroy(user: User): Observable<User> {
    return this._http.delete<User>('/users/' + user._id).pipe(
      catchError(this.handleError<User>('deleted User'))
    );
  }

  update(user: User): Observable<any> {
    return this._http.put('/users/' + user._id, user).pipe(
      catchError(this.handleError<any>('updateUser'))
    );
  }



}
