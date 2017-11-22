import { LoginService } from './services/login.service';
import { AuthentificationGuard } from './guard/authentification.guard';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Router } from '@angular/router';
import { AppRoutingModule } from './app-routing.module';


import { AppComponent } from './app.component';

// import Http Module and our Data Service
import { HttpModule } from '@angular/http';
// User
import { UserService } from './services/user.service';
import { UserComponent } from './user/user.component';
import { UserDetailsComponent } from './user/user-details/user-details.component';
import { UserListComponent } from './user/user-list/user-list.component';
import { UserNewComponent } from './user/user-new/user-new.component';
import { UserEditComponent } from './user/user-edit/user-edit.component';
import { AuthentificationComponent } from './authentification/authentification.component';
import { HomeComponent } from './home/home.component';
import { NotFoundComponent } from './not-found/not-found.component';

@NgModule({
  declarations: [
    AppComponent,
    UserComponent,
    UserDetailsComponent,
    UserListComponent,
    UserNewComponent,
    UserEditComponent,
    AuthentificationComponent,
    HomeComponent,
    NotFoundComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpModule,
    FormsModule
  ],
  providers: [UserService, AuthentificationGuard, LoginService],
  bootstrap: [AppComponent]
})
export class AppModule {
  constructor(router: Router) {
    console.log('Routes: ', JSON.stringify(router.config, undefined, 2));
  }
}
