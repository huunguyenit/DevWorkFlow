<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">
  <!ENTITY XMLWhenInitExternalVoucherNumber SYSTEM "..\Include\XML\WhenInitExternalVoucherNumber.xml">
  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">

  
  <!ENTITY CommandWhenVoucherBeforeEdit "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcElKdc9MOlsVc7o1GXVwCYcQJmeJZ4/Lo4DuGHTDvB87AEsepYJWpXUXQ/hMuDo2EA==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w2240SVk5oeF2Gu/3JwGbGn0iM6oEGHBnNN987FclyzpsemY+8HD5eGzaA7CAWbUldu+UwEzl48erv7qm1l8UjetOY6zg9KWsOHsOsR6W+/RpvQt9trqvVwSBUF6fAHnr+JiUWMHqAFnsaOFcF7ulM0IW1DPOOw79mt+k+FLOT1JrIfI9rFuUdAGoYirQMe0QIjxRkcHcgzyy5LGfrIES010vr209mgoB3H1DZZ1HuXWO9OWhd6USK6WsdfSLsjbRjdXdta4/IFZ+UOEoph2nOmy3+tRirxlRVE0ScQO1CkLDoyH68PGpoTZsyTNeJAUeGWLn2gGUMEy0EB7LocDKfAlIoLAW/fhnm3yEFn1CkQ=FastBusiness.Encryption.End">
  <!ENTITY CommandWhenVoucherBeforeDelete "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcHdP5jtWOd7tTrCcbYoUUgHlc3zmjN7Tlx3h1/8XHPSIFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w2240SVk5oeF2Gu/3JwGbGn0iM6oEGHBnNN987FclyzpsemY+8HD5eGzaA7CAWbUldu+UwEzl48erv7qm1l8UjetOY6zg9KWsOHsOsR6W+/RpvQt9trqvVwSBUF6fAHnr+JiUWMHqAFnsaOFcF7ulM0IW1DPOOw79mt+k+FLOT1JrIfI9rFuUdAGoYirQMe0QIjxRkcHcgzyy5LGfrIES010vr209mgoB3H1DZZ1HuXWO9OWhd6USK6WsdfSLsjbRjdXdta4/IFZ+UOEoph2nOuSjUs67M0RWXNBRiCvX44M7SieCc8RPJ0pXCv4xgp9Mre6Q7HEjOjXdXt66xxHYMt1Zj8no1esT1coxMeG4Ik=FastBusiness.Encryption.End">
  

  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\InternalCheckVoucherNumber.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCeFZ5kpvzPVDP3jfrw2tdTAd9RUkiD9yQ6UQTuJIGQNE5lopJgmJ2Jkj0GTZjWjpUHIjYq8EuaiYhdfn6lXwpWL8wjUr3WgW0E/BrMaR+V7Y=FastBusiness.Encryption.End">
  <!ENTITY Post "FastBusiness.Encryption.Begin$ETLr4b7Rzr4OjFrpPLLTZxj1rMAZc1C23YCbzABR4tIfr+ckOr+nfHbfdf0+9PXeFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiQ7dtM60LhQYHks0QrnaUPBviFU3bndmAJG32DlnPeqxdxfuvsM5gso+j0pH5z56+zFbMq9syFEzNCo9zuS/3SkOB2V2TrVbIcbP9XY/tLqmFastBusiness.Encryption.End">
  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu9JeQ6BpL+iOW0yvEmllXuMH9rO/xswycpQnJTjUfT0MjHOZpZxXNg/u5Saot+YUC948uip1RvclAN6v5INW6bfZsnRDTTEk/A5Aq2IWjq2hqv6fJfrFmRewzo5ghuJG/bFHy5fIvQSmAFS6ZISgq1w=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQNcQVivmzez5l3VM7Qj9AYkcM9UCYx92dNw5GfQb8ZT16fuWYtBqwYmpzBQ/dFBaudmDgvqXNpKyfz1IfE0tvaSiTo8clqfaEegvbjKoEczdlONzTGbGPNlviU2jpBSbnpggkVecqOcz9j9+8xP5hzcWt0nA+PUW6ktJ3AbraFZY=FastBusiness.Encryption.End">
  


  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.S7Tran;
  %Extender.Ignore;
]>

