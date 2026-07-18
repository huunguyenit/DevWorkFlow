<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
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
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">

  <!ENTITY ExternalInitVoucherNumber SYSTEM "..\Include\Command\ExternalInitVoucherNumber.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTNoeIsrZM6JPpQhWIA2MX6DsQnyKUyCOvDu/u/eRER43uk/bGifb5Dx87UodLuumkSFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTm5CM0qXjv/pzsnaw1v5On8HA6K3EA+PM4nmEBHHL/To9gTIjxCdUXBGfrfZojGBFyGcZmkGjt+AEFCnEdodMEUYXDNoboUipErZSrVMlNy67GT19wM06n6gJo22Xhv4ImpA2MItzdr3kiQAqwLrWc=FastBusiness.Encryption.End">
  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTN83FcPoMfPOnsSSvGu5HMa16EhX5Hs7dRwVCRZrjQj52QoToGfWDcrBsY2WDtP+f6FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbiTm5CM0qXjv/pzsnaw1v5OlHm/H8WdwPngw8+9BvmK5d5PZyc8qR/CAwVq+br7RtQeGXCxZfKOeXPVR0u+0uvZArz1LScTO5eMbUSDpnNkojYMs9rEzlB9N2zeCo4Jp1DECfiA4LVYFjpU7I0LubOog=FastBusiness.Encryption.End">

  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCzblfkWGJ/GBj5VVdBFONY4A7aKxy41a9P85VLDU8Mf4tkDfRJ+uSvVssXd4UG1kwptd8JLohtYGcnviB7X/ULw==FastBusiness.Encryption.End">
  

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.SATran;
  %Extender.Ignore;
]>

