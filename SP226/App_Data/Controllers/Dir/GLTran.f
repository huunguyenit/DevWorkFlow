<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
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
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY CommandExternalFieldDeclare SYSTEM "..\Include\Command\ExternalFieldDeclare.txt">
  <!ENTITY CommandExternalFieldSelect SYSTEM "..\Include\Command\ExternalFieldSelect.txt">
  <!ENTITY CommandExternalFieldSet SYSTEM "..\Include\Command\ExternalVoucherFieldAssign.txt">
  <!ENTITY CommandExternalFieldQuery SYSTEM "..\Include\Command\ExternalVoucherFieldQuery.txt">

  <!ENTITY CommandCheckDetailInputVATInvoice SYSTEM "..\Include\Command\CheckDetailInputVATInvoice.txt">

  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptCurrency SYSTEM "..\Include\Javascript\Currency.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherDate.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">

  <!ENTITY ScriptVerifyInputVATInvoiceNumber SYSTEM "..\Include\Javascript\VerifyInputVATInvoiceNumber.txt">

  <!ENTITY BeforeUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\BeforeUpdateCurrentCustomerBalance.txt">
  <!ENTITY AfterUpdateCurrentCustomerBalance SYSTEM "..\Include\Command\AfterUpdateCurrentCustomerBalance.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCVPlFg9DkT0fhsBnaQRlyDmlnTNoIH04eI2ON0CCYgcd1eEVMnzCWOcTNrDA1rVUK/PR3pfsdF6W6jQXp8lQVgQ==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcH2L/VVjLJ6DuWw3aEnIHoGvRG489h9ecTss4JnQGuv7FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbibcivfkKrSb8Ljdlx4zEOXTcqCnyfrhKrrkxnZHAQF6rT61GFtU1sRcOVPU1FJO+ZBz54uydBk7DBCQ9AKRSS9bxf7wtFKABersRWhy4h2XM7R2bOk/hJZmxSlUhiicFf4gSlRXD/BDNJoZSX/zX4DodR2tmXDMzZaeh+MikSaxKy4zzXRUn3UfFGnJG4DK8ch2l8R8U2MSmXVW5zcVYhCDsfIb60+b3fr9ljGcz0GYZrtgsfH0RlCiy2iOLuvSjT8Gi9qsshHmFZ56JIaXfyZcz1+2uQcz/nxLPgkd0NSAe+FFAg7X9Kr41HVr5LBXg70KuTFW6S3rGnMDFR7H1jn2RBUFa7HCaJ9mska25Se6a+lLXGvsHgq2EqMBMduTERdTtlkUxGcN/YJnMMpS76zk=FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaWQtC0vfSI1Nzknh968bmTipvbXUSQfqzXJJBGabUuGO7IsGqwy8IeoYJzdxR1QFBA9K0+nKFw+EBdABSeCf5NQConU+W83lYr2uslv2VvqSw==FastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMuwgLVtrvgxqL4v/cwyQYXkFN3L2ct8hViLPyRaD7hOXjiT4XN+utO0WFOzn4h6I1aiSMTODhsOkDSY1XxwelsZA0J0hXCsdb/WKAnrGofRDgQaHg/vQCPpI1o6NEXvmxJ1ftIsNkLxGTvVn8BiSGM3o=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUTWTmxkl/+1EmfZzjOc0vxY4eWMIPCuhlGBOv0fNlGxSOgw6SZ9nqmKi/+H5VpnuYA==FastBusiness.Encryption.End">
  

  <!ENTITY CheckTaxCodeCondition "exists(select 1 from @r30 where ma_so_thue &lt;&gt; '')">
  <!ENTITY CheckTaxCodeConditionByCustomer "">
  <!ENTITY CheckTaxCodeFieldValue "'line_nbr, ma_so_thue'">
  <!ENTITY % CheckTaxCode SYSTEM "..\Include\CheckTaxCode.ent">
  %CheckTaxCode;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.GLTran;
  %Extender.Ignore;
]>

