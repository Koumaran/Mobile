import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { LoginService } from '../services/login.service';

@Component({
  selector: 'mat-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css'],
  encapsulation: ViewEncapsulation.None
})
export class HomeComponent implements OnInit {

  constructor(public loginService: LoginService) { }

  ngOnInit() {
  }

}
