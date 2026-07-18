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

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpC27BqRU8xdnEj4jR4vvK4KDr4lmE5zoHb5FtWcfA+daaeKBzYKCL4TzdtvQwxm8PPhHruWwb8nRx/V+Ri/Uuyxg==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcH2L/VVjLJ6DuWw3aEnIHoGvRG489h9ecTss4JnQGuv7FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbibcivfkKrSb8Ljdlx4zEOXTcqCnyfrhKrrkxnZHAQF6rT61GFtU1sRcOVPU1FJO+ZBz54uydBk7DBCQ9AKRSS9bxf7wtFKABersRWhy4h2XM7R2bOk/hJZmxSlUhiicFf4gSlRXD/BDNJoZSX/zX4DodR2tmXDMzZaeh+MikSaxKy4zzXRUn3UfFGnJG4DK8ch2l8R8U2MSmXVW5zcVYhCDsfIb60+b3fr9ljGcz0GYZrtgsfH0RlCiy2iOLuvSjT8zYR4cOHnAunx9xYN+wPdyn8aet0gI/EQpmNtNtHtyiaARWypsWY43qr+rMztgMKR2smqeTp4nNxL2UdxYbTHRu5n7d3xEwU8F2HWuuHx7/nnOQ+wz7Wn3oSdqyD15seZCab6IAy4z5CPOXV+htGwk=FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaWQtC0vfSI1Nzknh968bmTipvbXUSQfqzXJJBGabUuGO7IsGqwy8IeoYJzdxR1QFBA9K0+nKFw+EBdABSeCf5NQConU+W83lYr2uslv2VvqSw==FastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMuwgLVtrvgxqL4v/cwyQYXkFN3L2ct8hViLPyRaD7hOXjiT4XN+utO0WFOzn4h6I1aiSMTODhsOkDSY1XxwelsZA0J0hXCsdb/WKAnrGofRDgQaHg/vQCPpI1o6NEXvmxJ1ftIsNkLxGTvVn8BiSGM3o=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUTWTmxkl/+1EmfZzjOc0vxY4eWMIPCuhlGBOv0fNlGxSOgw6SZ9nqmKi/+H5VpnuYA==FastBusiness.Encryption.End">
  

  <!ENTITY CheckTaxCodeCondition "exists(select 1 from @r30 where ma_so_thue &lt;&gt; '')">
  <!ENTITY CheckTaxCodeConditionByCustomer "">
  <!ENTITY CheckTaxCodeFieldValue "'line_nbr, ma_so_thue'">
  <!ENTITY % CheckTaxCode SYSTEM "..\Include\CheckTaxCode.ent">
  %CheckTaxCode;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.JRTran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m29$000000" code="stt_rec" order="ngay_ct, so_ct" id="HD9" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chứng từ phải thu khác, chứng từ bù trừ công nợ" e="Misc. Receivable Transaction, AR-AP Interface"></title>
  <partition table="c29$000000" prime="m29$" inquiry="i29$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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

    <field name="d29" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="218" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="JRDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="218" filterSource="Tidy" categoryIndex="9">
      <header v="" e=""></header>
      <label v="Thuế GTGT đầu vào" e="Input VAT"></label >
      <items style="Grid" controller="JRTax" row="1">
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

      <item value="1: [d29]" />
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxVMx1846CkzxbSU4gmbG9yqdRZoJBzemZMYFJrYwsjqlh2FrHVpf/K47CIBe+8i1o3gnL8yImla3OnUWHn++XypINjtZvRvnMV4nsaUMAMAW+WEkTVBHajIoPVixq1AjOdV1vqF4INzL6ULWpR5ISE2ucCgsPOnQtVOMpTUPPEOsFUGOcusD+C/9+1Rg3YKHNol12laimKEKozolDClTstxxekNNhg7vVhPfopbSPHSI=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCd0M47sadUXUTS/2Drr3g67HEknncTxQQxmYXNNlH8Cwfr8ZqpTfSkgk3qWPiDO+6LhUev3NurcV1/jtbOeIW5qPi3nKzujIkBDZ84vEvK+</Encrypted>]]>
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
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XXWFyhs69eHzp8/i9wp1totf8UdWkIJzDEa5aGRjVzxdbsKnQA4NvAWVRJEtwopfg==</Encrypted>]]>&CommandCheckDetailInputVATInvoice;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22eFQ+FudFLqOJ1ZESJzYLQEwH4yZZWrB0it+JxwHcPXfYKAAD6nXCfiKLa+POAydiNRaHpKeOZ96Mlu2pMsmuks8PFOXMaVbVeWa2jZdu2FaTLdu+Rh/3Vky+8hOL1HwaaFoz88FCG5JQyGWfRxfStl09yN5HXvT6KMtkOaGrEN5sUsU1ckXIlHI7BmsnJK9+mntdKESSQCjQArVzzqpcxM=</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku5kKaxuHIrK5BjeW/A1fBTWXa9E/W+2BA0DCT7YMpwh7BtkxrrsEM1Q80xd10VgYt8twrG0VRcngIlRhleDUlEq+7OCpLcVdHnniiNq30K3xz+Z42ZN3sgpJWXOtfo9gUUhuIPixYhid5M1BcC3YLnhnvb7t9nAXuTg+PWsuPF9OAHt1C9Ixiacgza4/WhTV1cCB2snPXqzufIgIdQUaDwJq9vLmAQlEYoLCmV1awULaNLKgF5uhIvJ9pqJ8nF4Vp8L8VjUkK6hIbuOhUVLajEWwJsSTXiBgsO3wugQMHZghd5yxO47N2LllenuGnRESt1Oquem0g93QWoGHxUiq/iEsa9L3a9q8H49EkBR7StrjSR7Llf/WNelre3WondmcNQ==</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bawAG/pISL996PAqFPE6n7JMKaTYVA3n20H8nkIAaBufOTxrYDaoTPaEQmMyGSG8OrMYxDXkQwiSUE1q94Sgiyv1fBCBMFVZbQQD3l4lH++/UZj3dPpRcLgnid61TLFtzHHy4wnRhtVJFKXBcxiZ/SgLNt9wGKe7SYI8+wzDfY9U0YxMJQ9aZPbnk8C6ruXDnBAimG7WrHvPbet8rF4Iy9X53b886GjKAzCfQz9UA7dirT2Irjon7CrXXNCESg61Q==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6H1EhmdaOQ+NGMsepA+7S1YtzabAx1m1q5HD5EvTP3XdNkiGf52EXAlhAq/f0JoBYaRjzQaftg2yK/9Uh8W/qFzUObaavjqswYEyBwJTqoR5z+ZXOJtJZe6muU0qsDl+ob/8/FSQd71PfVAYduXi6qcZ/w4/KjKVOYNuVzyLyvrWQWZRNqphVdfTIKH08G76ZlRzX0zvYtUR7dpJZYkN9Br/S2h3cVpv1JrnZxiwEXYQ==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuw4Ghk3Tea66fvkd3hEjDS+tXM6emRj5NSBb9SpKVYIjg/lwz8UbsWf3ZqN+IEx9vAWhHhitoOk8cwVDVpSBz30=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
        &Delete;
        &VoucherLogUpdateStatus;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22X9euTvmH3eAzer2+ZvDJbE=</Encrypted>]]>&UsedVoucherLog;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHvFSNzMHd24rwNP4C3O42rNuZFwCg+sUIeCXnhwJ1OmwZI+oNZod8XdQ9cr3iMapBFNb6Sc91b6FmZ7ywPZZRVDHJZ8R8avoZT1GgUxGg79g0HZqt0nzFdMoWSc+xTm5rfI1I1GH7YC61DFBzi5RFIkTwOpLRa8X4HhjTZqBzTS2RZVW4cO59qv5pR9rVPA4ibOLBIv/dApykEG9PQ7x/CI=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGTa8jTOWTWqwQgCxgO/x0XSy1WhnCs2obST83/49iprbAIjXavnq6vhQv+2Nt8uIUs3x1zggpK0BQmQFxr16I1fJPzvq9yfK5mcTcXxdG2q9DRR1EdxpTyhFgesw2bP2j7tov+lknHbg2+lr52SQsiYFY4uYgu2sWrYfJiaKSeERFsS8kFGxi4YC2WroQyjPAIsF8+Isad3aY3ePFTnYjgT4qE4Sc5RnvXosv0iMd8SlL4wywP15n4Cob/k13wPE3nu7m2G+A3JEKbEgKau/ysWSNM54TEogKztCCszbliRzZyFTJaLhqAmyKs6ODGf3wmX5j2T7aKpb1RJm6XAH7RbYEDzOVuyK4QXqPQKQTJfLBtnKRIpq339SM6/fPKaAg2rTuh5SayGtu+t7tG/nfCh5LRO30JTJa//ZyoV0lFjUGJW6rv+nm8EZGrlnKZnkiOfF/JVKUAsGi5xzv2eEikRhX3ZdIjWbLPyLBynq/25pNHFwEeUOuOb2bJBbBnQXaUEWM9Q4oWlCtEvLlQmETokh1DRKgrj9yfO/tD+teMAQWkrKH9sFB4Kwi0y9xzmIbDS8ZC06Hs5b/yIH3or0HWyE/HPA+iVpyLZZWq79KEI43iHWkQEp9wopz7gvir+9VI0QBatfHBOAK8MW1zEx5dqA/eiRigD1VQDxTjSbDhe+ZeYFpkSEbZvrVydJrlTedZzneERU2fJCwDffVfCxRwv7QLdXVvTZejTqdBrPJgemHDfOtcku5fnf0mQOdf2cPM7k7MzyUVYtzNnn/IXMyJW+ALWAMLA3EBmWFSI5SkEduQPgQXr4Ns99me5rGXZP0H10pfNXJ3bzPrZEimkzkfMwW1tzGg8MGfdL12dro0LS0pbFQblOs5CHMVFhzgWdclKxfTuwpcwP6d9RF3DOCTm+x1bdUSkquCPzxec2I+NolkN1DbtytDuQoSL0sc3Z0SZh+sDtZzavlfcrxjIyUEObTDMNnyesxc6YBFMysbVuM5qS3eLQLwhJnWcmlFfLmfG/56Kg5cbArO716sEW25c8kho0mOBEzlmkGr3s9VQ50J8Nx9UloqCuk1LW4F35uZN3xCoeOuWb5kseHWjSCArxKbeWDXde/OqRpNWMdZ6Kbp4u6sQYABRUfG7EnK+6xq5lyBzTFL7TM4IAscvJ0eFw37NItrKrNe3an16xBFtK7VXf2yYpd/sTmqkXZ11Pq2CXsXJ+vQ+d9cXIHBkcZN1ORf0GpIJmo1Gx8nTkxO5BrRpc2WD8Cak+Lqfd8xvpTk0ovvzsudiWaYgWU5xGpaJ7z4uLGzJJS7LtT7LydvFznzP1mVyKz4GCedQKduFHdmtlTjmQAPcJ6oD5AWd0hgu+Ikkn2OczA6IXldPgfGuMTmm0Coy/B2eFpuvN+feLcAX2XZ4JGkO92cDcUT92e9Ky1HVeGrIXZyl0EbpK3nPIlyMSYABQTKEkSAc57tzTmw/jS0sshiKZ9LqqTajrSab9ftHIr/X7Hz0fXhcsb/2I7pbe+OXpGKhvj/qErMT2mgyIijuI+8U/a/ftq9fBpY9R86c0Xun6nPzmQ0HmFTEkn6O6LMXloFa9bWjd4T0hfTdQx08B8INCUAqebWbgCKPgWKvIDvplmjeaX/3VoKf+ppBL56pKX4ZjydlOAxNvg==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5Lpya5pYlEWWAacedGhSUOcnBIuWsgBdWaeRzPUaGA6i9/JvJaval7Rd/u+mZ17J2ywhuNwpzpkDkazRebZnDawig</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxd+oRTrM4GbHldzXTxwSKs8</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWym9wbgs85nvalQ9Nb4tkNBULONFJ+rXydvRx3Exz9pxEjcZSjdGAoz8aB/KQo18IsA==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezxCT9Jx6LNgnA57/Q7a8uUKOvJZ2naXYUiMiODIQheT6tHAEhSsoKDCnLhQVEoCbT6gZV0eAqWdL5yb9x7ZlA4E2WOk7DJEcOrelyWW8WRTvu3oytT6Eo0cPnpWNqta62Mcbu1j41AfZCR9tHuAp7js6tbZkrN6ylENbslG/Sv7H2UpX0RXdvzXhVB/AG0mYLteMdYvkyZuiZXH67ggamAA==</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7DpZ08qIx6gjDSaWiHtki5leNpYQeSuK8OpAt0mL7w8tsUvmCxHi3ICfnxIfjwI15AsPUsBBvjysC1J9g/85X+RIHpIguOVpfPkGigxis4oL+OOAAT0WyPtFkxPzLKKGu/Rkb+Tg8womaRmHHtkAZ5ztoIFsBNYWyrMt5Tp1z+gwqDIwUF5RVERqsDTkLW+gtWx8TKTDMc62O0hvnRRcGqNWBqILKJKbco0RnJCsJC00ZvbPwLnZC50Y4HVZwq6kkIklEEhX/UWhRU1h3yP0/m4vjhRU2OF5wH7kgl/+EM6SPxWYht2X3ZsXXt1InUrwHqQ72a2TrcyVEmEqIJlAxDLE01jc6AIvyX+zm0n0jauIYFiXcKojinM1C8OM94vs83TYbVwp9ptFHsizEWpOijCWDFMpk5tsUxjjLsJIAvCAg==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WbYDiTy2Z9/evnhJfcpncQ1+FQ8R9rEEhyl9VBElnk8EcHS2s4IZ4X54kBgAON+LlbOTNwD2IqyX68nJvo7MeJvXdepFwvIYuKjisyT8q96ASV5kpwz05u2yY6ZVh8kpy</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxlZv2wrz+HFskereNNxiFu04UDW7wpQF683gMZOEipKGsg3zRZY1J4GuXitzHIatULiFHaOmWjwVPZvYVKxYtcw==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGPks6+9tqqlRL9zedz90p2oOW5HLFPtTwi160AWoeHnPzJhIezdkm1AAtY5zTdyOVnxckBddMKW+ghfsGTHiK0PXJZU+PwAhAamBE+VZV/Y7O0EOQa84d8Wc2OVlqhkPHpLOn6rQcCQ5ufQAyEyDXjzRTbomuadx/VczspzWCWhzcNAP8MLZa2osrswmBz1P5g1R+jolqW7w7k19lcxailKGnr30hpuWsBInXkeda4h5aPaduohXlBHkCrkdSScEaGEaeXwmj9ty/hT1/ntj0x4zYCu2E/qBcwScvZ9xl/AJZQ+fOp8K/qnGvhRp1qocCqlJHp7mNK8BYZ7G00IPE/ZAhZUSL5XcpJwz8IEgW2LPA==</Encrypted>]]>
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