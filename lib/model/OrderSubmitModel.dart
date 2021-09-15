class OrderSubmitModel {
  String? Id;
  String? State;
  String? Category;
  String? ArrivalDate;
  String? FullName;
  String? Cin;
  String? Company;
  String? RegistrationNumber;
  String? BadgeNumber;
  String? Person;
  String? AuthorizedBy;
  String? FirePermit;
  String? Email;
  String? ReleaseDate;
  String? EntryDate;
  String? SenderEmail;

  OrderSubmitModel({
    this.Id,
    this.State,
    this.Category,
    this.ArrivalDate,
    this.FullName,
    this.Cin,
    this.Company,
    this.RegistrationNumber,
    this.BadgeNumber,
    this.Person,
    this.AuthorizedBy,
    this.FirePermit,
    this.Email,
    this.ReleaseDate,
    this.EntryDate,
    this.SenderEmail,
  });

  OrderSubmitModel.fromJson(Map<String, dynamic> json) {
    Id = json['Id'];
    State = json['State'];
    Category = json['Category'];
    ArrivalDate = json['ArrivalDate'];
    FullName = json['FullName'];
    Cin = json['Cin'];
    Company = json['Company'];
    RegistrationNumber = json['RegistrationNumber'];
    BadgeNumber = json['BadgeNumber'];
    Person = json['Person'];
    AuthorizedBy = json['AuthorizedBy'];
    FirePermit = json['FirePermit'];
    Email = json['Email'];
    ReleaseDate = json['ReleaseDate'];
    EntryDate = json['EntryDate'];
    SenderEmail = json['SenderEmail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.Id;
    data['State'] = this.State;
    data['Category'] = this.Category;
    data['ArrivalDate'] = this.ArrivalDate;
    data['FullName'] = this.FullName;
    data['Cin'] = this.Cin;
    data['Company'] = this.Company;
    data['RegistrationNumber'] = this.RegistrationNumber;
    data['BadgeNumber'] = this.BadgeNumber;
    data['Person'] = this.Person;
    data['AuthorizedBy'] = this.AuthorizedBy;
    data['FirePermit'] = this.FirePermit;
    data['Email'] = this.Email;
    data['ReleaseDate'] = this.ReleaseDate;
    data['EntryDate'] = this.EntryDate;
    data['SenderEmail'] = this.SenderEmail;
    return data;
  }

  String toParams() => "?Id=$Id&State=$State&Category=$Category"
      "&ArrivalDate=$ArrivalDate&FullName=$FullName&Cin=$Cin"
      "&Company=$Company&RegistrationNumber=$RegistrationNumber"
      "&BadgeNumber=$BadgeNumber&Person=$Person"
      "&AuthorizedBy=$AuthorizedBy&FirePermit=$FirePermit"
      "&Email=$Email&ReleaseDate=$ReleaseDate"
      "&EntryDate=$EntryDate&SenderEmail=$SenderEmail";
}
