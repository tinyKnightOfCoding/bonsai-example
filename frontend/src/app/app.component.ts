import {Component} from '@angular/core';
import {ApiInfo, DefaultService} from "../api";
import {Observable} from "rxjs";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  title = 'frontend'
  readonly apiInfo$: Observable<ApiInfo>

  constructor(defaultService: DefaultService) {
    this.apiInfo$ = defaultService.apiInfoGet()
  }
}
