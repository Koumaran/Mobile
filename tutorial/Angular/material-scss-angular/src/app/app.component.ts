import { Component, OnInit } from '@angular/core';

import { OverlayContainer } from '@angular/material';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  title = 'app';
  theme = 'my-theme';

  constructor(
    private overlayContainer: OverlayContainer
  ) {}

  ngOnInit() {
    this.overlayContainer.getContainerElement().className = this.theme;
  }
  onThemeChange() {
    this.overlayContainer.getContainerElement().className = this.theme;
  }

}

