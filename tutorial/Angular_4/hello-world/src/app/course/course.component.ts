import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-course',
  template: '<H1>Mon second Component</H1>',
  styles: [`
    H1 {
      color:blue;
    }`]
})
export class CourseComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }

}
