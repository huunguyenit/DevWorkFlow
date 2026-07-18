<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenRequestCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\ExternalCheckVoucherNumber.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY CommandExternalFieldDeclare SYSTEM "..\Include\Command\ExternalFieldDeclare.txt">
  <!ENTITY CommandExternalFieldSelect SYSTEM "..\Include\Command\ExternalFieldSelect.txt">
  <!ENTITY CommandExternalFieldSet SYSTEM "..\Include\Command\ExternalVoucherFieldAssign.txt">
  <!ENTITY CommandExternalFieldQuery SYSTEM "..\Include\Command\ExternalVoucherFieldQuery.txt">
  <!ENTITY CommandCheckDetailInputVATInvoice SYSTEM "..\Include\Command\CheckTaxGridDetailInputVATInvoice.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptCurrency SYSTEM "..\Include\Javascript\Currency.txt">
  <!ENTITY ScriptExchangeRate SYSTEM "..\Include\Javascript\ExchangeRate.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherDate.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">
  <!ENTITY ScriptVerifyInputVATInvoiceNumber SYSTEM "..\Include\Javascript\VerifyInputVATInvoiceNumber.txt">
  <!ENTITY BeforeUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\BeforeUpdateCurrentCustomerBalance.txt">
  <!ENTITY AfterUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\AfterUpdateCurrentCustomerBalance.txt">

  <!ENTITY BeforeVoucherUpdate "if exists(select 1 from @@prime$partition$previous where stt_rec = @stt_rec and status &lt;&gt; '0') exec FastBusiness$Voucher$BeforeUpdate$PaymentRequest @@prime$partition$previous, 'd51$$partition$previous', @stt_rec, @@action, '52', @@userID">
  <!ENTITY AfterVoucherUpdate "if exists(select 1 from @@prime$partition$current where stt_rec = @stt_rec and status &lt;&gt; '0') exec FastBusiness$Voucher$AfterUpdate$PaymentRequest @@prime$partition$current, 'd51$$partition$current', @stt_rec, @@action, '52', @@userID">


  <!ENTITY XMLTaxMasterFields SYSTEM "..\Include\XML\TaxMasterFields.txt">
  <!ENTITY ScriptVerifyInputVATInvoiceNumberExternal SYSTEM "..\Include\Javascript\VerifyInputVATInvoiceNumberExternal.txt">

  <!ENTITY CommandTaxGridDetailInitExternalFields SYSTEM "..\Include\Command\TaxGridDetailInitExternalFields.txt">
  <!ENTITY CommandTaxGridDetailExternalFieldQuery SYSTEM "..\Include\Command\TaxGridDetailExternalVoucherFieldQuery.txt">
  <!ENTITY CommandTaxGridDetailInserting SYSTEM "..\Include\Command\TaxGridDetailInserting.txt">
  <!ENTITY CommandTaxGridDetailUpdated SYSTEM "..\Include\Command\TaxGridDetailUpdated.txt">
  <!ENTITY ScriptTaxGridDetailCurrencyTotalFields SYSTEM "..\Include\Javascript\TaxGridDetailCurrencyTotalFields.txt">
  <!ENTITY ScriptTaxGridDetailCurrencyExpression SYSTEM "..\Include\Javascript\TaxGridDetailCurrencyExpression.txt">
  <!ENTITY TaxGridDetailTable "d51">
  <!ENTITY TaxGridDetailWhereType "loai_ct &lt;&gt; '#'">
  <!ENTITY TaxGridDetailPaymentTerm "@ma_tt">
  <!ENTITY TaxGridDetailTableTax "#t51">

  <!ENTITY PaymentRequestCheckingTitle.v "Thông tin mã khách của phiếu chi phải giống với đề nghị chi tiền.">
  <!ENTITY PaymentRequestCheckingTitle.e "Cash disbursement should have same customer information as supplier payment request.">
  <!ENTITY % PaymentRequest SYSTEM "..\Include\PaymentRequest.ent">
  %PaymentRequest;

  <!ENTITY % Deductible SYSTEM "..\Include\Deductible.ent">
  %Deductible;

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY c "CDDeductible">
  <!ENTITY h1 "769">
  <!ENTITY h2 "144">
  <!ENTITY k "stt_rec">
  <!ENTITY i "4">
  <!ENTITY Tag "k51">
  <!ENTITY Table "k51$000000">

  <!ENTITY % PaymentApproval SYSTEM "..\Include\PaymentApproval.ent">
  %PaymentApproval;

  <!ENTITY APVController "CDApproval">
  <!ENTITY APVApprovalType "00620">
  <!ENTITY APVDetailTable "d51">
  <!ENTITY APVHisTable "a51$000000">
  <!ENTITY APVCheckCategory "case when @ma_dvcs = '' then @@unit else rtrim(@ma_dvcs) end + char(253) + rtrim(@ma_kh) + char(253) + rtrim(@tk) + char(253) + rtrim(@ma_nt) + char(253) + rtrim(@t_tt_nt)">
  <!ENTITY APVVisibleStatusNum "3">
  <!ENTITY APVHiddenStatusNum "2">
  <!ENTITY APVStatusNoAction "0">
  <!ENTITY APVStatusOpen "1">
  <!ENTITY APVStatusApprove "2">
  <!ENTITY APVStatusClose "4">
  <!ENTITY APVStatusPending "9">
  <!ENTITY APVCategoryIndex "10">


  <!ENTITY PostNotifyGroup "17">
  <!ENTITY PostNotifyCreate "exec rs_CreateNotifyCDTran @stt_rec, 'm51$$partition$current', 'd51$$partition$current', '#notifyContent'">

  <!ENTITY f ", @supplier as ten_ncc, @taxID as ma_so_thue">

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCt0aOQNL4YZtIR/7A4GjrqJGUTSHjPfAJKTT4s2Y8zaO+bko4Y31L7aBjDCeSJrXI+CE/ByA9fS+toxCDmjZm8Q==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG0zXlmT/X5o5sHm3fx0wwsjNfmt4fDaLNEjyFUIXEPNQceZl51EUAHanM0qDvOa2Jdfi8wz4YCxErwCN7gkuoyToBdlEJTtvfAzBbP8jRJ2IAoAQ3Fm7xEwdJ7OTAkTDypm3ri3EdOH7yhjdwzLWe0bFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$knoOckCk6knYGNO/UXETAzxNorSsf/WfjJv4XJH4EpxOFCynwVaZ9EUzUwz95F75S6FQt4RAVRO9naQRLaXCc+y3jH7JsZIl9gml8/6bGPJ4ivwzj13gv+P3+VsV0nfv4dAzVQB5WivAPCRjQopgNQ==FastBusiness.Encryption.End&APVPostGetStatusNext;FastBusiness.Encryption.Begin$Eo6wOI+nr7h2is8uSCzTQlYC3bgi+rznsyEkmCcM4D4=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1Dbick6LAtk5oYCMAU6Lzv/efi2AZILWqTJ5lRUlh/rrGYlRrKvYjnlfkDRaaQLTT+XbYjfCfAW7RLJEdEB3cSIrXA=FastBusiness.Encryption.End&TaxGridDetailTableTax;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22Vg4qDelMPNabw7bNBtkQ+A=FastBusiness.Encryption.End&APVPostCondition;FastBusiness.Encryption.Begin$9bBXgmS4IUqbn/cYhF1UTEik6IprX+VGjR6B1rPDAuj1bEUl+AHw7D3hkNGP3jk0JEju64p/DFuoXUuvUhRJwXbR6a5bOdT3JStV9KM+uCdlOiGU6RBK+WnEQbi1qEn1kk/TG+zRkPQ8io7XH8Q8tg==FastBusiness.Encryption.End&TaxGridDetailWhereType;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4ZaZ2xxNsus5WCEhdkxjbHzcefuI5Ld8dmn0bi8eSfo9fpf726Gg+SZCvMgbCkte8g==FastBusiness.Encryption.End&TaxGridDetailTableTax;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22Uc8PCIngpJCx55iL9VgG5+zozTcVapBOJo/2arQ+vceFastBusiness.Encryption.End&APVPostGetStatusNext;FastBusiness.Encryption.Begin$/RSNPGCNQdOpUiaA6NGaHuC7UxDArjB3p8UNSGQIsq6vZiTI5mB9o90DqGXyEnyZGPWZzRbUiDWLxVMm91WrfrG1CMCiAyY6024PjP59O3IU3l2ihDbIM4b8BGl6XRR8Km4y3NA/U4wieNurKWIGgR6qxvHylbvcrOB3PBaCeiB6507pKgB8t1zDWgPFKX8Hq2iXrqVP+gZOPBKfNVd8fVdZx2/s1jZtPY0X5ByFDX9hWZg1nbEUd5OvM8+3JMdK5JNMtm3opUA0hVmw9TR5dM/vURMgO26xBxCar/vccd7ltbLALBbZvq1Ro1vrqxvbFastBusiness.Encryption.End&DeductibleOption;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4faKNU5ZoNjfeuXdqiFOqNvXJR9WhcrWOpqoTU9OzB6V7gIDThizSK86UuiA0OBES263R6hiIjn1iNp+1HAH/IzHq3dfu60ZlcaOg9HNb6yjel0T/jZUOnOC4/2F4ku24oKQWepj/4N/zHLRfM2ohjc=FastBusiness.Encryption.End&DeductibleOption;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4WOKuXudXrKyPRxH0sEYkHZlyN/atoxLWEc0VjZzP+eTEoZ9rMrSgymkQyHxNECL7bocgJayyvDkFSkjhxVftSDD2iQOVXsysThrbgAspFeptTLn2Qqf74jEZk2vjzf8MgobSRHjwwnySVDuKQK9kzTpVKAQ0cmLOJ4cun/GCdgiOJ379gdLYY5EZ7W8ncg/j9plBjbd19RWdvP9Yc3VgbI=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbifM/+VqapwAfKVezvG0zuLHSAKcGhKTlgDI12W+tFKfasHelOivDpsFHyDXOxyX8vUKpFye2o/V7pKNR63XVaI6JGMsjmhSjZNj01AiijCsOrnBf6UA64lY4FWYJDT3TFigdr4MQS7jkCPCE+920mWc4HTUT+diazTqThjAfGREnbjisBtDvMTntHCwv0nnZZA==FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaXSsA8MNHKsJ1gqsCW8zfkeCLI9UMD1CvGsvBFI9v2YhQ==FastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu3hqKphew81XOcqNszTkiBR6QFMtdosKn7S900/0wB2OYfYV+xEEjPJ1rZKKtBXH2VHiWwYVQUczolxg4bGs2pvJA7vfzC+xGZPpFZ4wD3gd/F0HMGLjlEHM0sQUA5LSEZXjfIllZCw2YIs7YkWhtl8=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUSEoXq01bMQnNA7AMkzvaA+jwMclBPnRtg2Z9h6hjFarURd/4k1qUoX4D0V8npXLa2jtOf7MMJYTPGYtwHTqPLkBXZIzi2PpH0ew/Mtgxfr+FastBusiness.Encryption.End">

  <!ENTITY CalculateBookExchangeRate "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5teddOpp4IPAroYCkT/JKhj0QXBsyUYQ70ObM6+LeIptpVk957tE1Q0SVln1g1GVWMOAN15T8Bbgr3B880hNxyfYIqyca4BFx/WyeO2PDZCrX4XANke46dzeHuDFdNwYLxuzlQQjNZ8VwK05mBsOe5bvk8qs+bmpwTRoWTxP680hI+YihxQokuHuQtXqj1FGHXauBbuoC/bOTI6zwodRUx6lMhW/K5Yqc5V8mLUvSUD61VbBUSJHPHwJEV6FhmNX8bWx2GeqVYwxTdgND0EoWf8MwyINUs9DZ34315CBiy44vNj+iRHjqxFkEEfhUhbmz7D7GgCzxJ0LM+HJ3H3XUQfaxVufcET6kYgMBXGZIR1ad4ywfrcZ55qS8Cb2hEUldyP5DxEeLTKfqRN22VXWvBwZZlT3EtTRTUgma9vqWIgJLotK2zd0/5PCTzyteOnuzgLYVdeQSBXs+x+7pfbPg8=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$TsvsXuBB21DvVUoCpdbLx5hjOaO4cpNFHBJ0jdvV4NN4aSP3K/+UlV+mvnzJok2gcX3Sfzw/V965ytgcZS5ZG1DZ+tB+j4JjAAZQxLWyhhXJUOof8fvdZ0Z5OVLWwMCrNkUUSoVFXnRQvT4nrPQcUs48hvlgXy3rbUODA2qmY4aeXJ6HjqwPnPnXlIDodk/A7kD4v9xImO285vCNWUam4g==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$TsvsXuBB21DvVUoCpdbLx6l7KS3Lv+uUjjerQmolft2gyEtT07qpMTVidC/2N9fkPFeT1QEOZn4NDTM7BYdS3f4kX6k9SqfLnUBpZTC3XvrBoms/r2UO3XbgvnlmUV6J23YOfpdIy5cnSijvEAWCO4O2zgmIoMh2jnVLoU3OWr2yRGrNxWPFoAJvBABO8ipixUZj0W9UaDN+0yHfNLSTe4TNQFMiVSYTYSFmGLBe7kghpeGRbUoIo3nVbYdadwc6J86RE89JBZC9eHIKIMw+qEFXzV7znzwI294GdH6DDY9r4hG/ry5b5omeVjhqRUPc33u0mMn3+k70pObo+BE91jLjDeq1Q09oYs8iMU9dJ9szCbbtj8oxJUPQ9hdFRpsmzzjyGM1XrjmDohE4eH3PeYPrN9pd2xOOf8dD2glr8hxZQl1P8mTI7w2e92EFp9euio6D4SKNrkX6sClNmDKQoQ==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$kEFDDs/h+4ZHLYm5skR13o4O3aQe+UWuJOzV+bTkr/O8IwpYSJOy2C8PRzLDJ22GsXhAnl3OOMsgMNax4lfIyGU9rXSa69+xkh+9Tp8PNMpEdKgNm5h+LFatx8NZCTT6Vvew6RdS+f/cU77llDQCEr30UCDJvQe02HcuIpDmZ6jL+b6tfiqDB43x4wscv2kwbhMiVrOoeC+1TB4jIaNWxrrcJtrABxW1XFLLs7M/RBOQb+U/HunefrDah83Z+cEPopzwVRq3xi7uoD/f3lvg5KKT1AhH8j6U7HEizWpAu03Za4uKifCbCJ70xnns0/GEiRB0KiXKWgjgdcEuYSiKVIX0tUxOZ6MmCiO/2RsbZvVBgbw33YzB4EfHqrrkXIdqSupzEnsxtXyj5iu1npz+5qBMmE2XWQvmDA7D0eksqUyKZfEr4r3r1/2M9TwhPdxAZIYKHLjPDLBRRvYgxnTBlMflsXrASL0SL5n0qQYoN9kT7cg9HcTdBbtcaY780oBhFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$XpMwRlifXC+7LVgM1zIOlZS1irsZ35Xvanwm8uWCOHkg3wUJmyvhPORbV1aVcuPqFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$kEFDDs/h+4ZHLYm5skR13mT7HE0VslOmcESTENtrMA2zaLRPcj53Oc0EypzdRSNgbnTsUE1EifgZqep7ILQSj/5nneWMzSPlZ/MReszxTKeJlTzflAUws2Rylq0RtFX3hxfcj7ff1bI7GOwDz8CWDaAgipRtAaqyx4xLF/2pHRuUqlvMxjRLktIJNpNfLcDE+MhI+7qVnRhU4NbB5jKWJZOKrqhwUrkyNru5iW69/dMmhbaP/KDInYvTpAtQeH16OAbBBizR4frVOcq+hJzWSczS6meBYzI4sjvbZXD8QDb0w5dHvvI2jNNUuTN4MXWEFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$ftRT+zHulynPZ1EjbodAkCtViXRgslKNyPk8l167u1Ld2i4Fm1Ppv3v6tikUxazBZKxqlhP62xoMZV+2ezGfQDFh3bJt/ZTwEtdCX5C4KXUPK/KzdTJD8sPB9ZHSawcq355ZMyDJYZf9Df85NjKhlLvzxowgM6Y/iAfhOXdSCdwxo4/YmCFkYrLUAjZaKhPUMRZUOnpIc5L6ZphhTflQV2mmkMcsJXR3BUDVgQaB3nX/Rvdv+mvlNMq7iEKqXdwJdWsYDJwycnxesoS5xn28PBdDBQjiSNGDJSr+Ncsf5IJZRR/M0qCwLpWwdhbOiMW9+LTtxgkBFflHPeeL2OdtmA==FastBusiness.Encryption.End">
  

  <!ENTITY CheckTaxCodeCondition "exists(select 1 from @r30 where ma_so_thue &lt;&gt; '')">
  <!ENTITY CheckTaxCodeConditionByCustomer "">
  <!ENTITY CheckTaxCodeFieldValue "'line_nbr, ma_so_thue'">
  <!ENTITY CheckTaxCodeDetailExt "
