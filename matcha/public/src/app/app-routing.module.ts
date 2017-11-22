import { AuthentificationGuard } from './guard/authentification.guard';
import { AuthentificationComponent } from './authentification/authentification.component';
import { HomeComponent } from './home/home.component';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AppComponent } from './app.component';
import { NotFoundComponent } from './not-found/not-found.component';


const routes: Routes = [
  { path: '', component: HomeComponent, canActivate: [AuthentificationGuard] },
  { path: 'login', component: AuthentificationComponent },
  { path: '**', redirectTo: ''}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
