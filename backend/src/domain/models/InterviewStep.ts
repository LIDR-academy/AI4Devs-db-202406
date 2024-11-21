import { Interview } from "./Interview";
import { InterviewFlow } from "./InterviewFlow";
import { InterviewType } from "./InterviewType";

export class InterviewStep {
    id?: number;
    interviewFlowId: number;
    interviewTypeId: number;
    name: string;
    orderIndex: number;
    interviewFlow: InterviewFlow;
    interviewType: InterviewType;
    interviews: Interview[];

    constructor(data: any) {
        this.id = data.id;
        this.interviewFlowId = data.interviewFlowId;
        this.interviewTypeId = data.interviewTypeId;
        this.name = data.name;
        this.orderIndex = data.orderIndex;
        this.interviewFlow = data.interviewFlow;
        this.interviewType = data.interviewType;
        this.interviews = data.interviews || [];
    }
}