<dir table="ms7$000000" code="stt_rec" order="ngay_ct, so_ct" id="SF7" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="nhập xuất phân xưởng" e="Floor Stock Moving"></title>
  <partition table="cs7$000000" prime="ms7$" inquiry="is7$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_gd" allowNulls="false" clientDefault="Default">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4LXW3G/8fV8D5ZJNQD+j1vOMoNFneLFQkf/MC0Th2XjQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>

    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Điều chuyển" e="1. Transfer"/>
        </item>
        <item value="2">
          <text v="2. Nhập xưởng" e="1. Receipt"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="ds7" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="264" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="S7Detail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &ListField;
    &PostField;

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb568WENPdSisqRaQDoUqJSO2hkHW4E2dtclFcoV51th7w==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" readOnly="true" hidden="false" align="left" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" width="0" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="324" anchor="5" split="6">
      <item value="100, 100, 100, 37, 200, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="11100-100111: [ma_gd].Label, [ma_gd], [ten_gd%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="11000-100111: [dien_giai].Label, [dien_giai], [ngay_ct].Label, [ngay_ct], [ngay_lct], [loai_ct]"/>
      <item value="------110011: [status].Label, [status], [ma_dvcs], [cookie]"/>

      <item value="1: [ds7]"/>

      &ListView;
      &PostView;

      <item value="------10-1: [t_so_luong].Label, [t_so_luong]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="-1" columns="100, 100, 100, 37, 200, 8, 58, 42, 8, 100" anchor="5">
          <header v="" e=""/>
        </category>

        &ListCategory;
        &PostCategory;

      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenVoucherInit;
    &ListShowing;

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbZaAEVT0QhLeDz6F4WpGYKmrPKoJ9B/rHQ84ejexCmVWFQ9H/4TZB9T/SkgvfpVBpLo7Gzjpf6nfJclnbqJ6BUOzmuaBoVFVINp4X5RwbjxjUylNErGqPgxFCYJlsYST0W08PpDsspF6X2+OWgUGdlzGq75wS5hFMlVqWNJ+muE8Mrf9qonyeE3lsk48QvxUMqDYFSR/UALeSOXB1R/q9Pqflb/vYU0tnwvUlT6jCLcuJiZ34n+SlvV+NleiJbvmhhsQb+yj78IGNw5wCZSkMdUFvh7MwlG+FtQt9Kd4atHs=</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGaffhFCfMp2dfQyZq1/JNRw65RxA9ev+mwX0aXj0wMvNGZlLIMqI11X15ZSHr+QUW2JusTlGyoRsNw6YkbfFVA5vU=</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcF/b3IyC6ggX2v6O+lsuFHn1j6FO0HoCgJ6lTN7+gA8SY8vPShiw0ppEm3PpUkcfY13yKiIb5GCu65/4oXUD9Onwy2HZ5mRi0Nf2WlAAfnDvHxMIbmQpI/7pX6UobESJuk6LqTqBEf1YxPYKTjp35/j38WW7xjkGFu9EUAf3if3+hu43v05/Yl8BaQcNTOUFZoIfTPCOogsbnfhiC9cJvWhlvZakmex/XyPCXJrjGCAx+ozd8D+tGhnzTMnFXM9VxA==</Encrypted>]]>&CommandWhenVoucherBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcF/b3IyC6ggX2v6O+lsuFHn1j6FO0HoCgJ6lTN7+gA8SY8vPShiw0ppEm3PpUkcfY13yKiIb5GCu65/4oXUD9Onwy2HZ5mRi0Nf2WlAAfnDvHxMIbmQpI/7pX6UobESJuk6LqTqBEf1YxPYKTjp35/j38WW7xjkGFu9EUAf3if3+hu43v05/Yl8BaQcNTOUFZoIfTPCOogsbnfhiC9cJvWhlvZakmex/XyPCXJrjGCAx+ozd8D+tGhnzTMnFXM9VxA==</Encrypted>]]>&CommandWhenVoucherBeforeEdit;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;
    &XMLWhenInitExternalVoucherNumber;
    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24Ask7xAa0wcBBjRxcEVm01q3py32ixcXLY77AibP21h5kvGZ4D2NljcLjpyTv5KHjYSyOM2mSOyxczvf3KzfHAHh/</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNL40tMrrnTwv+L6n9hD2+jPht1+mCEy7jiF9xCo/OQA3RLN5z+SUJIFF4AsmMSNvO3Ro4txY85XOOTn0NY8Wlk=</Encrypted>]]>
        &AfterUpdate;
        &Post;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUujmOPgLEKMMl51XBI/7r35FT0Y/NL2EJgx5a/PW1Vc3F6tqkiQpgIaU2TzovpFAwR</Encrypted>]]>
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
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku4tUVzySist2R/R7nrQFMYIz3Xf7BI4RuvFrmzi5zAoBRjnFQX3y1kxpODXtqev1p5FgdauGAtVwlEReyXjMRyLf9JjgNZtupr5YkIOdkeeDMR5DVrdczRptsLuHtlUYwunjepcqWgfNVe9NCIjLn1oxdMTows7lU5k6SeZtqJj+UxYW8iSwntxciBM0qBYfpT9CHYqOYkiwWeagvZWXg8o=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TTVD52gV+KLwd7pHR9Yi/xPhiPJrHw38V44p+5zj72Tl7f3OuDnA8An2ghKofAFH3+vpgYQecnf42I/Mj1zXLPXBEbYyhox1nIGuHoI/d+6pzLltL+q5+JUsUq166q8nVsJDDEOzWk4OfiskRolGk3bIRXl/4lIp4phlFM0ek9+HQufWvZmrgc10gEQ7uMmSj6VLY+1ie5GsNI1x3d+UZObhOIj0ZMCkBT/Jpb3GLP8</Encrypted>]]>
        &AfterUpdate;
        &Delete;
        &Post;
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5B6Ub/XSObpytW3wPZIxiW2Ao9aAMI3Bkmri0Qvsv05pZnDbaVdZRWf1arCK7TJHDbxzZvz1esutXOE68SrCTyT9GRMUoFfpKA99ScOPxr91W6ExQyDqEOoTfEzntfpchfm2cg2nSHIL+iKL4Sdm9+I6YcFiYisqERb7IbmX2VPDfh1RovBP0URlRE/Ao1r0o=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7U9nGq3/wGezF1dqbG5/BjLI8DSz2oobDHk/YRiUXp2iStUKGDKGapkBfbPP9YA7nH5jRzgng5HlKzEhv/ovFo=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &Delete;
        &VoucherLogUpdateStatus;
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
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkCWC1lbyXQU/cRhvaeUBzByNR37fnVvCaALkoPJGRNPepIctSxsyqk5SpIcqZ4eqpM48nblPt3rbeZlLiI/jRQgCfASqNdepdP6TIBrWpRAtRUUnzdc1QqVmdVp4YWuV3NtRr6uEtF0aTvHyVrNg1dGZqANHICg9GuPv9GYcSbh6ZMJFXkVwkImZNg8KOluIj7XFM9wtgShA6/R9frVf35sFlo0byKxe7mPEDuop8q5U9PhJrrIrhs0g/6WqBGQ4Ez0IPnNtUq0aoroUOVH9V0w+06ZtyhjiQAZZhR647aOXCsvyAVlMugZRCtiDpHO/QNHuMZPUsS9cfAk2JRhyGsXUrFRKDq3lzLispR62oa8XOizYqZRYe/vWFsa/uYnrTg=</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqkyoFtuFJNk/YQjbULwpJb97V3wErUdUSCGbNKHfHOkMl1waQa0AZsUVEhTlbtZcQ8eS+nDXCKrqdVEYwCIxTzZWIhPsyanFr3YCk3PCWWU0pMmKw8DpSuNzDOzWftSLAw3pNQlSibt5oNtD/6lpDan7JO8bEkLjugVvqLDHIBdfPPf/qFU/XwBpCWdwKdDTsES8PEKgSJUae5/fhjzAksqRrFivulfFIDAuOHtG6sSjPuu9FiLnJIYp9INr0oSKdssrvE219MVzLDIYfa4gFbnM6/GTu0+9lGLmt//5PRO7qin3AiwGRiQYo7K0QHthGGIStzqZL8iII23j3XJFcw18+M4u0rbK1/9hEroQhfLBY9LxIZMQd/ZvdzNA+T91VP6xgOrSm9DJ8BGLiX8WnrFMT9MtNVGBWfes1fn00rFt652t5WN8dXMNium42C1yHfMCtsB1CjyHV4Qe8hMmOiP</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+auOqx9SFGe27xHLcqSzeZvMhGPz9cZyKuSfeaFN8AiFRaEt5tt+3PstA/H0DEvGJIUM+bpiKkcZDKcflPthjIaIDfO/0txNF18Zsl6e7GxM=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVrKtUN2I68mS+YNu1kzGd1cJBEXG7+jAvci1Jt354JH328nsiAkCDvew5GL57DsilgQdnwR0A3vVad4q6bqAUrFDEo0XcyyPG8K3HvySRv9mTn7G6VOZJay24IXWVGoPoPcvFy5sFfgY2OOQSJB3EmaiPwkzqeUKtB5ndmbp+IpSiZ5BQg3USez1Qu0FbAfjh/QZb5uX5M9CGRwNFYgRHain90NOL92DMY1VH9ISc/eBgt0T4OJ9QCNT1lLJd5jcArY5H8zF8UtFTfAiP/T7yirm2VMOkGP6S+Snk8bqvesrg==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacez6dKJQ+nHJwN3ZdOH6CEvFulWuS/a3plf4jGu75MhohVEDoDyf49L60bPlNnLn9uFyLi7W0LjmL7AuTr+QF9YJHk5ndVEII4SWN/XkGkgCevTTJ6VrQoKuCMQieGISEnTNv48ur2JrkoZa4aNY0yeDqc0H8+y0iq8POB+YRc+qn5xmiOJKHNm3mWvK4EE+X6r</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TyrXU6ni9czCO2rV5Gh3hZRdvGVabQh6vBCyood/FBagRM6yam2yiSaXJqaCPGRdw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KkyM+BtQQNcZk7mdKL5G+412oWvhH4jvXuUVFXIhMRVJcdO26SRO7VINAssS3FPQ3XBpZf8AAse56PJYdv/Aqzw==</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyrbHcGKgLQlHwzG9OeaJurRpUxtRpsiU/VasauyUSukxpCQIczZQQCxY95rZRYLk3mhy8QF+ly1b3mPPNmfOcryWYquuEvMloebQsYfcNaQ8</Encrypted>]]>&ListTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwsygCMj0NC+9aWOEuMAoGMuPGf1i2QgLtlqWPUDvUavLa7Z5ygTEU3d547EBnqT7DEKO2Sa8akHF5XWArGJ82bSfuDr+n+bS5JvdaqVAmcN8izsAls6z2js1L3REPU3x2LHhkTGhdbPTVbldXJN8s0C45tTfLXhKcZy8ucYJCoFopK4qoKj+YJj2FXki/nHaWdUal+W1mC/MljDvFX7OeBaz9zSrBSflDs9LT3V+cDKbgBQYAFuKADtDsxs+lmRDqjVpFi4yTZImbnnGtvahjGab0iM+OOK5sjxu45JCJ/H7eflPI2SReHjZHKzYKsgmp7v3kkfpVnP+qXEUuuuUsuZqC1y0VBgQkj53i7AKQB3Ee5aIlwgz+wSdZhjJrVSw3I74khWrFMjjQkSyuzzFIOoUqFsjHE8OyT2swp6xEJ5CS4hnKYt17rqh7rBPNJ6XW6ihI9TW5FWxMy9rIiw76Q5CuY9Lp7zUrEqJty/+SVctEDdLOxn6t26QMbR6Sg6nmRhjuerPp+MFtg8+r4UD6EZdU7b0J9EmRqK5exExPu1OzbuOgnoGGsk9AjlkUSv6d5mk/JBetXdGppgByhPAwGTRCsosBZ9uHYc8zmk/oqMpbqHA+xQcnxlKMuRPn8kD7JdAyzj8q8pxlrSjBJx739CwDe2zr7ou5U+hf+n21RS4eb7Pef8dQspyxOfMkW2BQgsOSga0aNUF9+uAFtWDtM9ScBBEBq9BJyYIn6NtgROrJTu0BSpH1fALoZccC6g7Nxqd5PFDWjGtouJg+OvKSZVbO2nNb2Wr64oTqGEyqCHck+/j/PLYFjAaQsff7QGQ==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WkO2Jyt5dCcfvzAylvsDZ42Wo4b+RaCbLHB3VKmyaPG</Encrypted>]]>
      &VoucherNumberReading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UHorC1CVYZBcXGRPMcMzaeuNqiSMvZ44o4LQsSjE7Zo3C6BdPiVWrd3XAOeD3o0ZMKxaELz1VTscFHWG/HmZABN1VEttpWX2/6Hkf10Sa1XEkue8xIcmmanJmeTi15Fycyj+AW5PXUxAZ7xP75XaniolupFNR25CEUJilh6DVaLTd4CBN/2BycWc3ictRJKtn98D8ssus8XgZ+3QO+Y38Y=</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZa8L384PUkg/4jpaczSTZ5aF4A/eQkAQqWsIx+wI7joA==</Encrypted>]]>
      &ListScript;
      &PostScript;
    </text>
  </script>

  <response>
    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHg24A0AiVo9a+v2IwzoXdousqO4Yf0cCBafNiF2dwJdB8sWYiiq4nuo4ACvztNMA+Y8+sIyc8MkOrQ5xQSeJkNpg==</Encrypted>]]>
      </text>
    </action>

    <action id="Reading">
      <text>
        &CommandSetVoucherNumber;
      </text>
    </action>

    &XMLGetVoucherNumber;

    &ListTicket;
  </response>

</dir>