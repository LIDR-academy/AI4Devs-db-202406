import { Candidate } from "./Candidate";
import { Interview } from "./Interview";
import { Position } from "./Position";

export class Application {
    id?: number;
    positionId: number;
    candidateId: number;
    applicationDate: Date;
    status: string;
    notes: string;
    position: Position;
    candidate: Candidate;
    interviews: Interview[];

    constructor(data: any) {
        this.id = data.id;
        this.positionId = data.positionId;
        this.candidateId = data.candidateId;
        this.applicationDate = new Date(data.applicationDate);
        this.status = data.status;
        this.notes = data.notes;
        this.position = data.position;
        this.candidate = data.candidate;
        this.interviews = data.interviews || [];
    }
}