if @loai_ct = '9' and exists(select 1 from @d51 where ma_so_thue &lt;&gt; '') begin
  select line_nbr, rtrim(ma_so_thue) as ma_so_thue into #d51Tax from @d51 a where ma_so_thue &lt;&gt; '' and (a.ma_kh = '' or exists(select 1 from dmkh b where a.ma_kh = b.ma_kh and b.khong_kt_mst = 0))
  exec FastBusiness$System$CheckTaxCode &CheckTaxCodeFieldValue;, @t_yn output, @col output, '#d51Tax'
  if @t_yn = 0 and @$taxCodeInvalid is not null begin
    if @$taxCodeInvalid = '2' begin
      if isnull(@col, 0) &lt;&gt; 0 select @$taxCodescriptConflict = 'var f = this;var z = this.getItem(\''&TaxGridDetailTable;\'')._controlBehavior;var l = z._getColumnOrder(\''ma_so_thue\'');f._errorWarningObject = z._getItem(' + rtrim(@col) + ', l);if (f._errorWarningObject) {f.focus(\''&TaxGridDetailTable;\'');f._errorWarningObject.focus();}'
      select '' as field, @$taxCodeInvalidConflict as message, @$taxCodescriptConflict as script
      return
    end else &CheckTaxCodeTableQuerySelectWarning;
  end
