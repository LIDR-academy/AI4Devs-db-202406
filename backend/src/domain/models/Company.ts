import { Employee } from "./Employee";
import { Position } from "./Position";

export class Company {
    id?: number;
    name: string;
    employees: Employee[];
    positions: Position[];

    constructor(data: any) {
        this.id = data.id;
        this.name = data.name;
        this.employees = data.employees || [];
        this.positions = data.positions || [];
    }
}