import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-salarier',
  templateUrl: './salarier.component.html',
  styleUrls: ['./salarier.component.scss']
})
export class SalarierComponent implements OnInit {

  salariers: any[] = [
    {'sexe': 'male', 'nom': 'sivanesan', 'prenom': 'jegathas', 'dateDeNaissance': '15/07/1989'},
    {'sexe': 'femelle', 'nom': 'kugathas', 'prenom': 'kirthana', 'dateDeNaissance': '18/02/1994'},
    {'sexe': 'femelle', 'nom': 'kugathas', 'prenom': 'kirthana', 'dateDeNaissance': '18/02/1994'},
    {'sexe': 'femelle', 'nom': 'kugathas', 'prenom': 'kirthana', 'dateDeNaissance': '18/02/1994'},
    {'sexe': 'femelle', 'nom': 'kugathas', 'prenom': 'kirthana', 'dateDeNaissance': '18/02/1994'},
    {'sexe': 'femelle', 'nom': 'kugathas', 'prenom': 'kirthana', 'dateDeNaissance': '18/02/1994'},
    {'sexe': 'femelle', 'nom': 'kugathas', 'prenom': 'kirthana', 'dateDeNaissance': '18/02/1994'},
    {'sexe': 'femelle', 'nom': 'kugathas', 'prenom': 'kirthana', 'dateDeNaissance': '18/02/1994'},
    {'sexe': 'femelle', 'nom': 'kugathas', 'prenom': 'kirthana', 'dateDeNaissance': '18/02/1994'},
];

  constructor() { }

  ngOnInit() {
  }

}
