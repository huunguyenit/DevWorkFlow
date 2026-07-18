<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLGetExchangeRate SYSTEM "..\Include\XML\GetExchangeRate.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckClosingDate.txt">
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
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherReference.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  <!ENTITY f ", @supplier as ten_ncc, @address as dia_chi, @taxID as ma_so_thue">

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCObv61UhEfOVWfm+kJx/GlyyZM9YyI/K9fZw9BI1tvcfwpRcsetTKqbBQi6uGkoIjoXdTUdlC0zV/CIU8m8swYM01f8oSQqLF6jtaR61Pm9KEXP/6S1vXv3Y1WHawIuO3QqWK+H+SInVidjK5qhvEm0wjsDHDd2MK9OQQNPiRVrMu/rEnFP6HdBGIH1spqAlKpqfQ0UkVaEsEQFxqJ8AhMYhV7pO3MFK0LSsdkfdQc9nBAk0oILl569di3gNyOp0eWUJys+vx5727YlkT0TpZW7iOJU4UvditBcvtu8MaDljTVXJm8NE3fv4P56OVy8cJZWCzZtl6OAgaBGlXTha1yg==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$pTQXBBQSNW1LQu9L+DaKFMf+/1SRcVQ8LxIkmQiJu9U=FastBusiness.Encryption.End">
  

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.PKTran;
  %Extender.Ignore;
]>

