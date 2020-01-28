class GqlData {}

class GqlQuery extends GqlData {
  // GqlUser user;
  // GqlLoan loan;
  // GqlQr qr;
  // Props globalProps;
  // GqlLoanHelp loanHelp;
  // ServerTime serverTime;
  // CashbackReport report;
  // KycData kycData;

  // GqlQuery({
  //   this.user,
  //   this.loan,
  //   this.qr,
  //   this.globalProps,
  //   this.loanHelp,
  //   this.serverTime,
  //   this.report,
  //   this.kycData,
  // });

  GqlQuery.parse(Map<String, dynamic> response) {
    //   if (response['user'] != null) user = GqlUser.parse(response['user']);
    //   if (response['loan'] != null) loan = GqlLoan.parse(response['loan']);
    //   if (response['qr'] != null) qr = GqlQr.parse(response['qr']);
    //   if (response['globalProps'] != null)
    //     globalProps = Props.parse(response['globalProps']);
    //   if (response['help'] != null)
    //     loanHelp = GqlLoanHelp.parse(response['help']);
    //   if (response['serverTime'] != null)
    //     serverTime = ServerTime.parse(response['serverTime']);
    //   if (response['report'] != null)
    //     report = CashbackReport.parse(response['report']);
    //   if (response['kyc'] != null) {
    //     kycData = KycData.parse(response['kyc']);
    //   }
    //   // if (response['kyc'] != null) {
    //   //   var kyc = response['kyc'];
    //   // }
  }
}

class GqlMutation extends GqlData {
  // GqlRegister register;
  // GqlLoanToken apply;
  // GqlLoanAccept accept;
  // NotificationReadAll readAll;
  // CreateReport createReport;
  // GqlDelete delete;
  // KycSubmit kycSubmit;

  // GqlMutation({
  // this.register,
  // this.apply,
  // this.accept,
  // this.readAll,
  // this.kycSubmit,
  // });

  GqlMutation.parse(Map<String, dynamic> response) {
    // if (response['register'] != null)
    //   register = GqlRegister.parse(response['register']);
    // if (response['apply'] != null)
    //   apply = GqlLoanToken.parse(response['apply']);
    // if (response['accept'] != null)
    //   accept = GqlLoanAccept.parse(response['accept']);
    // if (response['readAll'] != null)
    //   readAll = NotificationReadAll.parse(response['readAll']);
    // if (response['createReport'] != null)
    //   createReport = CreateReport.parse(response['createReport']);
    // if (response['delete'] != null)
    //   delete = GqlDelete.parse(response['delete']);
    // if (response['submitKyc'] != null) {
    //   kycSubmit = KycSubmit.parse(response['submitKyc']);
    // }
  }
}
