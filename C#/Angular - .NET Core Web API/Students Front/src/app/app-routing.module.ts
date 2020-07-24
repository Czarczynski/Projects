import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { StudentsComponent } from './students/students.component';
import { StudentDetailComponent } from '../app/student-detail/student-detail.component';
import { AboutComponent } from '../app/about/about.component';
const routes: Routes = [{ path: 'about', component: AboutComponent },{ path: 'detail/:id', component: StudentDetailComponent },{ path: '', redirectTo: '/students', pathMatch: 'full' },{ path: 'students', component: StudentsComponent }];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
  
})
export class AppRoutingModule { }
