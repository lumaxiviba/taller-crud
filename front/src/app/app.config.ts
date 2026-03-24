import { ApplicationConfig, provideBrowserGlobalErrorListeners } from '@angular/core';
import { provideRouter } from '@angular/router';

import { routes } from './app.routes';
import { provideHttpClient, withFetch, withInterceptors } from '@angular/common/http'; // <- Agregamos withInterceptors aquí
import { HashLocationStrategy, LocationStrategy } from '@angular/common';
import { jwtInterceptor } from './interceptors/jwt-interceptor';

export const appConfig: ApplicationConfig = {
  providers: [
    provideBrowserGlobalErrorListeners(),
    provideRouter(routes),
    // Mantenemos tu withFetch y le sumamos el interceptor
    provideHttpClient(withFetch(), withInterceptors([jwtInterceptor])),
    { provide: LocationStrategy, useClass: HashLocationStrategy },
  ],
};