end
">
  <!ENTITY % CheckTaxCode SYSTEM "..\Include\CheckTaxCode.ent">
  %CheckTaxCode;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.CDTran;
  %Extender.Ignore;
]>

<dir table="m51$000000" code="stt_rec" order="ngay_ct, so_ct" id="PC1" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu chi" e="Cash Disbursement"></title>
  <partition table="c51$000000" prime="m51$" inquiry="i51$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dia_chi" defaultValue="''">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="ong_ba">
      <header v="Người nhận tiền" e="Receiver"></header>
    </field>
    <field name="dien_giai">
      <header v="Lý do chi" e="Memo"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb6oCvCyvGNeTkvFCI1bz32ZJ8lXhThkCwWNnPFWt5zZ3A==</Encrypted>]]></clientScript>
    </field>

    <field name="tk" allowNulls="false" clientDefault="Default">
      <header v="Tài khoản có" e="Credit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Loại phiếu chi" e="Voucher Type"></header>
      <items style="AutoComplete" controller="TransactionType" reference="ten_loai%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="loai_ct$dmloaict.ten_loai%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4WPBY9Z4E2DttbNSMn4AfgyYnyMgEYD7WWfqa1ULxcB4azdnVto0vLlgYjf4L7+rk=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số phiếu chi" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb5BYwfrIxe7sbc0hyR4eVljmUTDHmx22aCjIAbE49BcDg==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày hạch toán" e="Posting Date"></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <label v="TGGD" e="Ex. Rate"></label>
      <footer v="&lt;span id='idf_ty_gia'>Tỷ giá&lt;/span>" e="&lt;span id='idf_ty_gia'>Ex. Rate&lt;/span>"></footer>
      <items style="Numeric"/>
    </field>
    <field name="ty_gia_ht" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1">
      <header v="Tỷ giá gs" e="Book Rate"></header>
      <footer v="&lt;span id='idf_ty_gia_ht'>Tỷ giá gs&lt;/span>" e="&lt;span id='idf_ty_gia_ht'>Book Rate&lt;/span>"></footer>
      <items style="Numeric"/>
    </field>

    <field name="status" inactivate="true" clientDefault="1">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        &APVStatusField;
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d51" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="144" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="CDDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="144" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Thuế" e="Tax"></label >
      <items style="Grid" controller="CDTax" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="ma_tt" categoryIndex="3" filterSource="Optional">
      <header v="Mã thanh toán" e="Payment Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="3">
      <header v="" e=""></header>
    </field>
    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right" allowNulls="true" categoryIndex="3">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="true" categoryIndex="3" filterSource="Optional">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
    </field>

    &DeductibleFields;

    <field name="hd_yn" type="Boolean" categoryIndex="-1">
      <header v="Theo dõi thanh toán" e="Payment Control"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJYsw8MgVJF8llh8nasSg9irUUqUUJilQAvJcTSxGsqm4fEFF0rHh1sl206GVPwGozt3N+0zZfCxUh8uUGFa0nGI=</Encrypted>]]></clientScript>
    </field>
    <field name="sua_tg_yn" type="Boolean" categoryIndex="-1">
      <header v="Sửa tỷ giá ghi sổ" e="Edit Book Exchange Rate"></header>
    </field>

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế nt" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán nt" e="Total"></header>
      <items style="Numeric"/>
    </field>

    <field name="so_ct_goc" type="Decimal" dataFormatString="##0" clientDefault="0" categoryIndex="9">
      <header v="Kèm theo" e="Include"></header>
      <items style="Numeric"/>
    </field>
    <field name="dien_giai_ct_goc" categoryIndex="9">
      <header v="Chứng từ gốc" e="Document(s)"></header>
    </field>

    <field name="ma_dvcs" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>

    <field name="tk_ex" external="true" hidden="true" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ten_tk_ex" external="true" hidden="true" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="serialize" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_ncc" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_so_thue" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_tt0" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_tt0" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    &XMLTaxMasterFields;
    &APVXMLFields;
    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="204" anchor="5" split="5">
      <item value="25, 75, 100, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0"/>
      <item value="10110-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk], [tk_ex]"/>
      <item value="10100-10011: [dia_chi].Label, [dia_chi], [ngay_lct].Label, [ngay_lct], [ten_tk_ex]"/>
      <item value="101---10011: [ong_ba].Label, [ong_ba], [ngay_ct].Label, [ngay_ct], [stt_rec]"/>
      <item value="10100-11010: [dien_giai].Label, [dien_giai], [ty_gia].Description, [ma_nt], [ty_gia]"/>
      <item value="10110-1001-: [loai_ct].Label, [loai_ct], [ten_loai%l], [ty_gia_ht].Description, [ty_gia_ht]"/>
      <item value="10110-110011: [tk].Label, [tk], [ten_tk%l], [status].Label, [status], [ten_ncc], [ma_so_thue]"/>

      <item value="1: [d51]" />
      <item value="1: [r30]" />

      &APVXMLViews;
      &ListView;
      &PostView;
      <item value="111: [ma_tt].Label, [ma_tt], [ten_tt%l]"/>
      <item value="11-1: [so_ct0].Label, [so_ct0], [ma_tt0]"/>
      <item value="11-11: [ngay_ct0].Label, [ngay_ct0], [ten_tt0], [ma_dvcs]"/>

      <item value="110111-10-1-: [hd_yn], [hd_yn].Label, [sua_tg_yn], [sua_tg_yn].Label, [t_tien].Label, [t_tien_nt], [t_tien]"/>
      <item value="-----1-10-11: [t_thue].Label, [t_thue_nt], [t_thue], [serialize]"/>
      <item value="-----1-10-11: [t_tt].Label, [t_tt_nt], [t_tt], [cookie]"/>

      &DeductibleViews;

      <item value="11: [so_ct_goc].Label, [so_ct_goc]"/>
      <item value="1100: [dien_giai_ct_goc].Label, [dien_giai_ct_goc]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="769" anchor="1">
          <header v="Thuế" e="Tax"/>
        </category>
        <category index="3" columns="100, 100, 553, 0" anchor="3" split="3">
          <header v="Thanh toán" e="Payment Control"/>
        </category>

        &DeductibleCategory;
        <category index="9" columns="100, 100, 237, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="5" split="5">
          <header v="Chứng từ gốc" e="Include"/>
        </category>
        &APVXMLCategoryIndex;
        &ListCategory;
        &PostCategory;
        <category index="-1" columns="25, 75, 100, 25, 212, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="5">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenVoucherInit;
    &ListShowing;

    <command event="Loading">
      <text>
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafSZKoXBsqMxMCcm/GnJvZS6Jw+L9o3i8vlXtpYszKcxmiq/zYMyXuyFs4NHmVv8A/A==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4IJ+zPBW2k+1o75apxCZqtKhplfE95GYnR72LWQuAaf0WScsbEbOocWKSomesoXWdyVhcbEWPKMRKTJ7qKefNslS</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWd6HaL1OGauusRtQb6bqs07xG6Qjwkz8N1z0TqPoMU5IOoFDY3nwNKOqVHA66gwNgja25/CKYoVnG6NbMSTqOa2WHsZV6QaseAnpSS1wXTh9x1cpNc03uvgYV5jR6N+rfrndZSc9gpzyamP7X1nhS5CKn8EDLWQ2hpHqEBrn4EwozwzG/Pkz8oASYw5SFBi2V901s1/At7x0nvYMX3Rp6Px3ZSkIiOCmkvR43hT7xELQw==</Encrypted>]]>
        &CommandExternalFieldSet;
        &CommandTaxGridDetailInitExternalFields;
        &APVInitExternalFieldsDeclare;
        &CommandExternalFieldQuery;&f;&CommandTaxGridDetailExternalFieldQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0z4sFwF7cdKnIcbhLvJe3kpBMrwoKl7v0r37zxXuk921kOQjf+yFYMzTtmusmdoreA==</Encrypted>]]>&APVInitExternalFieldsSelectWithComma;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJmqsAk72Ii7Myu4XNWxBZ7LFRJnpRsOvqw+sGYYBmMK</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        &CheckTaxCodeDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbZaAEVT0QhLeDz6F4WpGYKmrPKoJ9B/rHQ84ejexCmVWFQ9H/4TZB9T/SkgvfpVBp06DVl+3mlMZFesGS8lTBrNDqheNMEGt+wTkN+/1jdODdmUxCHl9zpSXOF0Z3vB8iRpPRnxKMjOBaarNgjnhhk0w5GpvM7NT+rlGdZI3GP4sh9pGSm/qUYmpwBu7NtAUc8RlXtVDSuw0ntutaDK5YQr/PSHZ8HehqtZJbpPFCNKgVjuPSO14asyesUIjTbWzGNz485jdFVh/s3coa7NHntniCyXszGPYAHl11TclPxdM=</Encrypted>]]>
        &DeclareDeductible;
      </text>
    </command>

    <command event="Inserting">
      <text>
        &APVCheckApprove;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        &CommandCheckDetailInputVATInvoice;
        &DeductibleInserting;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxkW8sDrYa7jtl7JPjw97A4kf4yyll/zk4Ipgz7w9PC700XJUr//DBLtLUOcj3l0w+4peLBffrk5avBSOMwEtDIBmPqrzmXm40+rnQdonaHdAwkVKLqLZgb70JrcJctyv3t5mkGqbgL1tfuBuOPCdCvP7luQaSMZF1pvRg34RTnvOlgoSDYzxPX69IXufMCia/p3250EJ3npol7r4um+1WNw==</Encrypted>]]>&APVTaxStatus;<![CDATA[<Encrypted>&EzmvBc3fRBsPI4PMR0gzcpc6xe17YUS9J/fxlx5c1aHQscVbJp0TOkSbu4tAhG0E56NrYI2HxvYRg9co7F3J6y2TPOMlZSUoc5Kn/dkLJP4=</Encrypted>]]>
        &DeductibleUpdateVariable;
        &CommandTaxGridDetailInserting;
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMDALuRxC7ca5zYrWSYQrQnjLlRYlsp6X95PEy47bENz4/wRyJKPhFb2Rbfepe7B6qe1y48vK6KuWqt2eXXuW3RDmr6twHwrZG+dP/mN2tNt</Encrypted>]]>
        &ListDeclare;
        &DeductibleInserted;
        &AfterUpdate;
        &APVApprove;
        &APVMailApproveInsert;
        &PaymentRequestAfterVoucherUpdate;
        &CalculateBookExchangeRate;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX1jx08uZVuaqldj6SW7K3SJMvpN8bZpxx4uP/JV8cdiJ39FgD14A4EeBl31lSuHjmUHC705TuhjfqMyfEVJMxt5r742Kgkyy8cjbJNqC0V3A</Encrypted>]]>
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ06Ke8n4vPs/ehmIOGgPHPqcMEhqFAT/BWR9WpMhwyr1bcL/bXh09/Q891ozl5l76y4JVkKGj1yP/PqFiwA6WE80nKG0SnTKQWmC9u3ExHAzWWnTGr5FZX4ubIEYj61aay3dfz5pdJ5n3MLskDFVJ2QU=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        &DeductibleUpdateting;
        &APVCheckApprove;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XXWFyhs69eHzp8/i9wp1tobbnNvqfo70W6adms42OArdV0dmflRXCx5gK7gbEPCx/UJbFG/9aAOm+Gk1DWIIlU=</Encrypted>]]>&CommandCheckDetailInputVATInvoice;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22eFQ+FudFLqOJ1ZESJzYLQHAonl12OcAa1gV0AuSXQHAufUdZspFsj14RsIZEDSQls7mU2h8Fo1F2bC0eHNtpDKnUmkDG6mvpNpmh1vIh8KrOOl3WvyYm3catbpEXDv6shq0GwVnuhDNHw+eh/QpNNCn13UpAjL35gXXHqpnn1g5G9DT8FgioHV9GNs1+Lt47Jlwe1FLLkT4Y55OIxnDkYA=</Encrypted>]]>
        &VoucherWhenBeforeUpdateLog;
        &PaymentRequestBeforeVoucherUpdate;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku1RWZghcYLLQJqufkEqkInwEyHlrqt3A+oKa867NMvaPqFvcdNq5tmZHme97V1OZFVz5/XGXhMp1twpWSksfApsSCAvO/wCFOiIX7QQlYopTFcbTWKIusTzlvOCPU/32Zw==</Encrypted>]]>&TaxGridDetailWhereType;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WjKvkqb9h7Fbg3EpXheaSx4LO+F84/73qkwd4Rrej3oKqvoPhIcYR+xvtpszous4LpEx6b+guMUBCgNzwG2EvoU5qzqNNGQzkec6n2VVKqZXwoWNX66d09gJYnPFmgJ8qoVyZsFxXecOXjmZ9KMvWytlaSytLta9LMri86Gj/PW5Zp+cywbVN/HPIUkQZboepDFCIxA9zysfvdim8ADY7I14WahZGeFSCqWXXxu0LTE/OhC96T6POwm74nwwh1mMNVjgd+cp0EG1ewhY8RpV1aevSym18Z9kGq+WRQQW9i41ZzH9MZK6VQnZrKlzloS0QROZBMkJ88ZreaKUCj+hkY8WyUG+3oYDIbEWZrlw+w5</Encrypted>]]>&APVTaxStatus;<![CDATA[<Encrypted>&EzmvBc3fRBsPI4PMR0gzcnlPuF++FQaz6MzGWQ1TMXxgw6yzGoNLKzww1npe67T2Q/whqdxEXXdnSXzvCbrWihiBhUs5DFL5V4SZ/9F7rA6oDYaiS4TIJaE31G6IXaaW</Encrypted>]]>&TaxGridDetailWhereType;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WewbsLXaFFdDrXw5epIQm15Z+iSXaaqRoKoWe2/DbC9wRSMnbJf0ePzglnfb2OTdkLjsTf+I++HqOCXeNUJtIIPfdwgiGJiL2im4K/10IsXAoxwps1y9ZCaqv9dlRWc5vQDVnI/v+J0o3aWx1G3XFPdqjCBx6cb8NX0TmPaCa7z</Encrypted>]]>&APVTaxStatus;<![CDATA[<Encrypted>&EzmvBc3fRBsPI4PMR0gzcnlPuF++FQaz6MzGWQ1TMXxgw6yzGoNLKzww1npe67T2wb6v7NDbqbrTO/1sDkFyvuqU6uIxioa/VwTFuMLJ2RMuRTt2YdpLYLCx4VWW22WPMv8JhgJRkSvtV4oKHW5m4hM69ZoruxfwPV7OJYQVsJU=</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22T7Il4rZU45nWHAq/BplJGBDO/sGQkJ8/2SVjTZc4PUmodydZtNQl5SgF2fUBCSCWRnqKK79pZpECLv5qur1AzKbSx88tbnf6+/I8/Bygru41xedpQd9MyIN8UCDdeqbVo0T52VC9/0DF9JslB9h1rPxQOqh2RKtrEWtccloiKUHevyaZHRneE+05BLPtf6dc2IjY0EFpQKigoNrxXoX0njR2VFoIf2qBBrN9TkTQGLuq/iSKl4yKzpWEVVOYm121A==</Encrypted>]]>
        &ListDeclare;
        &CommandTaxGridDetailUpdated;
        &AfterUpdate;
        &APVApprove;
        &APVMailApproveUpdate;
        &PaymentRequestAfterVoucherUpdate;
        &CalculateBookExchangeRate;
        &Delete;
        &DeductibleUpdateted;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        &EndUpdatedVoucherNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCEI6oJLQbWkY2jR385jsDpandBkYA8tYO4Ie6g6xWb7GldVzu/YXVMnI7NmpJ7G8vbyFyYNRKU/iAa+g4xWbW8=</Encrypted>]]>
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ01+OSZdDG39YiPtd29YZ6nuj+6nzgq7KWj2ItOQkHDzRFhJwtfUrG5bSzUUWdnFB3F2t+6VVl8pZapLeS47/qT5si9noftp4Vyq6xhmG2sWA</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5rTN1z2TAvRcHxKacuqFDum6oeRWvW/KZ/B4m76lkFxzatd8LehhuRyj5a5+zQtLbGb7DH5NlEN9HLnkSVTW/UqWlb/SospHgKoAChhGZuwi0qAGnOqnTMo3WtPN96aysoQfjnjOw8eGA/5+v2kn5D2RiuxaFXAdtHihHy+CUJ7Q==</Encrypted>]]>&PaymentRequestBeforeVoucherUpdate;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu14PKj4kTZpEXrfCacqnL7PWx6QYl9vfPUnFTlINWVQLOwnhINpfvGkcvmE1FEvm3xPmLae5iV/ZXHDZFI8VoORLFsH4/zn3WdHgeNqqOx7CgRLok5KpBHeX7lQPmbV5vg==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8eVSeaGjRf9J7fVTFeCacUwIXDFV0Ny7iowN62w5Gx+1gfkjXBEEHKd0rcAQ3rwFhVazEW5O0PUT2hvevvyg0w=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;
        &BeforeUpdateCurrentCustomerBalance;
        &DeductibleDelete;
        &Delete;
        &APVDelete;
        &VoucherLogUpdateStatus;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22X9euTvmH3eAzer2+ZvDJbE=</Encrypted>]]>&UsedVoucherLog;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHvFSNzMHd24rwNP4C3O42rNuZFwCg+sUIeCXnhwJ1OmwZI+oNZod8XdQ9cr3iMapBFNb6Sc91b6FmZ7ywPZZRVDHJZ8R8avoZT1GgUxGg79g0HZqt0nzFdMoWSc+xTm5rfI1I1GH7YC61DFBzi5RFIkTwOpLRa8X4HhjTZqBzTS2RZVW4cO59qv5pR9rVPA4iXJty9F/jMaEqDOZ3HZAeg6r+t3KCQp58U3aws3oUcce</Encrypted>]]>
        &VoucherLogBeginComment;
      </text>
    </command>

    <command event="Deleted">
      <text>
        &VoucherLogEndComment;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkAec/d0GUt70l3tdHNtwkajdmMuZQPf7gbxawio8tFTBgHinilu1KERTe7sLfYpDbz5QWhzFV/dR66DN52F9Xs6LH+bSxL0P+A6hmFm2NkjGmkpZduxJYrzawW2td794/9mK3bpibBMZ4abVzFrn6Oe/FQtVr/0W0ujd5ScLEM7fk0P9gnEI5t5kNEmOwACiauKp3s3P4KMdd0vNwCv1TAR2xWDSYQ6AbpZ9cPDGjnOHqYOITG+kWPExv1XgWpRvxS3C668FDAwDuYR/JtwNkXNwDSDdSBY4Fn9uKoodhEsqhmAnC+Iyiv1iIbuyIfewrLoj5WLqVDo3ri19AbORtsZJDhSsMsVP04mVHguawpdtiATT7QsdsWBZJ/B+ci5t9KJ3EXD0hLpoJDvOsARBrUxfpWOhQDje5CZT7AaSpnDfEpxPhLuWAxRoM3rZainxXvOq7e4xHdtvQSp3vqCSoB81zgakZTMcanjNwSDoJ40DFUSYuk43dW8CEg2xUYbRmqQEJHZl7uaeaCZOqaSFpWvNwynDburl8F4Q/wfAfkIpFzXU1v/iyVho+5212N6T+WtX/PC4/jgwV7chAaecM0rix5PJvEG2MBCtkJLMMrHRmIAWFoCDQ1Z7KPgFPr5Kpw=</Encrypted>]]>
        &PaymentRequestChecking;
        &DeductibleChecking;
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpkYx3sBKeFvn5xF7ZfQgDKIcLM2heSpZT/z4Yu3FikqpiwV/kVvGT8jNidhhdtcwNnSPIfpTzAio0/RN9m47VxQ==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TFfZT2B2AsE0Bt3VD4iQEdnQfILXLrkXFN3GTX/cyuI0FP24/L+1YCgA8TchAhqIe+b265/EXq0nr1K/W3XNJnOc7J244MNyYJ7WXj3kvASJC2k7oLqnq+X4URaQuTVrF9/hDB/CFzVIcA3fZijGRFkYHMnhk+GNSawp9kck093</Encrypted>]]>&PaymentRequestCustomerIdentity;
      &APVSetReadOnlyFields;
      &APVHandleStatus;
      &VoucherLogHandleStatus;
      &ListCreate;
      &PostCreate;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+MYv8XGG4TVYOq1SdOrDIew==</Encrypted>]]>&ScriptScatterVoucher;
      &PaymentRequestCustomerIdentity;
      &APVSetReadOnlyFields;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVpcm33CbYspUl2iSbOE17851TWgxRmgfnQKlvNRAdsTtQ==</Encrypted>]]>&ScriptCloseVoucher;&PostDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtUYe/DQ5j7uSggV7DskJdyfhnXOEfvOG6wlARtaW6nsg7wp7kOjQyYyUb3kaCwnNV3gX16tum3HjEOfJjugSnxw==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacez3q8DFs8VO75gTcn52XN1sw+FDurlv5pe0UoNUveGNLMZAK/TpSQF/LmfrLNrLR/M</Encrypted>]]>&DeductibleExecuteCommandVar;<![CDATA[<Encrypted>&XpAcZ7HRWjEUU2F2AGbQf38G6Y+xJqoTAPng9QYEX4qU40ZN2k8XCTbO9YgjYdOdAXmAsz5JSblHYNT3Mv0/Ig==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwCxcYd2J0gZdsN1luN6RUVnN8nLLj7AXX3AAs96q9v9yKZH7V8OwPU25dcMROI+w==</Encrypted>]]>&DeductibleCheckVoucherType;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VNXeCGqDNLFmcVTETAS2n1qp5uw3DOUzGGtGwk8cG00B0OkCTn60mtW45KabWjfu2/9VTNbejIuYI4IoxP/ZntM2gLVV0HoQari7Uoskjcd86EthIwHNJ3tMfVK5t+PyYSXSVSAQmSDfpxhkA9plRcYpR/2VhZD6VToqcRqtvJlBrHTDFvpLv78QPJuN4vt2GHknoZfGN4t3xnvJOjf2CnF2nwVcUZVdvM14oz6ts/S+Jz5zuPWVpIvrLGvdTnFHfxrRDrZ4WXTvaGJkQVnOHQ=</Encrypted>]]>&DeductibleExecuteCommand;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4faFOs+Xs65Ec+Ah6eR51ky57l+bjdCHquz/pty8nxIer/RslZHJHKguDfl3iy/3dA==</Encrypted>]]>&APVAddStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KApgGJvPb1DW+53xCFh87q4Cts1wNIpklhNvYvCE8W6oN+MfPqjdHIErI3jRIkO06ywAi1SCQeGTnocLNxcD+0A==</Encrypted>]]>
      &ScriptVoucherNumber;
      &ScriptExchangeRate;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7BvHCz6LZw5zw3oF/HOmTHA/QqWbTrFeI0LlN1BF4ZDebSkdEeFwmhP5Pq2D81bvq9Vgyil5Li7vnzrtqVP2um6</Encrypted>]]>&DeductibleExecuteCommandVar;<![CDATA[<Encrypted>&XpAcZ7HRWjEUU2F2AGbQf6ZJZIcNuOAr3UDIMsl5kmcdpqtfpGxIG7OpgomjJPaEvLzeN3330PzZ7tGhdA/WK4wfBz7ctsnAbiDkWljJbPZ82+phCgwo9Hta6aCZmJrEnDph46/3daVtO1rH8fxdK732HLnLRCf3EjPbQbiqGeNIcEBxBKyQCN5FX8ZKI+dVjMC7epJRC1Wm68s9qyIOUWGpvLCDl6hYklsnExPsLCQTxrdSMSwfL1gFffC9ao/yyu+ZaC+sa4OTnT7vfShXKPloM06U9QU4knZ0iOo00DdDOPovr6iMzSE9YNOTuxpA+yW2EnjgArrI5+vlD7l9Wg==</Encrypted>]]>&DeductibleExecuteCommandCurrency;&ScriptTaxGridDetailCurrencyTotalFields;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WO2x0PzqIPvQIyIdiWgwvW0OynztEXBPBMI3im5r7JnQWn8b4C9LP2hNjJjcSSrIw==</Encrypted>]]>&ScriptTaxGridDetailCurrencyExpression;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V+XAuBD7JxQPrOftIQGAOpTqne3TBKD/XYAu1G5+zH7Tq81veYuwRmGUT0a0FCOE0qXrI5TnkZeCzb4nD6XZLOb2IdgQ/U3q6sfyb6oEzYoPEwLWtia6rVg2kz9wKrJfTgWP4/n1xjb4lX+LBAWzgYW7+zSfZlb/70cHWwT8CRKT3vAXjlFL609CSHy6wdPu0iKPOvR40uLbRcZf4hlEeCdFe7oNinjTX/d5UtzrSi5GZ97M6ZhPbxt4jvo59ZaQUhS+nzWwzzmZrg/opQym0alZnw0RTyUGelRRcjZYc3S4V4Kd96w3IcQILVG8cERcRwJhKkJonlAm7PdC5E9A/+T14bhkA3pQ/4J6h/CoGGjSHXCfxSriwGWvOUu3sidTTM5q+7Q4CfAmiPvjgYHnygA1xGheWAua919pBdpFZCFocQR/PPKPF9cvvPXmS0enpgjodoI98jjeCkmXh8r0JGjGFTTuwVibNGUy1NuzdfTbSAXsUzjHI1v/vW7YP4/3oSup9coh/knhNgPls/EBuE=</Encrypted>]]>&DeductibleOnchangeTab;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/782v7+ij/2ZvIicEC7l4HWE3Pov/DMS6OXUfjdSKf9Wrd</Encrypted>]]>&APVTabChange;&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxlZv2wrz+HFskereNNxiFu04UDW7wpQF683gMZOEipKFg+04hpj4KvGH9uCY/IqQJUGfvVpiOFVVpNhqLMKF3GUyNQ1V13WK1ghjnR9Tt4Co=</Encrypted>]]>&DeductibleOnchangeTab;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/782v7+ij/2ZvIicEC7l4HWE3Pov/DMS6OXUfjdSKf9Wrd</Encrypted>]]>&APVTabChange;&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6EHefn2QMKuKKJPQcG/URqpyFqpeqboTmw5axERgN3+fhxIanO/AAGIgj9iO0gbekUIC4TtiKB6UdCP+zXmU6lG7gvzf2fSoOwNDy3edQ6Ljo0BPB5C6uK7ucmnLOcHoIF4Q9NYmv5MRsyC++BsORRB+UA/HE89Y3DveZH0jeGsLVnMeeLISO92645kuOeZDc8KCEB+xpNH4nHW3zqpqT2NjvL8sKU7GDnaiGuus8IY07ZgJE6wYybSP1uTsYLfkJS64vNA3WH7iP/zjS6aiwSgplUAK81V5NFEbxVCLJb3EKGOC+q/Q3GstzLo7/dpgL0KKJYC/vi3pt8LrFX1ZyGUN1KZ6nIdlzB+gMNxz3618UO3c4AYT8Hh/7ActP6mJE24uxazaXlWgVtM+B764zOt22+YDVm+wiTOAAAxSAvXLCnMnngQS7Y3ZQ6f1EwqAtmGq0ZDD/P70JDBg5EsJ2/xiuwCHf96EWT2WK6p4IBrIPysslQLrw9r4rAmyuocxLGHdCbTijj5pl6NluDN1wpghikyPc9IG9BaGM7QfxRuyN31YEBH7tV8JmR019Caoqvh6hcisTs5lDn+GtiY8NAPn65FMN/RepRWklTvUxLELbUs7Fqw15p3/Ku7mDj+n9kk94x8m86Ynkd84uxW4thyGVxzPI8zMzHtThhEkQkm4lgbNaVBXusF5jH+VP+bNu4o/lTFzGOiluzVZTzHu9/A==</Encrypted>]]>
      &VoucherNumberLoading;
      &APVSetVoucherDefaultValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UdLEWneIMq+BbTz7tb9bjKUqriqqX4WpoCNRWQtRG82PoaDQX4xY5Jc8JP7ZiVOurizOBsSZ3DByuAyBLuYclJ+LHSxb+6OCjlMtDBA6RGIxKzgf65MNFMmzRqS8xycFg==</Encrypted>]]>
      &VoucherNumberScattering;
      &APVSetVoucherDefaultValue;
      &ListScattering;
      &PostScattering;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bAU1aExzCN185HTaWw87fsCGsTPotp54IlOBT++EeD6VXPVss+sQy5WGBAP7r4ZHtidZBpQOE3poonFxbUN/7PJ70K3FuSysSN5iO05HtZUci+cbvnwXDpF2D15Zk+A3g==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UdLEWneIMq+BbTz7tb9bjKUqriqqX4WpoCNRWQtRG8239lFmSrg8CyHgJCQqTvuk8CHv4HpDTd5CjMeEG4+PqI=</Encrypted>]]>
      &ListResponseTicket;
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfU4rrZ6Op0KZZwytwN0yydGZcG+AQof6f/r17dYWhIiewPsAnXNJx3ALsEnqHlBTF6ji0JTQVS6Zsc3thIWbxREqWKw/TZ9fsgUrlr9+Kuptz4H5VAEWg+xJDRdkOzOtMmlC41PP231ljx2Itj41NAAxLsEGWzvQQpI+9ziyoK3AaSZMPSk/NAJ7apNxID1sjDeHq1t7XFYL4nXicAh7nWKOH3lHw1BdOHFsMGo188GRiJVVBQASF7BHtdA1AULvvO9v6AvAlEIxmH80/RDuFnGQ==</Encrypted>]]>

      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD7xjdHAMO8z5fAHbFZSmhAYkxBF1gzSLhpw4yyUaJ6hIlRu8HLiFnpcQBDeqGqYW43I0m1V50Cv3kL0JUVztcH7QSkEvUR46+N+oW623IqX+LfvWkLC0EUxM2H+FpMjojbYcyWP4ek1ObdmGLtytwIs28Hjgx9K+F79Q9IqqrMyFZ34oeQvu/jDkmsAaHdKatfoeqyaDnztxTlp4sRcNWR5+ZLtoqeUZjAmeDmJ8Uz7gGzIILdTwd8yZ7semVEgTnM+RtcBMGWp+Xvz6dKkxSYEt+F1D8b7yX01C9VuNlDSvz/Sdarr7palicYqhz5mDB0GRC/KaaJUDiYMBSdo3Gt3z1rFqkvUOrSiQ1sj6NMnoKEU8GMYk0b1PkoRdgRSh39UoyDimTDAFjH4QnUkxDPtAvaWfXVaL5qMh+lzI9XowfctNUMG9imQAujfLx3LfBK4hdYTUucSXCAn1TDg53oY5oCI2TRH8UZ9Kn+RHyX3mEryVbm62i1NUlle5VmEyrgidNDSJLdO/SRtWChXIq3R9UDatt26zgPHFMvyoNDbi8HJJ8EunKldBVoJeanXHtguyMDhc6RN0n1W/XmtPy1dr2yy7Q5MPvHTD+xr/AatyOz5Khx17O+pB2W5ip5Sh9KIVbtrrHBNs6JMjJZpXyh24SHT5xjRwgtS0bypbas6cgRe2ErUzvHBT0TwpUaiz1CacpxZ3DWGrRaKHm1DXnZlyYH1ioOC8I6r5kQhBRAwcY3fAneod4X5gto7O0iTHVdpiL1MupGHsOIdfxNHZVo2QsK4SpQjA3WBK8MC16rhzT5Zz0SV9jDl+VujWvmKMnRG/mJAZvV1vL5O9jwFQd6n6gaJyG1PmpnVQCVk5e4oOngmzLehrjOOBYB+9vFgfwoVxhzhIMoXvHf1ewevjL7V9X310zy64s1kCCDJhzrSkcHaysmVBdA74fAtahUowz1RQMQzu2Z5QzlQwR05yK35Uti0FuaH6vzAqsBwgHJjpRRNUd0GfuoI2m1tCN+jieLBv5FxrFsza79H+oJlo5Ef/Ad4rCVk5HgjEZWL/B7ZeT8clDdVla7yjMDMnfmUV50=</Encrypted>]]>&PaymentRequestHidden;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V4JMgLxmlt9dSbVFsjGp/bOPe1Iuj/2cJCrEplWzYi3haj2qEAPSouDLWALygI7fhmRcKan3KUCjal5PqD7GaGZPjZ0cb36OEwnb6YmTNQD6nvj0Ky7LEyyFStEZDeqcGJszwqManbWivTHsmQf2oH9aLHTnyvJ6ZGBtZa6uODYD5145tw5H1G0bf4+hDD8XhHYu0V8zUuFfy7y+amM8wx/mtVqzSincaPLHWxRQjOlIbJmRGq0jnkZJ8iOVZLAu5bZJOR3Y/TeEaP+S51GU+DMto3gCM4UfhD9NfJjykai7lzhhm5JgkL6fnw8bt3pGrrj+UcMmTdnmx5XCphTmLCkaw7nGWgiP0nC6J5jz1FEdVyUhMFUESrX4qAvGRltOte5WnLwyNEU7mT91dJED9RChK603aX13km4fpn8dQOz9sRNie0a5szuwMXBX0x/o83mWEbiwq4aYK4KyTRY5HiMZ4psIUTML0X5xA3nCXvI2qSp0vm3q9x8eUkIoWQbhPeVkZyMX+xnl5tu64xtH5r8RlOE+XjLmVvPy8UM04YiPsOhA+YHIc4WNFeciVdyyNlTHGmR1+4cfzwbEDFZlM1VvkOKBUm6b/iHbjk1w0T5/yecGtluMdCNeohfPmJk8byAYIAyBSr8Pwz6sbHq3gNQYNYtHy/FRSpJsxWNnWZII9+iL+4KlIdVbuHwg8pZvUWe5k/Wuk05ogXfj3xYiwJuxRsslFqAS9moeSxL7yqeKmaLhwua8IlStDvcy17LOiHpyVEgWnpBcns2DY/YXIigqB8qB1ze8tY10nyyQC6o+Edvrzh8nRNCwg3wfcZgYsyD1R8bnWAXgJkz64dXnLzyfW4aqF/yelLpb+hfrjHAuJfGbh5cS5oZ4KbwTsqiVKbnOEkC08kLWhHi6L1pZOArgm90frtoyKvA307gqay9WTtew0MmrKQP/F4UW22uG0fDaM/JOiblTj7eo1I2YAqFvMD8W+GYENqND5SkMz5CS/ZDnh0fqdb88ni9dEoVVMNrjjwfco8/2xLAvoAj6A5V7w9+diJfcPtEnBjZKJQCg0e1oUYCVjAFTngBy95YWUPNXengLzP5zrmC1uhKDac=</Encrypted>]]>&APVWhenVoucherCopying;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TgUTPZ2dcLCXC0JLs+ueAI=</Encrypted>]]>
      &DeductibleFunction;
      &APVFunctionScript;
      &PostScript;
      &ScriptVerifyInputVATInvoiceNumber;
      &ScriptVerifyInputVATInvoiceNumberExternal;
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    <action id="Customer">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqapXv2dF/zPQRP5o3OalCwddkebjQuEWIiRC7gMr70mJ+ZhhiIh/S2km6rEYl1T+hoEaqPYobin9vVBX/J7Fy1L4tTVsJ578yH82kX8cYBNEY69AgTiTDsuckVaZXIWQs1ptTVXHgSUtkOqndWG5XPkMA77G8lGcNTsyvQWsOQDHD8VCauWfpVLhNQrnsvEfH3e4cZXou921jxI17Puld/eMvJfye4k/dSPB0f9PjeNvVf0kEkgFj+C3g7aNoYk/fQ</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>
</dir>