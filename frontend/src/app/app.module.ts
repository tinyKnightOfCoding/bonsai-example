import {NgModule} from '@angular/core';
import {BrowserModule} from '@angular/platform-browser';

import {AppComponent} from './app.component';
import {ApiModule, Configuration, ConfigurationParameters} from "../api";
import {HttpClientModule} from "@angular/common/http";

export function apiConfigFactory(): Configuration {
  const params: ConfigurationParameters = {
    basePath: '/api',
  };
  return new Configuration(params);
}

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    ApiModule.forRoot(apiConfigFactory),
    HttpClientModule,
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
