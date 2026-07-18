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

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpC0/zqsgvM8hUIpWF3427XrbRvBZ7OlwNMlq8Wd5CVSqqPKNKNvcqL81bEghR6XQ8IWZM5bsx0PGyB3hdKXvaKeQ==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcH2L/VVjLJ6DuWw3aEnIHoGvRG489h9ecTss4JnQGuv7FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbibcivfkKrSb8Ljdlx4zEOXTcqCnyfrhKrrkxnZHAQF6rT61GFtU1sRcOVPU1FJO+ZBz54uydBk7DBCQ9AKRSS9bxf7wtFKABersRWhy4h2XM7R2bOk/hJZmxSlUhiicFf4gSlRXD/BDNJoZSX/zX4DodR2tmXDMzZaeh+MikSaxKy4zzXRUn3UfFGnJG4DK8ch2l8R8U2MSmXVW5zcVYhCDsfIb60+b3fr9ljGcz0GYZrtgsfH0RlCiy2iOLuvSjT0Et5DeWfDhpiDrkYgbGclo82B90sTD2x7DM/XZz53uTBcnbsvzdM08ePIboY0O0GY8aRfImrEvM/m3G5a7qu+zPYlJo0kznWoDsOeKRjgrD12yQ+dc9bRwxmWpQa5IW9CJDPRU1JyS+Ul1pddIngnk=FastBusiness.Encryption.End">

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
  %Extender.Include.JPTran;
  %Extender.Ignore;
]>

