import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { StudentService } from '../student.service';
import { Student } from '../student';
@Component({
  selector: 'app-student-detail',
  templateUrl: './student-detail.component.html',
  styleUrls: ['./student-detail.component.css'],
})
export class StudentDetailComponent implements OnInit {
  constructor(
    private route: ActivatedRoute,
    private studentService: StudentService,
    private location: Location
  ) {}
  student = null;

  getStudent(): void {
    const id = +this.route.snapshot.paramMap.get('id');
    this.studentService
      .getStudent(id)
      .subscribe((student) => (this.student = student));
  }

  goBack(): void {
    this.location.back();
  }

  ngOnInit(): void {
    this.getStudent();
  }
  save(): void {
    this.studentService
      .updateStudent(this.student)
      .subscribe(() => this.goBack());
  }
}
