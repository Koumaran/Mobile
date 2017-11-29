import { MessageService } from './../services/message.service';
import { Component, OnInit, ViewEncapsulation } from '@angular/core';

@Component({
  selector: 'mat-alert',
  templateUrl: './alert.component.html',
  styleUrls: ['./alert.component.css'],
  encapsulation: ViewEncapsulation.None
})
export class AlertComponent implements OnInit {

  constructor(public messageService: MessageService) { }

  ngOnInit() {
  }

}
