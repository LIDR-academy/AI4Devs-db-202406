import { Company } from "./Company";
import { Interview } from "./Interview";

export class Employee {
    id?: number;
    companyId: number;
    name: string;
    email: string;
    role: string;
    isActive: boolean;
    company: Company;
    interviews: Interview[];

    constructor(data: any) {
        this.id = data.id;
        this.companyId = data.companyId;
        this.name = data.name;
        this.email = data.email;
        this.role = data.role;
        this.isActive = data.isActive;
        this.company = data.company;
        this.interviews = data.interviews || [];
    }
}