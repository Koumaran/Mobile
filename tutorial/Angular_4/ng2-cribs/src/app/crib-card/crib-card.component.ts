import { Component, OnInit, Input } from '@angular/core';
import { Crib } from '../crib';

@Component({
  selector: 'app-crib-card',
  templateUrl: './crib-card.component.html',
  styleUrls: ['./crib-card.component.css']
})
export class CribCardComponent implements OnInit {
  // récuperation de l'envoie du ficheir par input dans crib-listening-html
  @Input('crib') crib: Crib;
  constructor() { }

  ngOnInit() {
  }

}