<dir table="m39$000000" code="stt_rec" order="ngay_ct, so_ct" id="PN9" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chứng từ phải trả khác, chứng từ bù trừ công nợ" e="Misc. Payable Transaction, AP-AR Interface"></title>
  <partition table="c39$000000" prime="m39$" inquiry="i39$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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
          <text v="1. Chuyển KTTH" e="1. Release Later"/>
        </item>
        <item value="2">
          <text v="2. Chuyển sổ cái" e="2. Release"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d39" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="218" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="JPDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="218" filterSource="Tidy" categoryIndex="9">
      <header v="" e=""></header>
      <label v="Thuế GTGT đầu vào" e="Input VAT"></label >
      <items style="Grid" controller="JPTax" row="1">
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

      <item value="1: [d39]" />
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxVMx1846CkzxbSU4gmbG9yqdRZoJBzemZMYFJrYwsjqlh2FrHVpf/K47CIBe+8i1oBPaqlR1aldo31oBLPW9Mx95Vs71dKiGR3ETFovtinvpLl7MwTFVSbzvJtIa1AeFgQJNgKBvyhaGZ2BPXabDCwES0A7OBC5x2uSPaAO0FFuh1G8dPJBH7ioJp6S5CebMkGpfVHSR6hdijwMVNWYILR+yHsWDYccOCJBigENlfQ4E=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcEeaslQk//wOa2rNocU5hIuYgzlxsv0iN/HaJb4iQcjiOQj9xtVOd4UtiFWpHXRrzID4AqX/4rPtjVa+NKUm+ja8PwVf3zy2Q77xfbkQSoDB</Encrypted>]]>
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
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XXWFyhs69eHzp8/i9wp1totf8UdWkIJzDEa5aGRjVzxdbsKnQA4NvAWVRJEtwopfg==</Encrypted>]]>&CommandCheckDetailInputVATInvoice;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22eFQ+FudFLqOJ1ZESJzYLQEwH4yZZWrB0it+JxwHcPXfYKAAD6nXCfiKLa+POAydiNRaHpKeOZ96Mlu2pMsmuks8PFOXMaVbVeWa2jZdu2FaTLdu+Rh/3Vky+8hOL1HwaaFoz88FCG5JQyGWfRxfStl09yN5HXvT6KMtkOaGrEN5sUsU1ckXIlHI7BmsnJK9+mntdKESSQCjQArVzzqpcxM=</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8ekuxGw8teJtFMNIkz1kO5IPlt41Zn8j3r+2Ewj0sVQC7sjAeBrZziLFfGJjNhFzUFTDYc6JwwUW2zt2JkXJ6xVaAkoih6cZDJ2wbjNz9HOpqTLqinvUSFisko+JmGgZsbH+BSbssPnoTYBuwAxcdmkVQBVekIxTF2+tZU43IVj7tGVo2rU/KkBpBbXdKJOZQC0PVkIjbnpV95X8myM/INnwT/fy+KHxh+YhKeORMAN/U83eoKdVjiSI+Ysbee5bnHBetPDYXfUFhgT6Fvlhim9pZF0oNGjAA1JgkcYY+DHja0aCQkr+DyqW/N/q9UdRcA9YYfGlu7/7uOomyV1XW3QJ6LEXtj0MpXXEDd1iiM2Wly1pfpUiIWvQfB7LvFpLwE+KQ==</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22YziSiGA2C8pwBbosoLqozPRoeKdO2Q90GtBLOn0a83QRGAMjs7Lvc4YQHV7BG2M0z4jLUD88ws/bHCv0KudzyseISnGpjSKe9kcT7nohdmN60coC3kyrK6X8mFuOfalngAZl6uRoFPnHx5XXkNW9e7jE8w5g/HYCyaTE+eNodZKsbpt5ezvSO9DzgQ2VtB5+KHu+mTls4o5csAXjlrPw/mrAV9BP/NLpqSlWs8wQ1N73PYLuuWrJk2rRmf02HSkKg==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6H1EhmdaOQ+NGMsepA+7S1YtzabAx1m1q5HD5EvTP3XdNkiGf52EXAlhAq/f0JoBYaRjzQaftg2yK/9Uh8W/qFzUObaavjqswYEyBwJTqoR5z+ZXOJtJZe6muU0qsDl+ob/8/FSQd71PfVAYduXi6qcZ/w4/KjKVOYNuVzyLyvrWQWZRNqphVdfTIKH08G76ZlRzX0zvYtUR7dpJZYkN9Br/S2h3cVpv1JrnZxiwEXYQ==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3k0oMK0l8q3+PfLoljFeU6C56ljtk/98Aj8OqNYx/1gPqE35Xp8jyo7jZiJFsDZPTUa+56V6TKXD918KdRtDPw=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGTa8jTOWTWqwQgCxgO/x0XSy1WhnCs2obST83/49iprBTgU2hQwoD+ZwE1DnmPjlWBlJxMoVfOatyaya6thEeiebAUq/6VfVsKaYVlGGlJ1n/Oa5/wYIN4L7FEJ4BKEHgSQTmlLZiOu2V/K0ttU4+A8Sjdog8dnHWUzo+zsxge+nLHgbGQUe1MycpL0ImXkroR+jkm8GzhuNwDaSMXiu2u0UmEA5tIkeQd0nUMa2EU03Qu1tGQHR54cUoD1zxTv5sIf1aGWOXqnEbGSlhNmQkmmUj9rLsCZxsKWQZqDJeIjlsamV/Asw2d7iMQpVMgpB3/GeyidrNQXhUb5ZTz0G76hBeBOtAETPH+duq0dvCJj8Tj8LxaFtX1ZTS1PwO4qVPTIl4pS2+xVcSbVs6fBKwUFBgUSTKzZ8j2hvH83BIyaMWnziiQ9tiIm/l0srA/N3aZ7+z8NPGcedFplH80ywbqbKf7JHpTU0n8esfLI4GogstTr1iiKmKYkQmmspOyOVcb5ANYkfHHS4DBo96+sDqAwbyTMaoihX+wvbA1T1KoBATivBuSJlRtPS5IBk20QkX1ppU47oUQlxKcj7HjxOq9rjFcqeHaS62i+wQVzeT1lv4aF0AvUYEnIGDwBPp6bAs4/tSzFu2YrgFZu+iay0DrM+kFSl7+ohRLYrarzzJCmwvMExPCq31cEmK+6NwnSyolNFonSE6Nc2P+LKBG6uDUXuj1KOjDYumZq5qsSjBj7JbvXDyMFgKiBfOdjokP5Rxaex3xwJJNQVqGng1pKl/xyQW6kylA4xmo73XyKVJlMio2LPP+eQxeWxqRIdpU42GtpmqfgjLEHi89RihqICuCkYP9rcnqPfgN5qlhVMFQE7OcsfOazmT0FktqqNnMfPOgtbKsGUQUNrPy68wbOxs2v0n9nb2lywKdWoJtXj3OUUc7DzvyOvGN7lLXBL+yrJOw0K9RlWmXQs7TV5ISgfDS1/ZM2fM+Oi5mcKh5djNc2jmBlZTk0XMD7fOTSn4ujzxu9o7tPSxHAqRrLleHyi1E4gxAlaAq1EhG9CQnbdWyPtPLM1FEAT5QhE/TNsQhS6uMn/wEUhNaZ80CSPrUxRh+Ftl1VevKFGPG/ok/BQQmGsREBB+7VOMgaQ6/PZQRrv01cs4xsPNaZC03vzy+jE68JNx0FJpfbpBAfxscD2dmQPU28nqgCpZdVYmGXlTJ1noFpqd9txaCthiGmKFXjd1VR81ThNc53dMJUL6ePNuZJPog0L1Idwb/TE/kdNPqf5w4vFFxe0edfvciRgkzf6tJf5RbdV69ofNFC/tQftnsf2/W4P0RRtFLidUulpjFpEf6Re0uLkIHiDmiVLVHK1UvGnsjUVH4SNl9qnDXcu0VWZIkFfsze0ePZmwCki81mNHLIRPopSD13V3nZIp2K9cGaWumbfoKCmMawIDMT+9hsE6j84BzQDniaabmKfJBbc0xjC8XhEerIwBSmUiZhQdH/CFTRN+0TUEVZZ17K0y/X6/EYIAgzqqdC0c2hdkSZmfVHS29u8UXLKgbsnL6KEuhJxE57hKXdkW0pfVkhxkCa4jIUJ/gbnFn/1tcFwDl9EV7iAIUYBxWQY3QXZlONqrEvuPt6MI2JOfscD9dWwKVULJRGutXDrH1KUULCt3b+ww==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5Lpya5pYlEWWAacedGhSUOcnBIuWsgBdWaeRzPUaGA6i9/JvJaval7Rd/u+mZ17J2ywhuNwpzpkDkazRebZnDawig</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxd+oRTrM4GbHldzXTxwSKs8</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWym9wbgs85nvalQ9Nb4tkNBULONFJ+rXydvRx3Exz9pxEjcZSjdGAoz8aB/KQo18IsA==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Q97JImtt+Xw1HQpbeFFL8ZguyfClehHL70gb5kekB04TVVesmFsTLx+kGcWLDsw3gpMP2tzGJgRgzRPDz3/4se7zf6uegi22X8ZFiegcmpV84feLR5vndLDrJG9XIu7+L6YOC3Z3hsRCTiXDFCP2yNZ7VldnTKo3qj7IiFCdQHSxOL9oZjeJOg/chuoF0vhkoA2A7E/exRgjy7NadsHNa0=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZCdbJ+U2ImncEMAOCRkzWrtT+8FihJ+PDYur3vchdp+5ZzE/0W9FibPkFGMznceS+d08vbUgCukescwu+rlotFxMcNXWsUw5x91hFxV6rFuqdILU64dvqdspoVJ/l1Pb7FVe+eG/ZaFwOrKJXtnATs=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7BvHCz6LZw5zw3oF/HOmTHAXJz1o3ff72RGokX+pmiHEPOGXqZTlMiAkrshE2ZueF+TdHtrt1H0Cv8FRLkDXlJE/9H7kfCV6vhXsGoSyy/V+lhb/Q6xoBp6kGTtC5b87xW3Okg5d72NVbxVO5x+rZU8mAhoML6TuHdJ1pacHh8vMqdYylptT2OlcedtghvVb82SJ20E3vMFOjtAS2ECWYmGO2YxmNCDCP9oZ8dm0g1vwA9/D78d+iNHbVr4wxta9dvNOJFiUa6Y/+O6aWyyN2w58uHUIOFcLHvUvLhWg2LZm6krtZxXOWWoYixwBK9VWO/UTlzN/oUN9/cwzV+hAdSI2bKfIKMh3bW4yur64COZRbD/F57+zuWieogdbp7xbX50tiSK3CmXwFKCq28JqFemqp2ZDL/s65Rmz96beArupg==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WbYDiTy2Z9/evnhJfcpncQ1+FQ8R9rEEhyl9VBElnk8FcnhtYv66X4/9WQYffp06SuJs08RP1My8up3H+s1LV1nrlpJQhHm3WgHkxs/WP3MkioSozFbDFNhxgjYR0t7hC</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxY0ZmnL2Lm9ZXPi3DgVOB2YxSwEFkrKUS1XIa7I6726EIv9bQjWT2sVPcr82lNk0JFN9gh7IQLO6BB34x9hII8g==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP8tlib1OD4QSA5Sl9Qe01zs=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyoZGEdv/qnNM7x93FQGFuUkXxnnEYsXgROApJdCv0Q9mrY809iwOGB8KOsEqcIn1NteqlfGtroF4XvziXM9+x9SoEfI8bNIwfLNxFcBRUEXUOXbI8VgDeJ6kmCbhMqjqAhcDCV+X2NP/1avHtIekGzwLHYbkfR+W6PVe4boqQWTsbTIb6lPVcO0/FY59LL5WkhrJR6/Muu6owsSgRMoFeQm2jFVMzosbn971t2UIyAc/zjU8bFvxcjGnlk5pj3+n0wC5qWYDUIHjfp+7Joo+Rz+FkCTCt5sHB4IfOkwQTm4rzLWk4FMrQbOOBdjN62epvaIZaVjmMjLYMq+iimiqLPdtiuivLINSZEGv/stolmOG</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Q2El7xl2nclV8dy1aEwdR1are2UfzpZOiL0JpXF4tb7GE9GnF6kiOPHgVgMRS/zjuI+M56bpgQA6kUCnB0zW8bH4C8zYzdVcD5s8RwJfd1t3lxeP6RbDcKl7DR1XTXFSiBXHoaSoNUnm0s8UJKTWBpnbu2rlcjvoYL8Gs7LdgfJNrk9hqO5kIhNlWPKewckYEI1kvRiw2hVYtAlMkwZOf3NYf+eWILuBYSkYmCLYVqhXfmSnAutbDqD2mSwOmSubQ==</Encrypted>]]>
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