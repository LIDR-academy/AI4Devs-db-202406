import { InterviewStep } from "./InterviewStep";
import { Position } from "./Position";

export class InterviewFlow {
    id?: number;
    description: string;
    interviewSteps: InterviewStep[];
    positions: Position[];

    constructor(data: any) {
        this.id = data.id;
        this.description = data.description;
        this.interviewSteps = data.interviewSteps || [];
        this.positions = data.positions || [];
    }
}