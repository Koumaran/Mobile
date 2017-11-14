import { CoursesService } from './course/courses.service';
import { CoursesComponent } from './courses.component';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { CourseComponent } from './course/course.component';
import { CadreComponent } from './course/cadre.component';

@NgModule({
  declarations: [
    AppComponent,
    CoursesComponent,
    CourseComponent,
    CadreComponent
  ],
  imports: [
    BrowserModule
  ],
  providers: [CoursesService],  //inserer les dépendance
  bootstrap: [AppComponent]
})
export class AppModule { }
