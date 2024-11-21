import { Application } from "./Application";
import { Employee } from "./Employee";
import { InterviewStep } from "./InterviewStep";

export class Interview {
    id?: number;
    applicationId: number;
    interviewStepId: number;
    employeeId: number;
    interviewDate: Date;
    result: string;
    score: number;
    notes: string;
    application: Application;
    interviewStep: InterviewStep;
    employee: Employee;

    constructor(data: any) {
        this.id = data.id;
        this.applicationId = data.applicationId;
        this.interviewStepId = data.interviewStepId;
        this.employeeId = data.employeeId;
        this.interviewDate = new Date(data.interviewDate);
        this.result = data.result;
        this.score = data.score;
        this.notes = data.notes;
        this.application = data.application;
        this.interviewStep = data.interviewStep;
        this.employee = data.employee;
    }
}