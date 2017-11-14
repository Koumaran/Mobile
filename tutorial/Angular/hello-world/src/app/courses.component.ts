import { CoursesService } from './course/courses.service';
import { Component } from '@angular/core'; //importation du component décorateur
//appel du décorator
@Component({
    selector: 'courses',
    template: `
        <H2>{{ title }}</H2>
        <UL>
            <LI *ngFor="let course of courses">
                {{ course }}
            </LI>
        </UL>
    ` 
})
export class CoursesComponent {
    title = "List of courses";
    courses;

    constructor(service: CoursesService) {
        this.courses = service.getCourses();
    }

    getTitle() {
        return this.title;
    }
}