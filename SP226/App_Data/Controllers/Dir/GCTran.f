<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">

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

  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptCurrency SYSTEM "..\Include\Javascript\Currency.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherDate.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY BeforeUpdateCurrentCustomerBalance "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcGgCdkizneINiJ7QgXDaQnA2R8v0cuIDeQYZGXh1/ONPJbiu2LRulZDyIK4qdW286pVnA0vzcpa6rUzU55Ss//9uRtsmZefe7Ei6WQ8avBtBA6B8P3PplsA6KXwGZb+r2tZPGSIckD4ZrExZ58MH7lo2V5UK5FgjbStid/RYs6FCuKF3wCDjUD1r+RMVUlvhvhAZYLPU6oery0R4OTam6JJpN6UrXB395CXmgLKnyh0XQO621kvGVgyZnql4dMIfMf3jV7HLuzi8/acPkBpokSA=FastBusiness.Encryption.End">

  <!ENTITY AfterUpdateCurrentCustomerBalance "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcGgCdkizneINiJ7QgXDaQnA2R8v0cuIDeQYZGXh1/ONPYa9wxQ8VbCTaeitb3nI9AUGoIsMg5Trb38Eo+dfGQYEOWy2UepCv9gAkkqC+F5huerkzWgicpL7PMOUKXFxWzi296HBYz7MZuXbz4aimI0XDF/Yh05UI0Cbhsp75b/F/IFW1OZx1e2KwsEvaka19o8tyJ96iqgPwwrCPLu6Rj5tGf1SRKrpoLR2ltch72vsTGseOi6bhD7Eq65+6OVbelUjFIptfgtdFXAS/DYm9UUM=FastBusiness.Encryption.End">

  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GNi6qnX1DVD5tjL9wGe2YbrQ8FwqyweWN+UO2FJnklcd6UlZNyeu86f7YlgfH+Cc28MBZgjV7qB7D6OvGQPutzE=FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcH2L/VVjLJ6DuWw3aEnIHoGvRG489h9ecTss4JnQGuv7FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiaHofGFJpbS3YoWGP8IosdaXsHVY4LAwQvxqstZPFyVa8fOE3+ActJA30mwTa9B845dyrRversQvB7x7Fp2/IKx77KwUY/VEcPoX4az6a6hx3EE/tgLXgW5DCfeVEu1sxSux1ukk6FAoYMOFWq5x9cncDsZlxEXIYqxHl/2X8yGoy1x5rOeBq5jCzGve778rfVqpZIgWPEglLqjGeb2X3AqZkGaSh2rI8tttK3QfDiVwINoIci3bqRsiKBw+kCxNOXUs4fQ2ZKIEcSvSFu044zQqsW1lmrYmg9pwTOga8V+QVDxMA1gAIP3AOQWWRor8u59DttcbXL8xKpsVdZjB8smDapQOpJ7pzvzmxaZw5X9ZnU0zLgHuFr1ZnI1BI6xCRGNjT/pkXgB3CeCTpLOv/Wei+K9Fwqf802KbqFjpJCFuqGCAAKFwsnhLB/QeWRoSwmlhZ4jKF7NijXRvj+oW4T8=FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaVHLDSgsIbjVguCHtVzua1Xd4DDc9qHhzSY4P9JU+sPMlY5ZIGtowk8+stCarluuP2Vco0Lok69SsCO9EK7DwX7ZZTo4C9eeUYwwgMPGid31ZImLEydhYuPtsLDuKVe6OtmVWXfLyDs7aOgZrzreXaUFastBusiness.Encryption.End">
  

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.GCTran;
  %Extender.Ignore;
]>

