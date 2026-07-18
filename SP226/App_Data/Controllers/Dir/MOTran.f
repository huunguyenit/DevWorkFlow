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

  
  <!ENTITY CommandWhenVoucherBeforeEdit "FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22bq+hxNcwgXmW40/pPFy59r6MfTaj1yng5xZN7EbZFaSd+BFWsPobg4wUun5HZBjBkBGveNsyCFhJiUyovqdvfo=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$uCDryPvbCnCtqln9sYa42PrYsA6oojT7yqtij1LoqYUgV8eph8XCDkwLcg+O63fwZzBdIk2lbmVQGfHfVOvHxT306jO5MVoZxLnWAIahPGQQcXgzCFCiFy14JxhzJUTe4KtO1b+bUD3CguKJMQ+N0C1+vlwjENg3JECpdBXJ4UIWWXPIXuhwH6lfxRcRCBVagPSM3uly5xhge+a3Fzjxonjd7CS2n6SVGJDG2YeDOmdL997i6eCtTzuN08azLsrD0R5tDPOsADT1Dzz+tXNRd9nLklN6Nox2bYc5B6KbjXEXmhTa8iwEHLExCFmo+dm7z/+XPiSaPxluLf0ORcms9TR4E4IJ3mQ2Se7SzVaoIQ5h5qFJAjQCgvqL2c6pL79XFastBusiness.Encryption.End">
  <!ENTITY CommandWhenVoucherBeforeDelete "FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22YvueKwjPTaqp5izU2+eKkzLiBgBIcgxRPVFIg+0n3TGFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$uCDryPvbCnCtqln9sYa42PrYsA6oojT7yqtij1LoqYUgV8eph8XCDkwLcg+O63fwZzBdIk2lbmVQGfHfVOvHxT306jO5MVoZxLnWAIahPGQQcXgzCFCiFy14JxhzJUTe4KtO1b+bUD3CguKJMQ+N0C1+vlwjENg3JECpdBXJ4UIWWXPIXuhwH6lfxRcRCBVagPSM3uly5xhge+a3Fzjxonjd7CS2n6SVGJDG2YeDOmdL997i6eCtTzuN08azLsrD0R5tDPOsADT1Dzz+tXNRd5/ZZlSIjNpEtr/ACY1y8juygIhXw1wO6fkKKYkV4dwrQU58h4X3Bhx5Lnitvrp4SFgaFNhf+iifKB86My9z4n0=FastBusiness.Encryption.End">
  


  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\ExtensionCheckVoucherNumber.txt">
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

  <!ENTITY % CRP SYSTEM "..\Include\CRP.ent">
  %CRP;

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCiI6xGRFLue5zEjyRZmENq3v70GuUfsH3p8AXYIKwu13jWszZo1Iv+J58nXBsrD5aIYewZkSfyF++RpP3RWd4mA==FastBusiness.Encryption.End">
  

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.MOTran;
  %Extender.Ignore;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="phsx" code="stt_rec" order="ngay_ct, so_ct" id="SX1" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="lệnh sản xuất" e="Manufacturing Order"></title>
  <partition table="isx" prime="phsx" inquiry="isx" field="ngay_ct" expression="''" increase="{0}" default=""/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="1">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4LXW3G/8fV8D5ZJNQD+j1vOMoNFneLFQkf/MC0Th2XjQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" width="0" clientDefault="Default" filterSource="Vacant">
      <header v="" e=""></header>
    </field>

    <field name="ma_md" allowNulls="false" clientDefault="Default" defaultValue="3">
      <header v="Mức độ" e="Priority"></header>
      <items style="AutoComplete" controller="Priority" reference="ten_md%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_md$dmmd.ten_md%l" row="1"/>
    </field>
    <field name="ten_md%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ngay_kh1" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Kế hoạch từ/đến" e="Plan from/to"></header>
    </field>
    <field name="ngay_kh2" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Kế hoạch đến" e="Plan to"></header>
    </field>
    <field name="ngay_th1" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Thực hiện từ/đến" e="Execution from/to"></header>
    </field>
    <field name="ngay_th2" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Thực hiện đến" e="Execution to"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số lsx" e="MO Number"></header>
      <items style="Mask"/>
    </field>

    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Kế hoạch" e="1. Plan"/>
        </item>
        <item value="2">
          <text v="2. Sản xuất" e="2. Open"/>
        </item>
        <item value="3">
          <text v="3. Hoàn thành" e="3. Completed"/>
        </item>
        <item value="4">
          <text v="4. Đóng" e="4. Closed"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="ctsx" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="194" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="MODetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="MO Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb568WENPdSisqRaQDoUqJSO2hkHW4E2dtclFcoV51th7w==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" readOnly="true" hidden="false" align="left" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="254" anchor="5" split="6">
      <item value="100, 100, 100, 37, 200, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="11100-100111: [ma_gd].Label, [ma_gd], [ten_gd%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="11100-10011: [ma_md].Label, [ma_md], [ten_md%l], [ngay_ct].Label, [ngay_ct], [ngay_lct]"/>
      <item value="11100-1100: [ma_kh].Label, [ma_kh], [ten_kh%l], [status].Label, [status]"/>
      <item value="111--------11: [ngay_kh1].Label, [ngay_kh1], [ngay_kh2], [ma_dvcs], [cookie]"/>
      <item value="111-: [ngay_th1].Label, [ngay_th1], [ngay_th2]"/>
      <item value="110000: [dien_giai].Label, [dien_giai]"/>

      <item value="1: [ctsx]"/>

      &ListView;
      &PostView;

      <item value="------10-1: [t_so_luong].Label, [t_so_luong]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="100, 100, 100, 37, 200, 8, 58, 42, 8, 100" anchor="5">
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

    &XMLWhenInitExternalVoucherNumber;

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd517LoeoJwnZ6nzQcvszpH7dRraVzMkwFJKu9GMq7dDtxw73UE8N3kCCv1C8FDuA/BJVi3CPBBnZFAH8f14vt1OrshTeDldtit737e/vfEvZAH/PgYD8t9DfPIhsxaGkoy6njKjzA++Wr1ONO6HoF+DliQw9gsplRvhsKsO2W9D4A/AfA0c4m/t5CP7n0AOVdMs=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcB0QPXKHAO++GS+2vHUebY2afDigYQqkKdAjnnyKYnuvhX96HvPUgm8aOYpnXhBgfA==</Encrypted>]]>&AfterUpdate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
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
        &CommandCheckVoucherNumber;
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a9acrrq3sgh4Zs1+IZxxiN/0ypBbrTxjp1G7AsjJ5LvWARKeNDvtxMTVhR+3tiqsG9LiHA7PsHpJ4Re2WhPClYrxPfjBw+mj/h2Pxvuo5nX7DwoOXYjoyB7hj7Qnam/p3xI2OK1+5VFQ5J4cG7TF1a9eionaVaJuFb4/ylbQIVM</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22a9acrrq3sgh4Zs1+IZxxiMblZBmNFyOX2gZnn/w+jewmjHwik2UWbYzrPOwN8YchXXstMp6TOE7tBhqNfzjk0+d/zsbkz5jut0TABRyKpDFbdgaNvgMCeZSCPO2RpxyP+HtnYH/JzBYysP+J8k/KWXo9lpxgzFxgxFfpQugt1OIUvoZLFufXK1Yu2FA/78dq4y5dzJVQgnULxsG7zQWf3AQRtA7U/w/HFzUYu8Ba+4XTJQrT9IcHguCa+cbZIa5UwGTaiNcqn0Rj65/t0eMTYY=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4W7+Lc585ygcKSWABV+z1diagbhbm327jG37VAlxQODQYHJXEiPyWbZ8pkwYtCEFA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4o4PxhsiLDwEtpgaa5Lyu6x8sCDta0c/Qq1/cRCgfAiWTincchU3i9M15s0TC8HeQ==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkAYjjbCQqmLFMh7B9JOyKX52rd0XL8/Mvypo+MHtZIzwBwF7QTIHTXOSwi171hDFrLhmMoxzHM3WjHEgk0il7pMEALTurj59pBXpVAL8C2DyOZE9YUqFL1TsZOKISm3kLEuIo8+gLJJISZfcLAlewvMp2kdChroSP36SnjwuSg/QJCp7Fp52kQ1QXzpWhO88bCgeusoVe4C6nCJLSpv0SmNtqvs1wnnylCfOcOq8T3lXsSQ0W0vMWP5bdizsR+1pGvu2eqZEFQKE/Ahex6heGjc+8e4yrelyyVw66/b3PMqRZoqYpob1PjqSrQkmoLhJtML1afhbzx2L/2bk7SpYiefLLsSQR1/2u85pJ1+pK5BxD5A0zM381H9SfsJI0n24Baci0E/EFTDYPWSUWahcDUlLSGO8beH8QPixqoADossuAKc51e/vsJi9zJ1O+A4v/6S+5vu4WawuaPWr+COppLiZ63AlSbTVvQ4Qj99SuIyaJGQ1Mx/XK6q0Vv0l8BK1A0KsSxTiO23HsyAyxCYd7FTTrDF3MDYtZfYfEO0a5gNxYlsNhnU4ycj6oyEO7jCZsNEBk/eq0WDnq5Z81POsZQneA/OMB7zAU2AORC/aFxEkhw1dfq3WkAYrg9amrkJD0zT/vFyVG9KG7JEvai04hE195BP5VIQUuF3eSi2kFju6CZETbf9aXK0mckYo1HiM+IfMyHRfV+xIIfG7ssT1eSz95AhiXN9gg8yO4Fagro5QziSuGP7cQRULGtloEIw3mTdJBoclU8kyn3EOO5t+254cGfvq+h2rUkAgXnFMWpLop4J3I57EWMzMnjjzJeBuyhjp+p2vgRZqz7/tS/Za56uyZixYAu7TXF8t7vw90476PuDgBn+a26ALQ3aR+YaUXkup5Rx1aB7XZEM1P/At8JLekawxSIwaxHAgKzlCrYzrf4qaHkF71PNPKfcgo8t2gJd5kBmyMhrJ4E5ueyRjnFuT9pmQtBrrlVqInPkypQaIe0hz6qqqaQtUOMVzNrSWEox6pJojeaPuN9ucZZ9oloNWQSnh0UeaNnph6VkGBBOpFeQiCCHzmu7JdTWMk//xN8=</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5Lpya5pYlEWWAacedGhSUOcnBzhfm6nzKORfUzKv201cW6jl/FmlybIcfGvAuN3l0IR29guICdjCYcbHxP0VblZOZSP2Y2SYqyACrwI+gohECwOtkDvLr3DWWNCTl21Ry3lBh6eaBshw/ouaNKOgks2xioh6niEKubQO6GFSL5aev9LHPQB5Ez/Sfz5Dx7RElG+V2AMR9mdrnERROr23YE8rT7LNKKPc9oPlLby3NHeDkoNHls88DnnIUctY+D9ZN/lHdaP5jlY5//sX51OJY+WCRlB8j2VltxaVJx9zJxrOnv1UKG9Q5nSD9Qs1OTZJODdO9FWWhTpI22Ws1TbjeR7mo</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+auOqx9SFGe27xHLcqSzeZvMhGPz9cZyKuSfeaFN8AiFRaEt5tt+3PstA/H0DEvGJIUM+bpiKkcZDKcflPthjIaIDfO/0txNF18Zsl6e7GxM=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVrKtUN2I68mS+YNu1kzGd1cOdkJIIx3pPw1L3r3RKmURR8m5+PU/iMzQkaFFOc8+6tVTWhKp1ISJtkuDdZb9ed9KB+n+d0HD1vy1Y5jdgYI9fNz2LNglS0iW5Xlq77UJ1R3g5TsPCvY+ptk1JCTMy7CNA/h34BzBrE6jAVoD1AXV5GS1/76qFGCChGxwxhFucVNQXNJibz+d3KP8C0BwCEISrOnVqt3MilSUYbmwglmnNJmOxz2tlQN65QuXEuRjlg=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezgECN/o/7pfPeuSUSqdfeFyl04xFhaASi2NDRNpM5w5me+ARDNcOXV7EUSdFne0JeTT4JkylRxGt79kV1LjQUKfzYvVfsB7/DF1xsVC/U6qvwzjPZHS9mlg+dSJEYOl8juG8A391yyE3hLudIBWvtmeC0En4Gv6Ywf8TeMwnYaeW5ZRMEyX2FMYpJICrCBJVWx2TZH4GD2VunTTIkyJ7M3A==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4faFOs+Xs65Ec+Ah6eR51ky57l+bjdCHquz/pty8nxIer/RslZHJHKguDfl3iy/3dA==</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KkyM+BtQQNcZk7mdKL5G+44iajdAGCT4kzBkmIe3euTEcdA7TQJrRE1py5y5jntkYEeLhvrxZwgh28lUGwRBKB/F+sgGtyjLCHLBMD67GRXSQv7eU35Drk+S8FnNqggLB7GrRrl1AnTUwLL9gl1LvQvOeRNpcqO7+ARttoob8Lb20BT70tx6sc+xsq8BImzzcU20nRkBXH8pLGajZylHyiY/HaGwCWn91yy15pgdVvz4=</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UHorC1CVYZBcXGRPMcMzaeJO3vnhb3QqwkEVVZebKc712im7cbLnyqIXG9+qJYWuKQuJOIQhJE8YOJesouYoL4d/b49d1SOdAK2HysI0Ustwv5s487merGPAG+iua0XpIEE7q1/H9GEfR1aL8+GHkzcZh23+4EExICcK8z5LDW7XXdukq2TdHXMUgECAmspYPuwiv0tzuDfhomVsoqkqMms1qBH3qogksT/hfc28Ont</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22f+qeju1WMpdHTyKloCcPObgLzHOCWHZN2tfoMPvbhXO/m6Hcs2oa6szZoFvEE2ASC6k593WTIfMG3tGNhyPSqeVg8/T7VxJsm55xI09lee2GaDkvo+OLUkHV4Ald3aJ/mFiFeF4FOxYxEJMtbupkGRiuHdGsSsQfr6bske5wrvtbeeX5ma8Jl6VAOKHje4d44Oy4qalrLMz1Ru9ww26Sb5tBvG8rAKARbWrtXGS5+aoYJS7em5ed5nEqR5ObAUL6jYWgtYMFdydODFMaCTWSvo=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgppEBnDfAgq6Z+raVSepfIDDOmQpNfep2LVLAJloKH9hW1fa2gRcgArA9HOhSMt2dvDA4dRIzazs0NYe0gQLqvA==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &ListTicket;
  </response>

</dir>