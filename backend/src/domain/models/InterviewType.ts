import { InterviewStep } from "./InterviewStep";

export class InterviewType {
    id?: number;
    name: string;
    description: string;
    interviewSteps: InterviewStep[];

    constructor(data: any) {
        this.id = data.id;
        this.name = data.name;
        this.description = data.description;
        this.interviewSteps = data.interviewSteps || [];
    }
}