<dir table="m12$000000" code="stt_rec" order="ngay_ct, so_ct" id="PKH" type="Voucher" uniKey="true" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="bút toán hủy" e="Reverse Transaction"></title>
  <partition table="m12$000000" prime="m12$000000" inquiry="i12$000000" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="loai_ct" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại chứng từ" e="Voucher Type"></header>
      <footer v="1 - Chứng từ ghi âm, 2 - Chứng từ đảo" e="1 - Negative Voucher, 2 - Reversing Voucher"></footer>
      <items style="Mask"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7foBrYLz29FA9i96TY/Tpl1SikzWH7jS9ukReWE5AxoW0zEDqCM2Jl7z61Oy2ZbF4=</Encrypted>]]></clientScript>
    </field>
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
    <field name="so_ct_goc" dataFormatString="@upperCaseFormat" align="right" inactivate="true" external="true" defaultValue="''">
      <header v="Số chứng từ gốc" e="Original VC No."></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct_goc" type="DateTime" dataFormatString="@datetimeFormat" align="left" inactivate="true" external="true" defaultValue="null">
      <header v="Ngày chứng từ gốc" e="Original VC Date"></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1" inactivate="true">
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

    <field name="d12" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="218" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="GCDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_ps_no_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Phát sinh nợ nt" e="FC Debit"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ps_no" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Phát sinh có nt" e="FC Credit"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ps_co_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ps_co" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
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
      <item value="50, 50, 30, 70, 129, 0, 100, 8, 100, 8, 58, 42, 8, 100, 0"/>
      <item value="101100000-10-1: [loai_ct].Label, [loai_ct], [loai_ct].Description, [so_ct_goc].Label, [so_ct_goc]"/>
      <item value="1010------10-11: [so_ct].Label, [so_ct], [ngay_ct_goc].Label, [ngay_ct_goc], [ma_nk]"/>
      <item value="1010------1101: [ngay_lct].Label, [ngay_lct], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="1010------1100: [ngay_ct].Label, [ngay_ct], [status].Label, [status]"/>
      <item value="101000000---1-: [dien_giai].Label, [dien_giai], [stt_rec]"/>

      <item value="1: [d12]" />

      &ListView;
      &PostView;

      <item value="---111-1-10-1: [ma_dvcs], [cookie], [t_ps_no_nt], [t_ps_co_nt], [t_ps_no], [t_ps_co]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
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
        &CommandExternalFieldDeclare;
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5GQ3ujB+G6PxUXu8157QrM80oDxL7nZWZ0KcNjPaGZd8t27x9Y2mLmnui7AH1AcP+yFfPP7SYl/3SJ7ZjsfEiIY=</Encrypted>]]>
        &CommandExternalFieldSet;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2MVIdLeITDonpSkf4SzULp0mS6UBKCO25fx653HXoWzMYP89MxcieHX9b0Ybx40zt7hAMR1EqFqVqwUPbyaxnBLh3fCNfrfRKwDT5HVD3ww3bVctlMMnQhJsQchNurXQ4gdJAp/xt0WZSqmy3AcCHHG+9ssRQijp8QG/sIwwzm0</Encrypted>]]>
        &CommandExternalFieldQuery;<![CDATA[<Encrypted>&uLc6/Bny5UrSIRuDTGst3SSo2x9WP0+Ul6wuX+5FQ1iA6UFPOBOIUis7DDneyDifLNYHRtZN8Tz+TuRMNcuHjprHk7BMFDCRrKIuIEkaDoY=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu85loT3gNpYhPh8NVBlcf38a+q0/05ABaiZ+jM35uTkxP9UrJHlky2soT/hlP51J8YCWp4u13SqNTLrWGbxcTwb1mXbIR+2y7tDn0qwDP/US</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcO5gpt6SUJF7HKa+7SYvpDnWChLngV+k6MacHMi+wDYdDdHSpyRsZ6lsf9XTpaOcI+/ogzdh41PpCLbI/S+Gq3N+hI321KktrWHdUPD/p/CeZHt+6lCtk4i0B1CsroU6TatvXJ7Jer4jbWxGwTw/LVMtFufSZdP5/t36a9+blesdRp+E9YDMnb8KVk+OlPu7xnO9d2Tv+CtdsKMS9kiPJkXb1ZmNBn/+i5AxGGuNRz2+6UgzBI6LclRf53aCrv/+JFp37qFmj0WdZZ8tdBjeA4k=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNG92UC3Y/9QPZihwzUoTkxLxG/Qzp2WfhFD+5XbjBjjwYWA/omPi4ug1AplecDO8w==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4oIzzwbQpRDIMaJrvXIVVy7HQQ0bK7vOgLkItwoSlH1ITGTcrOmDtiJgLBEOOyk9aBlbLRjs3oZeOFwfrVMY7Z0+QJFjtFg07EpcSx5wW2lnP7JPB9bIs2lzmvC5Rdjdg3BAojMW6vYeMO/g8ZepnBsWIPb8HAn9fBrq8q5vtoFqK2WVQz9osMkZXfuYcZhfDaczfWPY6tvRxonDPcX3ECyiLvsv6GuGxaZgcgSTCDqoeozTHTkC8iw+iR2lAHwDTICWaCt6m2eQG4Q8Z1nEiAMViQmlW+0Or7gBlrrm04OHW3ktVXzU+YBpb0yHVkOzTXoSo0COltxBh4nwEO9NcgWhimuOkDd6UGugcU/2EzLrnpQhimaabIaW7nWumxBxTHDjEnxF9WppKdI/NvVx9aENrRfkL1TnsLUKJJyCJbBbsmu4tukRNA5gYlJRkf848+clL3zVopqdr+m4VfL3huXq3LGZbVi8pSKecf9IcoO</Encrypted>]]>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcO5gpt6SUJF7HKa+7SYvpDn4cktUL2HbIpCFRYqr48npZSCrKsfgu2Z5hxAdpbJa6Qqv8qLYou+o4MWk+shpqLF95PUh0kQkc9gjYlBlzTqQB6i3bA2oUjUhKQ/tWA5LdAofuejfms1VeEHkGb8pJxCdA+iyPwcOuxl5PDs24Q8Tt2zJuSfj14Xoz4jXpAkxnH5uxaxMiwiMSxmQ1Wl+YxJe39CEaNteswKWkmjC5VhVeURlVwpIR8DiO+4cOmO6SGxB8ypsfelF+d9xrfl6FkE=</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22c8/5AzqnBs/U5O+5kUExrG9F1EZNPO8BXoU155sSlV7pkrOr7eBxY1U8Vakf34Z87tOMcAKc9LkQ70Xivg39ep5wdVhqBOrXfSJM9jqtJZy8hcr+aj8+rI8h7FM3xFD/6ogddzZiuIUOHAAqRGRUJjqrFeyar5Zzslf1zRkVxn6ZcQ6TZ4IEU2Xom3mBwyMAQ==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcO5gpt6SUJF7HKa+7SYvpDn4cktUL2HbIpCFRYqr48npZSCrKsfgu2Z5hxAdpbJa6Qqv8qLYou+o4MWk+shpqLF95PUh0kQkc9gjYlBlzTqQ2BphRddhYYWQjE+4MIhxySIHYuwrYoGbriR2buv5e/fJeCbaztsOc3SCmUkvlNXx</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu91XCbojsbp2c+bAKF7GVC34X90QOA6uG0uD5tq1hXqVn+dx5joDXk7I6uhHMAIqFQ==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu/0XRrMRMkZvOFpeVG3Yui04kJ382HJ05dsAk6fbtgU7Pk8V6C30ZRH3+81EibVLOQ==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &BeforeUpdateCurrentCustomerBalance;
        &Delete;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22X9euTvmH3eAzer2+ZvDJbE=</Encrypted>]]>&UsedVoucherLog;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHvFSNzMHd24rwNP4C3O42rMkZtPWG31ZsuudJy79KefQi0rralUu6dT6Q5yobweu8k5YwDPv3+8XT6YFCxd05R9xZH+xSI/27yHlNImCDgUxD1USzkd/p9PKDeUveotip1sv+Fl+QWagIZqw8QZLTTkEpCWQg1qA8Qy87swzC5TY</Encrypted>]]>
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
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5Lpya5pYlEWWAacedGhSUOcnBIuWsgBdWaeRzPUaGA6i9/JvJaval7Rd/u+mZ17J2ywhuNwpzpkDkazRebZnDawig</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WJ3V8EqJ2S6Sb1Q9d1kjdl2oB/LPj/nxJOLPrwuhcDp6B9VX3gok075OSRsO9kiXeNND395jCfRn+UjRfviDnnO5PU4DUDhuO9r/SoHVvC4N+q94FT9SqNpbEuRT3wWjuIAjy2xtjd7aok9EvmVLOZvpCdQQGzCUuqRN3Hwkggx/cUn+J3KlKy1vXNCIl1isCaoNZtRYje05L9ndKbyN1o=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+MYv8XGG4TVYOq1SdOrDIew==</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&kgSH0HK8qzKbg/rQtWUzkcaCcsvJu22Pi+AZMfxkPyHsa9C2IyNZfocP+csv+SS6zlMT9yGnK66ER3CA4yX1Gsq+UY65tdAZzWayerFdlBE=</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WUdrEx4Ddkm0kC3THp0yufYep+Bqgwhk2cTuEncga26u2A09HhxRrNxhyRpS47Is8uY+dnFRHuG6UnDUzspL9a4NnFjDzrBf9cdgATAk2mQl8itf/OP9/eTOBHRak2Ip/kOVKGPALAAnz6xu1a711DAnA+vjgcYyo5kVT1FaY7tthxxv3wpjOVn04kaBGacSi9n7PtsBvxrLsNwjm7w9Oo=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezjn9BxfZ9TtyZxQUEjqugYH8SCUoui+JdLqWZIqr400w1u3tAObiQGhRf0mPFmW4OXZnvNDUdLQ+gw+kvJ/+lDi89wq/VsxozAOuhekC+J6cxsPWbq9DfqDfdNb8ALxLxMkejJZd3E8SoYYhpTN+ouSAT1BqdlZ7wNSy5+ejf9NIw5jcJ9w6uaaEPZLMvq9u2</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4faFOs+Xs65Ec+Ah6eR51ky57l+bjdCHquz/pty8nxIer/RslZHJHKguDfl3iy/3dA==</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyPLV2d8IbJFyvS9cAqewkrWFsIbcbhyDcTACyBuVcfAH7r+Pbid6bSH5g1w2Od9POOxrvkmM35uDd9cWMbMQDVQNYaPDgz6Cphlzl0GHO2lrO71NT7w4bi7XrXfolSIsLI6ESetDSq9UU5dLkw+n5lnzbAb2LUmbqjYLEyMqkNsLp6wdU7QITpg1RlIJSyUuEHZimR2TwvOCTSmIWFnxgGUxz8ODaMilxTbHFZIgZ0wEO7SMZPM2ZHPuhmSsFRGvs/1m6a9qzlpTjThTTZU8Gfj7j9zj/3EvlgIVS60tufsGHq+k3yI1b7kbpGquVWcepdURjoYXCgBGPPEXpPvOaychOJWA6Yb24r5KOWQi2BiaCVKI0+00gUv5oBbwe4J2/eCTVhFf7Buli0WD7tzoiOmhT4/841mSHyyh2FRrPKRxhwd0CM/oWYYEa4YW3/wk/yoHSoQRtlHlLsS6+7EVwI7HVw8bJxSwKaAdJWA76ig/8SelbuirM8zX+SyhMT74/HWTFsaaB4YzkEYbfWuqYEmlk12HaUN4Fr47O5o+/RW4S/7S0/QbeYGb5jdTv08cEQObMpWi30HR4aYkZn/xDZhOT3z6tvse8K2eVs9HyN4Z3kLLJwSRXh7Rjzvd1JWxg==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4aQ1vpMQtKqZajnJi7+3WO02il1zBICTfRJi54ksq6RrQTbSMHaJ7UFY2ii6jNZ37MhQGNWzHMg7Ln8sydMpWZg+zURihOn5Ho+VWMTteSlAmz6o0AeBc/pxUlGuKskErWO/NsHl5AlbWs7OdkkuDYQVixvEmON8NWjIi/QkLZCLJANErYEn/EBTRkbi8vIa01hHlBoSe53YfGjpZop+BaMHvdSPZTRWQBRRlRIWuhvR</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VwbtiVabi5d5ij5Cp8+oJ28PieX3mcuLTK62F+BNcz/WXMnxtcTMHDHyqN2tPyOL5N6XNmc5K2Cr+X3eq+CuiM+JHbDDsAuaubPRT2HaJ1m3mtJod/ZkQ+eiEuW8X6gty0KWB/DXeaLbOUc8Ejx2A0V+Sq7+fArRakTtdeyLfZ3RJCDgNoWPYmhud7JYSv0IFY0N+6zWC5k+23T5qwe5Uj0BTX9dvp6Ah2i8/f/PfZQW0maLIfpZlegKGcA8jGM3wSejR08MOio20pUKb8IlZxrKw8IxY1rGqD7wqCrEo9KWkVD+FcSBiY+57HKSu15DuZUcPMc2q6PYf11C5yTLycW/8GFZ1aFx1Qceze1X6uHn6XBcZb6v04/DtdQEWo7xMBYBRDBpZ4VvumJowOnIQs+lCtygxUmUidGiSxsamb/dcYdSmA6SHnZbKNE+/ix+wgvmTrhTguxY4LoXRN2BNvur1Z8phJlO3kaF5ROG8b20HSr53/LWTHbEN1vHtn7PeyIIVR03lQKhKBuG70BXbkggBV+AUXyGsGprUfwmYp20vRe4zznvL5J5lJ2RA4r200gC2lKva0CRWjexNSCqLUjdyCxLPSLY0Urb/EVDWP6</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Zi6iBJoDgNEoUNErN+l+rfvm5h9FMheoXA2fVsWucgUfMOSXKTZOtOGw3AWXxJC+602pGjH3ksGaNaVULygqbpNFO4akjO1wWg0hgMHdaLOqtb1GGiuiByt9+4hImaJSw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmF3umZO5+JnDuaS+LO6LgTaFwSwFj//tRZXxAq0MrzffRsMrXsL/E1kgrcWvkRJ0EIYJ+b/JM4GPC2gEDvwBMwjWBeG1f2XyL4P//WdBxsh//AT9g89FvTC8goF1aOOTqr0DHHZsuugMNnXZJh1/4+V2sD/nhWQH3+YgHIs8oIMLC8aWkByzhFxkmhBhHcFtaUw0LG7BBII2Vi1lhGOE6s0SmQDJhtQIG9pzHWN+Ym/9gHd1wDx47weKucs77A8PK</Encrypted>]]>
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
    &ListTicket;
  </response>
</dir>