<dir table="m93$000000" code="stt_rec" order="ngay_ct, so_ct" id="PD5" type="Voucher" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="chọn nhà cung cấp" e="Supplier Allocation"></title>
  <partition table="c93$000000" prime="m93$" inquiry="i93$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_nc" dataFormatString="@upperCaseFormat" align="right" external="true" defaultValue="''" disabled="true">
      <header v="Số phiếu nhu cầu" e="PR Number"></header>
      <items style="Mask"/>
    </field>

    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb568WENPdSisqRaQDoUqJSO2hkHW4E2dtclFcoV51th7w==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_nc" type="DateTime" disabled="true" dataFormatString="@datetimeFormat" external="true" defaultValue="''" allowContain="true">
      <header v="Ngày phiếu nc" e="PR Date"></header>
    </field>

    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Duyệt" e="1. Approve"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d93" external="true" clientDefault="0" defaultValue="0" rows="264" allowNulls="false" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="SADetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_sl_dh" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_dvcs" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="324" anchor="7" split="7">
      <item value="100, 100, 36, 100, 100, 100, 1, 8, 58, 42, 8, 100, 0, 0, 0"/>
      <item value="11------101011-: [so_nc].Label, [so_nc], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="11------101010-: [ngay_nc].Label, [ngay_nc], [ngay_lct].Label, [ngay_lct], [ngay_ct]"/>
      <item value="1100000-110001-: [dien_giai].Label, [dien_giai], [status].Label, [status], [ong_ba]"/>

      <item value="1: [d93]"/>

      &ListView;
      &PostView;

      <item value="------10-111: [t_sl_dh].Label, [t_sl_dh], [ma_dvcs], [cookie]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="100, 100, 100, 37, 200, 8, 58, 42, 8, 100, 0, 0" anchor="5">
          <header v="" e=""/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    &XMLWhenVoucherInit;
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&ListShowingMessage;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOGvETgIpqELEtHeZitm0LSoARD4G2siZkC0ucskEKlQ36hqScg+DdHleNEkdSA3wej9Abz91eCHdaxHBEXfiLHLT1JN8NB4J+KsY+sp52ba</Encrypted>]]>
      </text>
    </command>

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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2D1ZHWgEXdruCz7j1OpgPTz+0SdA25jGlr4yzgsGVVi3LOn/lhl7ofswUQYnBR4nS7AJkMfw2M/+4K0jdmOcZB61mOeJ/+I787C82IxwNQYKeFQKCVrwnkS/zdYyxl9CSxbZIIY5P3oCAf/ST7B2iOyUBm1ogIbl/BJePFInbiHDXj35ZV5TgTUdmdoUqGskfrUvkNOvf4A0OVgWX7M2W7bSZ9Z5+3I9wv9lg/cPVlybh+iiVSsZRg6MPAQMfYNF0i5PvjXHcUFSFKzrD+eqFQ=</Encrypted>]]>
        &ExternalInitVoucherNumber;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ09+KuZRCsLMv6WpMUGbdxZvEhG7k5BUBxxLO3j9pLztmJ4XI2qm+zeegP0ZBPOLFPPOKQp4Q2U4tyAlxrdjWnuA=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxvv6gHAiVlPuEVt0VOpPlIRDfo6Cb39xPGBCT9QjldRZy4dSzZb9SlcRjxQ4x9114Hpsg9gqAryUSXfobS+qVHexg5WSs0Gbg9cVYtCfrX1HL1MDwygclX5ShvMiyLxTOTE367/z2NPVm/2U8rlh0Cw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH8Gt19dsrhVkmmp7/fTwWkttIqfVBVRl9lNcgJeesJWJ2IKGqMAVSpgqO2UjaE1zByezIRdrpWWysyywnhE3kM=</Encrypted>]]>
        &AfterUpdate;
        &AfterVoucherUpdate;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>&ListDeclare;
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
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku3S2DGkRrjchzMWX/QtkQEdi9mknmsLwFg1UK9FDh0/drVhIdqVn9pezU5a6N8MQpevae1Fo+EMewMNUrpbWpUuOf7EJw94rf8/eKdBQI6iyzaKCcAjf5DKHMLMzXBS/8q9Ra4s7b+CTN9PDcAR02b1QYQY2Gr2HPnywxGxf3UVXLvUAV5jR/nmu/KQCR8ygSMDaajOiOpJ8NTl+hxsUCiM=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bjV/Rq9sqKD6c7S5KkvSKUkYYps5TnUTbCJcOZXMH/ihV5LrHoAcC/WsdM/nf5U3gOfH76sR6mSezIB2vNC3robJ5HNxAIKr2vuA/N1hRPYA1V6DCt9VZYx6IKyXbo/w+LwaE/LEKk+xeN1f0vOLP9PFqITmjd13uo74DTuTy73idkZ2M8HGTpGU3+54URVE35Jqtz64wZZ9ZFQ1IEAqFJwejKLxDEpmBN0B+k6l4zYGAhHqwst5NYp/Z97xiBvxQ==</Encrypted>]]>
        &AfterUpdate;
        &AfterVoucherUpdate;
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
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6ffRDDj3P1b4xXfS4VkDs/WYbZY4tF7oxsOhyaWAJXBtVxN9ZCik0uSZND8Uynz0e7ve75Rdw5Nwfxn9k5BCSs=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
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
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqkyoFtuFJNk/YQjbULwpJb9e9T2yQuA71IsbQQzMkndC9mjaET/diC69YBQZO7G01cy033uMy3wlpC8xKzlxprbVIHA12MU67BUrpEHwS0bM8jDp8+AceOoXTUF2PDZVdp8Pu/Ab+AdyBsAnz8+HLeDiooHmFy1dOyQhgJdZ5TJDw7jhkEXqawn8MBurZ4pAoiAMnat88RyPVKPfjuxDWTgqXCl1U/4tFDyboG37cKBQrgyoCBnfdyXWlDqgx71DbuxUgoRPC1TWMtH3Efqh31UtpPkOzLxOZoPnH/wcmOOlJs/rJjG84DDYjpL+8S2sAZFCsszb+NtH98NYghxan75HLIFviujeUpix9CRVXjQXw==</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+auOqx9SFGe27xHLcqSzeZvMhGPz9cZyKuSfeaFN8AiFRaEt5tt+3PstA/H0DEvGJIUM+bpiKkcZDKcflPthjIaIDfO/0txNF18Zsl6e7GxM=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVrKtUN2I68mS+YNu1kzGd1cOdkJIIx3pPw1L3r3RKmURR8m5+PU/iMzQkaFFOc8+6tVTWhKp1ISJtkuDdZb9ed9KB+n+d0HD1vy1Y5jdgYI9fNz2LNglS0iW5Xlq77UJ1R3g5TsPCvY+ptk1JCTMy7CNA/h34BzBrE6jAVoD1AXV5GS1/76qFGCChGxwxhFucVNQXNJibz+d3KP8C0BwCEISrOnVqt3MilSUYbmwglmnNJmOxz2tlQN65QuXEuRjlg=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGNr30plX9FPZBHE9HSHSEedonK8jF5r2rjA50iJB36H4wHuycTl22J52CnJ8hWiBy9pLiO4awhg6dmwfWWz/1G9Vddnt21l1QfYd6m2r55J01K++jKtxrmCicHTJTYEodu2feMUnd42mOMjuq0sBDdpdP75RCv95JkOB+4jv8Zazp4VP+1Lkbe305nFfZS4HyZU+XToNNWFQV85Gpz5C1qhEwlqz0ouTvm6aJU6h9QxgucFamnFawWHMxxQbhzHA8nDO6t5cp0XF70JyphKilfq2a86yw8TvFclc3WxaUXS4Uy2pN9PHQE+f1jsO41BE2b0m2Sns5coYu2xiGmXvyXYFdl/D/DjEfWYn/UzGwVsXw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4faFOs+Xs65Ec+Ah6eR51ky57l+bjdCHquz/pty8nxIer/RslZHJHKguDfl3iy/3dA==</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KkyM+BtQQNcZk7mdKL5G+45d73hsHaY0UF8NnB2EOmYFExZTdR+X/cVMhU1MQNFSJoLt2pZUtkv+dIjxl8l1ldIJa+WcIIcQCKaWeurSpykM=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHL5y32aP3/++55DErbf4U3HrbA6JiUrLcdmnNEmJcWJ/5NsNFTGX86PDdqefgtib7L7DDIt/PLv3NfzAV2l+xvHoIXnXDKfpkhdlt09twAqzju7CSSMN9wanoYtVX1usPSDmnd3Hd073HgBhjKHkfVfHXf8/X6rQAMO91R+G9kdkA==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwXUnCUx92M6SraZTlzb/zxS2YYIX0wVoRprCceU/ifD9gy6Y50okOw4wSe4UzBKhBBdRfIDdhZmPZeoHU/zF7C0hFucDnD8uUlqcpeh0eyH16wpEdUVwORpBvFuUo8g9R6Na+v8SbpcijtiT5yUn/g</Encrypted>]]>
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