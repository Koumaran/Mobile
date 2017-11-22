export class User {
  constructor(
    public _id: string = '',
    public pseudo: string = '',
    public first_name: string = '',
    public last_name: string = '',
    public password: string = '',
    public email: string = '',
    public editable: boolean = false
  ) {}
}