<dir table="m98$000000" code="stt_rec" order="ngay_ct, so_ct" id="PD3" type="Voucher" uniKey="true" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="tờ khai hải quan" e="Customs Declaration Sheet"></title>
  <partition table="c98$000000" prime="m98$" inquiry="i98$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã ncc" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(cc_yn = 1 or nv_yn = 1) and status = '1'" check="(cc_yn = 1 or nv_yn = 1)" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>
    <field name="ma_kh3" allowContain="true">
      <header v="Nơi mở tờ khai" e="Customs"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh3%l" key="(cc_yn = 1 or nv_yn = 1) and status = '1'" check="(cc_yn = 1 or nv_yn = 1)" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh3%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ngay_ct0" type="DateTime" allowNulls="false" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày giao hàng" e="Shipping Date"></header>
    </field>

    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="1">
      <header v="Mã giao dịch" e="Transaction"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="(edition = '0' or edition = '1') and ma_ct = @@id" check="(edition = '0' or edition = '1') and ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4LXW3G/8fV8D5ZJNQD+j1vOMoNFneLFQkf/MC0Th2XjQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher No."></header>
      <items style="Mask"/>
    </field>

    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày mở tờ khai" e="Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" inactivate="true" allowContain="true">
      <header v="" e=""></header>
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
          <text v="1. Hoàn thành" e="1. Complete"/>
        </item>
        <item value="2">
          <text v="2. Đóng" e="2. Close"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d98" external="true" clientDefault="0" defaultValue="0" rows="146" allowNulls="false" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="PKDetail" row="1">
        <item value="ForeignKey">
          <text v="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r60" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="146" filterSource="Tidy" categoryIndex="9">
      <header v="" e=""></header>
      <label v="Chi phí" e="Charges"></label >
      <items style="Grid" controller="PKCharge" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Thuế gtgt" e="VAT Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="t_cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Chi phí" e="Charges"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_cp" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="t_tien_nt0" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien0" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền tính thuế" e="Taxed Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="t_nk_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Thuế nhập khẩu" e="Import Tax"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_nk" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ttdb_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="&lt;span id='idf_t_ttdb_nt'>Thuế tiêu thụ đb&lt;/span>" e="&lt;span id='idf_gt_da_kh'>Excise Tax&lt;/span>"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ttdb" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_tt" clientDefault="20" categoryIndex="-1">
      <header v="Mã thanh toán" e="Debit Term"></header>
      <footer v="Mã th&lt;u&gt;a&lt;/u&gt;nh toán" e="Debit &lt;u&gt;T&lt;/u&gt;erm"></footer>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs" hidden="true" readOnly="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true" categoryIndex="-1">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" readOnly="true" clientDefault="Default" categoryIndex="-1">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="206" anchor="10" split="10">
      <item value="100, 30, 70, 121, 8, 58, 42, 8, 100, 0, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="1101000000-10011-: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="1101000000-100100: [ma_gd].Label, [ma_gd], [ten_gd%l], [ngay_lct].Label, [ngay_lct]"/>
      <item value="0000000000-1101--: [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="----000000-11001-: [status].Label, [status], [ngay_ct]"/>
      <item value="1101000000-111---: [ma_kh3].Label, [ma_kh3], [ten_kh3%l], [ma_dvcs], [cookie], [stt_rec]"/>
      <item value="110--------------: [ngay_ct0].Label, [ngay_ct0]"/>
      <item value="1100000000-------: [dien_giai].Label, [dien_giai]"/>

      <item value="1: [d98]"/>
      <item value="1: [r60]"/>

      &ListView;
      &PostView;

      <item value="110-1-10--1-10-1: [t_tien_nt0].Label, [t_so_luong], [t_tien_nt0], [t_tien0], [t_nk_nt].Label, [t_nk_nt], [t_nk]"/>
      <item value="110-1-10--1-10-1: [loai_ct], [t_tien_nt].Label, [t_tien_nt], [t_tien], [t_ttdb_nt].Label, [t_ttdb_nt], [t_ttdb]"/>
      <item value="-10-1-10--1-10-1: [t_cp_nt].Label, [t_cp_nt], [t_cp], [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="110100000-1-10-1: [ma_tt].Footer, [ma_tt], [ten_tt%l], [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="9" columns="769" anchor="1">
          <header v="Chi phí" e="Charges"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="100, 30, 70, 8, 100, 8, 13, 87, 13, 8, 100, 8, 58, 42, 8, 100" anchor="9">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvk+TU+VhVo8TVn6/RBWefPcn8x2DLWd9M/OHp9yol9ulvKo9VEhv7vpacgotbCsCrE7btrcsO/M5OWuHUqp27qBe3oSyeNR6cFbE9gx7vZNDxvqYk5MqBlXw1U9rytBMHM=</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafVfUr29wdYs4ZnufjL6jy2xXZuWNKfw6apSOepCTfLKW5LZ6I0vbnO1lixVtipbrJb/WizBIyeEWOBBvEWQB4bFITILC60wrkb+zkCaleGB9QwvP9QqHV4gFNbUgt+g14w==</Encrypted>]]>
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
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4IJ+zPBW2k+1o75apxCZqtKhJmhWiYUXX+nzPiaqU7TjRffvqobsaZ7vWCU3/WHGCQc=</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWd6HaL1OGauusRtQb6bqs07xG6Qjwkz8N1z0TqPoMU5IOoFDY3nwNKOqVHA66gwNgja25/CKYoVnG6NbMSTqOa2j9xpyPdCxJmSfgctPtBa9NRlFbJPPp/ZMae+L5uV4MQDvP2sobWUwAEKKKRh6rj5KtKQsBazHEWShjw/3WIrnw==</Encrypted>]]>
        &CommandExternalFieldSet;
        &CommandExternalFieldQuery;&f;
      </text>
    </command>

    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckLockedDate;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxVMx1846CkzxbSU4gmbG9yqdRZoJBzemZMYFJrYwsjqlh2FrHVpf/K47CIBe+8i1ofwuBxdahPyijQvLVrOr+npJgbSKl+O7RJxFXnyjeZkXrQbCLvya40gRGYVBOwBECzUP6NuZSzyyK5DjDaZcnKkbDyJ+jOCuRg5RtEIfNBAdQfHMTy+R8ZadSgnvMJTNg0YKnP6NZQXUkBd4CHdQz/ZT0mTjIR5THSlD0z3Z8lgg=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN0oE3eDMuFz62R3YqV2ETFkMjLf/NQBMJdtf8PAeBx7UQ0CsLaFJPAhocUNcZypjFYKxTdmU8zunlDI5lm2MJAorF8CTTbxg+7oqhJPPaIJ</Encrypted>]]>
        &AfterUpdate;
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
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckLockedDate;
        &CommandCheckVoucherNumber;
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku6R/P5pTVqKXf8JdnPK/8VOCjwtMWhHAOsbH0P/dtuo04xt2pDKbD5S+CQfr9EjUnhYZNxBcPk8ktssZb/iGo43MRj7++B9pNE9aGJO6rvTvywmyFeg66doRZBzVXCpNFkhOMuKL+5o4rL/6inVbkbGEe+8Ugx4+i1LkCGGyFbEYLGGC29D2h6Aalx/KmON5l32JDYEtRRx/mIhYqsHpR0rY2u0ThLmfuODuoDFPE+7dg9eDnVODN+K3CMSSrCFsYfGBTS0XSUZhq8VLuUGMX+78m0fBjKPLkJc1FoIL5F6dHhZbu7VbihIA/QvOk7YHsVUB5QMKJSOOV+YXrODgMaGBiQWFTwdQviDvIVxxPBhc6t8fy5oAWJasdecy0y8z9w==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QjdpGw0atzNraXGRZYEbiRGEc/LAMIlVlmPfo6zh80ZLrIHlxibgz5JAPLh0NtQeG7Du9pfF63ZRrVuUUVDXrgkM1rMKtx4O68Bu5Sx8ujFo/3NZDJ1MStYvfW/HTuGGDSIchnuzUp7HoWqn4ZpXCIb8HlhVUiIgA95ulPBBEv5iG9yghcVU7zkiMB2TAlCYzk6+iS5PgwBvxZ/iX11MQagCLTs8+EvaYtqa0vyTv18ElQcXdNHbQQW/Sy4HjRUDg==</Encrypted>]]>
        &AfterUpdate;
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6nskpyE/YdJfyt6cV5aexPnb3Zorbs8CELktoYvKAwy28VMq0FU7Em9bvkzMuY41bT9X94LTrltj4mVU4aAtLQ=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9kW0rBX1uly7HS4wPccah1VTHpNqWPQKzokx5/IwtDnMq0qKBAuuchcrDXSiE7a0T3HV1IVDOFt9m3VIrwPlQ0=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &VoucherLogUpdateStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22X9euTvmH3eAzer2+ZvDJbE=</Encrypted>]]>&UsedVoucherLog;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHvFSNzMHd24rwNP4C3O42rP/1Zl5VVNVXYb3sKgxuQLgCYe1cB13s/NekUmDaM1XLHKoT1pAdeTgsyGVgUaJFyo4lAmJvz4/ppaDtlgg/ZZBmK5/Cde5JkzIEowunCygzoI2FQh62OB/Ck8xw8ieFA8ad19zM+nVIaoSmBdfFWyY</Encrypted>]]>
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
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzg1CnqAqiGaVcLrReGHQaYEbiW3fTHgqx9ncYtNzbDQvmxdMd4+P68/NVSfGiWxtoNy2PSQQHNV6/1vWcaPgGG6klzul4gTvoeAl0Ft1q/98KjynL098UOPTdJE1B7/mUKDOqI+SRFprdnZge+GoeEbRkX1QHAZidHuwvybHSLgxAWxnjc5E7ne6f3fvdG0vNLevUBhiJr8vgLgK4dxvwuacBLVmYcRRihhdnk3P0OodbCWnaKZebIa3FpZD4M9EGbJaEmCCKJRgJtsJKyACcA4C/RAkPtUH3m5lvSgkwES2ryTT+n91ehKDpYriBmW/csIf9ZK+v5QFDe5lX1uj7VhyFMVclkbUHWUpgFTpBhFmakcnyr7cvuJyuUNaIVJMTVGjKhFNoD8Fq0ueP1wDG31pYK8e0f5rxCCSjf1hbdwG/eIkQEMgfq/eKkhn4FfyNIV+I4Z2Dh1wBErGpXwGTVkDbA/PY+befX/ztvA8dE/WpYFGjXY7xwfH5Esc2qpP/x53nX0u7DuZpjk3BXIAlQLhfEdRtKqDRxW7G1u1QU0ngejK+VPJeqsr9wuRNnGUN0A5cKPMNs65JzV51vu0MmMK6K0efTU5R7wECpXhQq6U+5CKfqof0FU2WXWg05uk21eaOHQuVUk9WuWy3RkIq3nx1qUXNJQV0S63ak+D56EhoRv6LgQHko6EqhJimDofU2OJUwyDGLfjxKPBT4RoJhlZt1akNi/KOCovCkF79iTMUA4JE1UrWaDfJbmlnueGEPlOjsRB3m2gjdFTcNCRCWOl0+xJayyatBDTfBszTiazAbkYpfxJ/vCnHm67EgPZZNuz/OKR+vt3pY0/oC5oCl5XblG0XH9FKv0llgVSx7HFLmti1hu1iKZUdeHRzBDr3+bhJYtlLK9KW8B6xG95XNkH2g5vliK0ulAfKwZ+gk3Q==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>


  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5Lpya5pYlEWWAacedGhSUOcnBzhfm6nzKORfUzKv201cW6jl/FmlybIcfGvAuN3l0IR3RWRzC1/mf3443p57/LAljrLg4nytmJB+8HUug5wJkVA==</Encrypted>]]>&ScriptActiveVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxctQS/MirkT20l+zU+pUTsbWD0ysIHj4+xWpno1PvEYHVlKk0PKbJe6WUi+7K2GULtPALzyJkIbEgMlfWHkLBS2lDmYhTlea+TljI9qKbXxXA==</Encrypted>]]>
      &ListCreate;
      &PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&kgSH0HK8qzKbg/rQtWUzkSmdcdio3ohxiLtPrZSHcuqymkFXZ9FfvUXuC8CmGv+f5kWzapYWf7l4bnDU0j0S02nAPkI+czczMkeyQFlWbDg=</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezwbxEw8y4GehoTAPEIJb4aPRlhh06+QBm4N4jpIBER2Rz9ZO8lDNuN/bPaj5rWVgQPf/PU5GRF9z0FzEjEOe/bbDVIWQFVyw4/pS29OjVXCs=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UkyML8OU9Vm+C05wYc54p6z6L6KitpBA61nxTxkORMtF3hTD7th5MHrh8wMLdOt69FWkIo9K63pJNMNrabLaHGfD7XYHEq2DHqfv7Xxr1ul2iF62/tvylFUNYv0dJTLF2ragY716WzeiLEeLpB2rNI=</Encrypted>]]>
      &VoucherLogHandleStatusExplore;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7AwHTQFqeMYoxYjllYAJQtbhRs8XsqkthzOmt/FgBekZYV6vh30yFYMMsQiDxJgHyMWjI3DZBALOkWgCoFz6vSNZ9OcgEkQHa0fBjVpb80r6eETb9643JfZhUgEmeqDyzig9XWG17hKabflCMiM0e7cb/6psdDdxhXBvxzZvCPQyXki7CfTahLlObDaD/8G6lJ9tX+/sQ/ZAfPt9V87oidIroYQCFFShKKbQ+oynzHUgFtLjsjiIr77tG3JcBr3aZL2Vj5odOeL6Cz4qpSARk/4xrBwmndqU0wxGeRxEYbMDfjGxvuTkv6jvRhoa/GnzmBQoEt3BGMwiC2dh+NvAJlGOhS/86I33RI1GtlbXDX4KnGZ2AR3zKFHhDEor0sq2FkMjNyPJuO5oXy/iMus5fHddmTUbmLwIGHdu7Ig+/w98f+NKqS2G3rNVT0r1rNRYWMPffruGEGfO+MWna7DZAxl1qrJYUFKZujRAF9n0q8Ilv1EeBEQq2rL8LCKGhJyzlpOAsn06EgnwtN7tBNYgCiSEnP0UQFZBjaLTMoOkkqA4+kLd7+uXRsIpX9U3pgZaGoS6WjOqIk1n9Y6+BxdAc52gC9cMYsvFShbg7aMaslQ7m1Zkr3ltPQw4CJg1TRTwEPEBiStQtoFxcxf/1GjXb3C+Gik1pZ1H+oYb6WKmKlB6A==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOqrj2mNavAf9/4ESLwuki8rNCpT5ADX8tlu1K8odc9nSmtDwlXs+z5JBBfjswQMPVzzEUKZ5FKG5kOzOrEYYF0g</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxlZv2wrz+HFskereNNxiFu04UDW7wpQF683gMZOEipKHFBBeJhRpOJrdNhTb0FtDay1Bd/MZCYcJ8kIpjFCnimQ==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6zFhxqBxzr4vqs9YjDF3rXrsvKp+HNHE5pIa1AeKbOhSfg6FVHxBgT6IjMheK9eQcVDa1RUXSwBHoFHiB6GFZm+e22mEDUV+WluUjsWEu+z0so/+vOMzCfY7LmrqcUlPAEXPsUMc2HeOrUJh2Z/Xwlu9tBvqWlW+IJV5ebdl0E4ISuKD4BwpJQCudWrX+53S+leRJIKCcL+G27OUPPGhB+CHsFCbZwyYXwTrSJdDaWLRgr8AthLlO/ncY8mmpNmmd</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VGALXfw3Kc8Kk3w3FYNtHC0mvevEviHCNElxwFxOJA8</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dJgeUcGBXK6zcr2MH4Yp6dQE5CUfWxJ1aqyjnDiCVZy</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V7/6ON5VphdCn3Ayzt7hizMCpHbQ1ULoOfCxG/ePOB0fJy1bFpSIvmY0dCDZ4vE9k6WzLUxQtnkGknZ1GQ/NwsO7XOzeSexYMnjh/YRslGnByjciYMcmv1Z3Q0e7w4cGX2y7qZYhcvRYqxN8IQ3HPSM1UjK2BUGdf9oAlfqeh8yzkxnEoQ1QyRcKyassa7sFQ==</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSm4fXJKbr0Ilo0bHhx2IddWXFVvasPKE9uY1R82hbFnDEgKl3ngfK15uJeIwvaz1l5slJDtejCPjgPujZJxlbRZ51LPa+kGAxedE4vkRK9q+YcHCvzy50afZE/r3uuNalewmgpBNPHyK3PmqvepdFDGoT82pHolbhbEJ0+7KeE79788P8+a8OCB3kkZ8dCzNDl</Encrypted>]]>
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
    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLoOpiCbdYv/LJHRk0UatSDVEBwhcTw44AVXXdh82eyGRhbWnLg3ggs32eWH+kJGqR9CiRmf03/WEIm6quUTKXRm7r1jldLeTxZCfsCpoaQo</Encrypted>]]>
      </text>
    </action>
    <action id="Customer">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0Eqaxtk81KWB7g2dSY6ulSogGkq4W7OP571jRmvm0/OLjKgqbssKw5OsRyiF4R941MElhnVZDOPZGcUPrINBsd3tkCTIvgC+gTPRW7P/fVnebLw68pxIuQ+3ksdkV01ywjD8n4Xq8NPm28OP9g0/01DhQaBUHPsTQEh+eEvoJCbJDLqw+kJ0vswyrUOiGbUj79IP</Encrypted>]]>
      </text>
    </action>
    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&GpJqMZPqq5Hgc8e6bnuAr+cLr8CvCSXV5rYectoWj+DMR0gUf5DkFviRWEg8AiCkMU90AQSyRiwSV05HpJxKuw==</Encrypted>]]>
    </text>
  </css>
</dir>