<dir table="m11$000000" code="stt_rec" order="ngay_ct, so_ct" id="PK1" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu kế toán" e="General Voucher"></title>
  <partition table="c11$000000" prime="m11$" inquiry="i11$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb6oCvCyvGNeTkvFCI1bz32ZJ8lXhThkCwWNnPFWt5zZ3A==</Encrypted>]]></clientScript>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
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
      <items style="Numeric"/>
    </field>

    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Chờ duyệt" e="1. Release Later"/>
        </item>
        <item value="2">
          <text v="2. Chuyển sổ cái" e="2. Release"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d11" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="218" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="GLDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="218" filterSource="Tidy" categoryIndex="9">
      <header v="" e=""></header>
      <label v="Thuế GTGT đầu vào" e="Input VAT"></label >
      <items style="Grid" controller="GLTax" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="t_thue_z" type="Decimal" external="true" hidden="true" readOnly="true" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" defaultValue="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    &ListField;
    &PostField;

    <field name="ma_dvcs" hidden="true" readOnly="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="278" anchor="6" split="10">
      <item value="50, 50, 100, 129, 0, 100, 8, 100, 8, 58, 42, 8, 100"/>
      <item value="101-1----1100: [so_ct].Label, [so_ct], [ma_nk], [status].Label, [status]"/>
      <item value="101------11--: [ngay_lct].Label, [ngay_lct], [stt_rec], [t_thue_z]"/>
      <item value="101----------: [ngay_ct].Label, [ngay_ct]"/>
      <item value="111----------: [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="10100000-----: [dien_giai].Label, [dien_giai]"/>

      <item value="1: [d11]" />
      <item value="1: [r30]" />

      &ListView;
      &PostView;

      <item value="---111-1-10-1: [ma_dvcs], [cookie], [t_ps_no_nt], [t_ps_co_nt], [t_ps_no], [t_ps_co]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="769" anchor="1">
          <header v="Thuế GTGT đầu vào" e="Input VAT"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="50, 50, 100, 129, 0, 100, 8, 100, 8, 58, 42, 8, 100" anchor="2">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvlp8b21aG71Pz+WyKdihaUwgS5yu/m4dyRS2b549kXSB5ozQVcsvWrb+zV5xg+WFRsoxJmLB/cOPcYyxJCON4pFeLFHMPv01F4fHJ3ExJgmL7RQniOz+HXANyr+w+i6VzU7rD5JBcXIsWnOy1e6nFjSx+ewtm+Ql1P/Yr2wQD/gANXQxwoAaJis3Jm8Gf27iNzg+tqkuZZCslemcvtTaQbJ</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafYrT3mG6oBCXIr6Wrlqp+VaFV5yWTUw7EuNbO8pjgN5zpOpMJLbzapK6IOFGW8DHhFBgModb+eYJOfBf81f4ujjtFHUjFRTyPZZ7JQRLcwE7</Encrypted>]]>
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
        &CommandExternalFieldDeclare;
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5GQ3ujB+G6PxUXu8157QrM80oDxL7nZWZ0KcNjPaGZd8t27x9Y2mLmnui7AH1AcP+yFfPP7SYl/3SJ7ZjsfEiIY=</Encrypted>]]>
        &CommandExternalFieldSet;
        &CommandExternalFieldQuery;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJmqsAk72Ii7Myu4XNWxBZ7LFRJnpRsOvqw+sGYYBmMK</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        &CheckTaxCodeDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbZaAEVT0QhLeDz6F4WpGYKmrPKoJ9B/rHQ84ejexCmVWFQ9H/4TZB9T/SkgvfpVBp06DVl+3mlMZFesGS8lTBrNDqheNMEGt+wTkN+/1jdODdmUxCHl9zpSXOF0Z3vB8iRpPRnxKMjOBaarNgjnhhk0w5GpvM7NT+rlGdZI3GP4sh9pGSm/qUYmpwBu7NtAUc8RlXtVDSuw0ntutaDK5YQr/PSHZ8HehqtZJbpPFCNKgVjuPSO14asyesUIjTbWzGNz485jdFVh/s3coa7NHntniCyXszGPYAHl11TclPxdM=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        &CommandCheckDetailInputVATInvoice;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxVMx1846CkzxbSU4gmbG9yqdRZoJBzemZMYFJrYwsjqlh2FrHVpf/K47CIBe+8i1on83ELHkCuwNMa5Mik8QINYF3viMrAqkyANZTjseKohS5xZud2Kanj43UdPoDT3Xjv6OOnIo8vSwoMQAScNlzzrNJSJfAPgYQcO4XNXxLMSPBACAzJaY0nDNODjjQ4GqL0VMJkSVMDQwNXeoOHZNeNCKz3SDvDM4l9KTuSRjiYmY=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKsFRdNs98tyZXzcwwz7clgKRKXCT0iVfb1m4fP8brcnxlrv8dlOjCRY2CPITs5oHe5w5rq420v89Do7Kc14WcZJAY6pOCGs74cuq8NUaN60</Encrypted>]]>
        &AfterUpdate;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34JmodDlEVwoSSM8lPeIilp5rykxi1xP8tCTX0t8Ctu4cOsjPaH2SZ/u+e+TIYb8Dac=</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XXWFyhs69eHzp8/i9wp1totf8UdWkIJzDEa5aGRjVzxdbsKnQA4NvAWVRJEtwopfg==</Encrypted>]]>&CommandCheckDetailInputVATInvoice;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22eFQ+FudFLqOJ1ZESJzYLQEwH4yZZWrB0it+JxwHcPXfYKAAD6nXCfiKLa+POAydiNRaHpKeOZ96Mlu2pMsmuks8PFOXMaVbVeWa2jZdu2FaTLdu+Rh/3Vky+8hOL1HwaaFoz88FCG5JQyGWfRxfStl09yN5HXvT6KMtkOaGrEN5sUsU1ckXIlHI7BmsnJK9+mntdKESSQCjQArVzzqpcxM=</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku6EiiJzFXKv3zyKyGKG4lOPj2+xvuSqLeHuhmrRjfBZwjItR3+DI1vAmrT94HzeqTDN99TXhTbv8Uv/Wg8X+dKhEYbYw4xM6fIGUAe3aNrl4THnQBEJCC+snQb4Sdk6MeT8JXrr3gnijS57xojc/ab3k0Lp9CDk02dYh90WobIO2IdhqPbDTwLfX4tgS5Xp7M8h1ayY/qH/g1pE5JB1niFBhbSHn12EpMYFJT/sbzfuNKpI8logyRjSkAdpvb2Rotgt+P0OcWUEpDv+9WHm9PxtjFutSbvTzk6XZBiwMCRd1tbQQ6DCDBNLzbTV55+8GAkr1WWrZ4qPXeOZq5fw5NS2pELCLMrC4VuNPg5kKoZg7BBIEsWrn81Dx5gV+N/249Q==</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aYxTCATgGAUHUDgxSjB7FLWna81ZOCFWtqCqs1pMQi0ktXuT+W83GODD4OH0qrMQjdyXaG4RfdRM9AUdyynLbdnCgN3Sflmo/XZewgGEPIMKTCvIiUEbdxj0Cz1rhAAOfWnwXDPdukvRqaOA5qtD5A0Bm8zNGM+jy6HMJD5CN17Np2Y1+S2IGGtiC8fuHtm4a1vTcO0Dx105ZVtz6puBH7ffrRS3gjQw9yIkHD8KIs0yHW+5+RqOxcBrDnEfb86hw==</Encrypted>]]>
        &AfterUpdate;
        &Delete;
        &Post;
        &AfterUpdateCurrentCustomerBalance;
        &EndUpdatedVoucherNumber;
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &ListQuery;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6H1EhmdaOQ+NGMsepA+7S1YtzabAx1m1q5HD5EvTP3XdNkiGf52EXAlhAq/f0JoBYaRjzQaftg2yK/9Uh8W/qFzUObaavjqswYEyBwJTqoR5z+ZXOJtJZe6muU0qsDl+ob/8/FSQd71PfVAYduXi6qcZ/w4/KjKVOYNuVzyLyvrWQWZRNqphVdfTIKH08G76ZlRzX0zvYtUR7dpJZYkN9Br/S2h3cVpv1JrnZxiwEXYQ==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu86EY1YdhEzQas2v4N91JvNcaVQPFH/LghJD9Fy8Nqd1/VriRR77vUP6KdXPGJXo5LmYOkhVhvtElSuKQ00PSvE=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
        &Delete;
        &VoucherLogUpdateStatus;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22X9euTvmH3eAzer2+ZvDJbE=</Encrypted>]]>&UsedVoucherLog;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHvFSNzMHd24rwNP4C3O42rNuZFwCg+sUIeCXnhwJ1OmwZI+oNZod8XdQ9cr3iMapBFNb6Sc91b6FmZ7ywPZZRVDHJZ8R8avoZT1GgUxGg79g0HZqt0nzFdMoWSc+xTm5rfddzMWLxVw3UoyGPhJv0lMR2AXm8dvwVjXPNG8C8caW</Encrypted>]]>
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
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGTa8jTOWTWqwQgCxgO/x0XSy1WhnCs2obST83/49iprTzDZeoZPQa+bBqSasI1BVQT1SM+b5ptH4OJSaLtjOQhPuJz0Z93DzO8LBScy+PfYVQY/UAmWvKHBOlXMbTwVXsGetS0gCinfNnO+Nu+hh+GQPhUmdYpDQbxvt6uuLdN3Erci3fSKY1i8tc+b2tdP0gSlt1QPVnO+ckpn/zHV3t6/0nGodkz/GJ7y1lDCJ12GmcvHckddzo4UaKr3Udn4cz0ZZ20369hk5EauchzYur0PASA8Ydx38XybWFFCImklIZzzQgV9oGFsL+a0DE3cKcn1JMBCqmWdVYwfCMIAB1U7DJKCWbo/sPN0jpkWvEhjn7dVfZqBkK6XEYJ+Kk/lzjua6HqP3FK0ULAoWfFEOymRsWREMuquuTKFgg8LGLPppRj5mFzQ21nNJbp/TjxjBB/6xwi+ov2tbT8aE0cHpq0tzAGzGmm4Edln2WXcSiAYalDXRj9Djj4M6srCbF47jVcZRIj70GbHe4PXg69GSJuGvayAk4eXOfY1mLQa6qZEKkNZMKIG93DKFsYxSA5NEJOJ/78GJiwdUbTr2tQhwJetXDq/vVk0vjC0I1OD4Jviz46ZXS2dLiKCPV0a1e5bp471ru6PKzSXh4nOLOdvvDucTeBO3PBxDCay3ms4jMRUz0ZZ5keHtPsIxQMBISIN9KekoKzHSBzqr/rhEw4iseYoWfXCpOJ5Ifz1+r7Lsy6qGdsVLcQpzZZ5xeY/TBC1p0sGzOzYDOe8cRlB2fPivAXWIl0Rm7kmYwpdKvs7gZutK11DD1TqdGAnBH/rg6UFS5nXHKmefDyWhRB9MJ5LIg2cX55pyk4I21vN+5kbEieML6B2PeOZR0f8x7NJWy1dI56G2rw90f8r+baBYDAPXl/P+e/NhXq0egdAYERx6r57mQpt8UkfgWXDyIe5IThM/FQncgYpvVsRFjfizP6BdAIETNn16vr+Ck9H93/sgVICP0+o1EmdcRjmX3JbZs/nsbp2hYK1KOO6ybokuSAHXYu7lVXfZl7OQ8odZuQkXMl6Jp6jxybbEqNI0Pb+u4ZcLGA2MgF5O9UJ5qBmPnPrMinqyKM0fZpY69LjEDW8uQkM3bpwD0luKQddX0eCNdAVCRxwWqEXCf2D9Wfbsy7UFnvVI0SgpTE1v5Q7Z/xvxWuKamnQaQQV0lA6iWiCfKI8mEWVGdjVJSZJopKldjHvF4RB5VMSjNMjmi5hFRwKHhMe5c7uCP6iI4+rb5qGD5BFuwosNLKA33oaBnB2gDj5PPmsQF3y7lCoP4jWCKkS1o0eg6PVz6Qwn3udPDERl8ngWs5+jFH37g5swTKA7k1OrlgSDj5iy+A9ReZ0F0gSb8fqlBTf5SbjQeo2nx1ZK+eALMzxEzfSXwIIRJiRc5kbrZ8zKEhx075tEt3605h0w+AUoMBVL3hhVcdpKOqq/5yf7Gcl+4EGcEdudsVw5uIQW7WxAsCoxAx0qT2HP7yDFkCDpVoe3uHC9zHoM0iVRrxky6DrwHZCC7f7djft7mVDnjabvTylvtBK9A5qL1VFsoJiKMyxhPiT/2KRVlfJeBdnyfNYJsRMkhW12ZAiZY0c/LoVMtiXBoXgOoqiyJq63tfZpDG8DsATve7aL4LFcivuDA==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5Lpya5pYlEWWAacedGhSUOcnBIuWsgBdWaeRzPUaGA6i9/JvJaval7Rd/u+mZ17J2ywhuNwpzpkDkazRebZnDawig</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxd+oRTrM4GbHldzXTxwSKs8</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWym9wbgs85nvalQ9Nb4tkNBULONFJ+rXydvRx3Exz9pxEjcZSjdGAoz8aB/KQo18IsA==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacez+QiM3XFR8SddZwF4qqrpxWz53vLTROIwpz/yjB35gbBpFFwCiUXndj4rfTE37JSGs8escL4bS/DHg8mk06AI6LjFKXa75P4dkDizq8W7Kb2vx22rYQcrhF5fQCt9G01n1ha1hhbA+iwZHX0R99p9WfhpDe6vM6RM1MDSzTuvZx9IHH/RIa/jrKWBhHVe0tM8e+uvvChM4fYnZ1cddFWzaA==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4faFOs+Xs65Ec+Ah6eR51ky57l+bjdCHquz/pty8nxIer/RslZHJHKguDfl3iy/3dA==</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7DpZ08qIx6gjDSaWiHtki5lGXD6ack3GoXx5dOK4qdZsihTO+iv2Uzr/DNMMJ2jqyExrFxhrkuycdImrRJqHtSNgmLExEvBArSch6AGl3hKHXVn9MMIWeeROr4qPNaK9bR+gvMgB0fvb9AJmQTB2iIaMj2f9g9cZkfvWA2rTTLBAW5cy8dnPMVULCoUZ7UK/zFIAs9Us6Ynqk+O2D0BciM6Hv7jtZZxMIkTp4PVCu0yOcM59dzZZp10nKzd5R/TzJFjDA625Lk79GMqxXLG1Q/rqjvl+hV1C9eLrxj/QasGCe70qocQMbrbu91H/IKbfmXvxk53Xe2xmuKQ/U8g3mR4oSfdaxzWnLdbakpVYvwx8ABMQLT+oQJ0Bo5/lDKFTD/EOmMYIKSSpKj0pnuYd4lgzBAJgCAsWiGq7JNRohRolw==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WbYDiTy2Z9/evnhJfcpncQ1+FQ8R9rEEhyl9VBElnk8FcnhtYv66X4/9WQYffp06SuJs08RP1My8up3H+s1LV1nrlpJQhHm3WgHkxs/WP3MkioSozFbDFNhxgjYR0t7hC</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxlZv2wrz+HFskereNNxiFu04UDW7wpQF683gMZOEipKHncbfRu+OzDV8tKCPk6vQCXdaH6EhsJ8e3OacPUrDMHA==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGPks6+9tqqlRL9zedz90p2oOW5HLFPtTwi160AWoeHnP2nLQfnQr52qrrYtWvKEheXPLlgAvw3wtScT4QxQSZM9pWzagBYtvxYX2czSdP2uGxD9JUqpyRyOkF9kxZR1nr3cGVZYT/ejgPh13V+ggDW1dQwmbnXFu9zjT7Ck3wsUrmJbguWUWd+T5zMd1ZRFCIpBWA0nyXkxFBU/BpswMv1WdyaOMBJMqtkQ1mlFX3tVC7ONiWbtep03NNd8AiQ+nQk9mCRZ864jE3/n4jDuBzbzRANJIjrMYmu8rE9CbHgdIdufSLEOp0ayeky8MkPiE8ufkj8EvP5Aj62j6BR2rtOSyRs9T51K1FMJbGJgQ0JoRg==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dJgeUcGBXK6zcr2MH4Yp6dQE5CUfWxJ1aqyjnDiCVZy</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Q2El7xl2nclV8dy1aEwdR1are2UfzpZOiL0JpXF4tb7GE9GnF6kiOPHgVgMRS/zjuI+M56bpgQA6kUCnB0zW8bH4C8zYzdVcD5s8RwJfd1t3lxeP6RbDcKl7DR1XTXFSiBXHoaSoNUnm0s8UJKTWBpnbu2rlcjvoYL8Gs7LdgfJNrk9hqO5kIhNlWPKewckYEI1kvRiw2hVYtAlMkwZOf3NYf+eWILuBYSkYmCLYVqhXfmSnAutbDqD2mSwOmSubQ==</Encrypted>]]>
      &ScriptVerifyInputVATInvoiceNumber;
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

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>
</dir>