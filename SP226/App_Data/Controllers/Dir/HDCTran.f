<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLWhenInitExternalVoucherNumber SYSTEM "..\Include\XML\WhenInitExternalVoucherNumber.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">

  <!ENTITY CommandWhenVoucherLoading SYSTEM "..\Include\Command\WhenVoucherLoading.txt">
  <!ENTITY CommandWhenVoucherBeforeEdit SYSTEM "..\Include\Command\WhenVoucherBeforeEdit.txt">
  <!ENTITY CommandWhenVoucherBeforeDelete SYSTEM "..\Include\Command\WhenVoucherBeforeDelete.txt">
  <!ENTITY CommandRecordHasBeenChanged SYSTEM "..\Include\Command\RecordHasBeenChanged.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeSave SYSTEM "..\Include\Command\CheckVoucherHandleBeforeSave.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeEdit SYSTEM "..\Include\Command\CheckVoucherHandleBeforeEdit.txt">
  <!ENTITY CommandCheckVoucherHandleBeforeDelete SYSTEM "..\Include\Command\CheckVoucherHandleBeforeDelete.txt">
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\InternalCheckVoucherNumber.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">

  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">

  <!ENTITY CommandInitFieldDeclare SYSTEM "..\Include\Command\InitFieldDeclare.txt">
  <!ENTITY CommandInitFieldSelect SYSTEM "..\Include\Command\InitFieldSelect.txt">
  <!ENTITY CommandInitFieldSet SYSTEM "..\Include\Command\InitVoucherFieldAssign.txt">
  <!ENTITY CommandInitFieldQuery SYSTEM "..\Include\Command\InitVoucherFieldQuery.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu6vUCJATMpBJwQcmjkNVApbdOb9IG5MFx00VUBcq6R3ntKHxUiFpOlNALVRZBJr6PV/H6q3i5mT0nBkh04aZ1FQYcvCs+MiyqIfWi5EY4g/swPlniB/WeD9S1ocpRwVjdN7ithEt+tL5hUenJXgIVYmEjIcUxAlAnFII4Gr6ol6TqVhdLD5DDHtOwNJ30x/lCg==FastBusiness.Encryption.End">

  <!ENTITY Declare "FastBusiness.Encryption.Begin$I1OGFRTS88AUBz076Ap8WNmKaGjvXLhTyZju4LGcyB7f1PbT2DnvS5HhelFKlbWYxPAnMSaYvoxN1ofYqltYnM/Af3jKPZVHYcqDsoF4EF5Qr1yHgsakMidWD+CTI5IEFastBusiness.Encryption.End">
  <!ENTITY Set "FastBusiness.Encryption.Begin$GwGq4yEnTVuiQy5cJGOcG+2aA/DQGh21WV9VzjvLnmZO2rQ//MZncULecGy3b6KYZNx8x8k1iEi8QpMEXydNwQ==FastBusiness.Encryption.End">
  <!ENTITY Select "FastBusiness.Encryption.Begin$3H7kPWBUT0Qgbr/0jUL753GAeoMj3gIlG1PDC09oCybWje71ezl0pawaVYcu6qGHQi3js0OO7QGEEHscVAYxu9u+uW/53VzsnGm6UH2qutZXe067+Y05g8jiZkGVJPZmZTP5dprM6aZw7DD9TCKErczkgnku8yGTyvaFVfLPgW0ywdxZvscLLYf5Q0FceNwGgngat+CGfRTNpYk7GbUPew==FastBusiness.Encryption.End">
  <!ENTITY Message "FastBusiness.Encryption.Begin$DpaX+MaR03TgOdRFeOYaWY5YNDLr5MuxUY3Toac54v6wV3FHn/52i/TNae7L+VBypCgYJ6P/0bXBmFVfrHayP2V6a8jqnQ2CrwVa4bCNLf3mMxd0UV0lu7pqw8V/DbyVP0sXRihD4FNW4z8kYgSYMQXDl+YcsFbMokWtTjeARPg=FastBusiness.Encryption.End">
  

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.HDCTran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="phhd1" code="stt_rec" order="ngay_ct, so_ct" id="HDC" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="cập nhật kết quả hủy hóa đơn" e="Cancelled Invoice"></title>
  <partition table="phhd1" prime="phhd1" inquiry="ihd1" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" dataFormatString="@upperCaseFormat" inactivate="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="doi_tuong" allowNulls="false">
      <header v="Đối tượng nhận" e="Recipient"></header>
    </field>

    <field name="ten_tc%l" external="true" defaultValue="''" inactivate="true">
      <header v="Tổ chức, cá nhân" e="Organization"></header>
    </field>
    <field name="ma_so_thue" dataFormatString="@upperCaseFormat" external="true" defaultValue="''" inactivate="true">
      <header v="Mã số thuế" e="Tax Code"></header>
      <items style="Mask"></items>
    </field>
    <field name="dia_chi" external="true" defaultValue="''" inactivate="true">
      <header v="Địa chỉ" e="Address"></header>
    </field>

    <field name="pp_huy">
      <header v="Phương pháp hủy" e="Method"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
    </field>
    <field name="ngay_huy" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày hủy" e="Cancel Date"></header>
    </field>
    <field name="gio" dataFormatString="HH:ss" width="100" align="right" allowNulls="false">
      <header v="Giờ hủy" e="Cancel Time"></header>
    </field>

    <field name="cthd1" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="235" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="HDCDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="status" hidden="true" readOnly="true" clientDefault="1" defaultValue="1">
      <header v="" e=""></header>
    </field>
    &XMLVoucherBookAndNumberFields;

    &ListField;
    &PostField;

  </fields>

  <views>
    <view id="Dir" height="295" anchor="3" split="6">
      <item value="100, 100, 100, 137, 100, 8, 58, 42, 8, 100, 0"/>
      <item value="11100-10-11: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l], [so_ct].Label, [so_ct], [stt_rec]"/>
      <item value="11000-10-11: [doi_tuong].Label, [doi_tuong], [ngay_ct].Label, [ngay_ct], [ma_nk]"/>
      <item value="11000-10-1: [ten_tc%l].Label, [ten_tc%l], [gio].Label, [gio]"/>
      <item value="11----10-1: [ma_so_thue].Label, [ma_so_thue], [ngay_huy].Label, [ngay_huy]"/>
      <item value="11000: [dia_chi].Label, [dia_chi]"/>
      <item value="11000-----11: [pp_huy].Label, [pp_huy], [cookie], [status]"/>

      <item value="1: [cthd1]"/>

      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;

      </categories>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6iRmC3QV2UU6lJoAOBfaoMmC9DYeASwLrm0aYN8LfXTXbpl857cwtZg4R+16rSz9C3oVSbbeMQqzFsiHoMFdNuSA==</Encrypted>]]>&ListShowingMessage;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkW5VaPRT1bQo5kzjHaDwgy96RtLvKQKn8wJsrKK6s43J4MDp8m+wBHKsfykjbLEfI=</Encrypted>]]>&Declare;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJ1XZUR6wpHnRG8RVwRwigz9yIdd0g1725iEkThkckHjW95FfccKRcRq/GFQYXDM+g==</Encrypted>]]>&Set;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHGqWdZUfCBclkhalhu3uGxkbyCsYzYqXxlcxHS8uXB2lrBsU7F8r2flxdb8D6HyhHc67wRMZPKw1jzQNI7Rjsgr47mCVjRaSsphfFDII2rcwFdkiiPPemK7oJd5auPO7A==</Encrypted>]]>
        &Select;
        &CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGaffhFCfMp2dfQyZq1/JNRw654z7af8L3vW/zXCSbft1I6ZDTTKopxYCH8/H73+ZKm8eMo1aJntqqVkKI0DefG3cuVau0N2G1zDKD26MhJ8g1IXzc6C+LURLgSpMVnLMfBmw==</Encrypted>]]>&Message;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafYUXJAlGemm1gnrAgC64oMB2S2yqKTqDWy4RZXsvN52vLISR1gM/JIM2MQHgucKuxQ==</Encrypted>]]>
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
        &CommandInitFieldDeclare;<![CDATA[<Encrypted>&acAvyhSfBG0k0zms0j7pDA3A9+VKZnSFZ1X8IuHjtU0=</Encrypted>]]>&Declare;
        &CommandInitFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0/rVlMCAcN3xyduceVgc9V7ZNEvsUPEFtK6SA6FjMk7gq1Uh5y/Viv/fOUvV1I5r4v/0/5dGfR04AmkSOklqLV8Z78CYGLoYjTxIYICjsUDf</Encrypted>]]>
        &CommandInitFieldSet;
        &Select;
        &CommandInitFieldQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0+b9G3LO07XmNhmP7TybPSb3XkpjdrvZX9Cg97Mnd1cqy1O/HxvZe+N7IWBakT795zrShAac2gFrDN6aAU0VyFfjj7VAKUTbTiFmsv97YACR</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8mJm5Vb1x71eycXG/ZmH/gBbYPMx6ZFufEjwk54q98ftLWvd+6+Am+tot4JfvYCqvMK5hnJQgWRF88OnKQbDw4ZHDKin/ObMphyARCLxbLKP2QmqvMWQjccvPo/Gtvvt/G8rdApsThgeaHB1x7JeVpdcyeQoPN8FbRwgDKSsp235v9JU8PE4ebMM5I8wtuhmj+fPpNyM5bH87ViIuNbLJMZOQgLmgRzTpz2v3DERTyhhVnot3mGNKBYIuiXz/numrUsOOqlJN82PdRMgT3bi9vrFWEhkvIGDqhIk2EvkJf/</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0un305Y/LAluoWdIoq1JKB0vhqW1O36XtJNBKBSU9p98deudKXMsCieQQp258PopS3OT7L/ww/cxPzfY+felQc6VL0PHYSc/K85eEUjZbfUaoSPwqpYn5ZxthShWxq8KNXFOLuHIKFR2EPx7l34iQzm18xrylk48ULzP4ks4BFqgiqe8pIvgFaVyglh7Pf6XuWRhzF/cNxtGt4+GOk5ppZiCHB3syCDsH1qMMbl1uoaKIWzMSQuju2E67dGTNf238WbHbgx25ApA9D+n/iVe1FVP9QFF8PV+KBYixCzd6hiczQG+FAJNpHjH5e4dHYzCzAzLWgidtcWzWygHxrnKUg0EkoUQflUZoU9vnke3ai+J+m5fGpyaWbo0kl+JnZY+XDup036GRNWH+lU9bqi23usNrmbdupxa2vA7Wden6Vg90lpr5Q4vJXCVsKJlAb0F1KehbLN1G8bUuNS0V+2Fb0=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFXESYBQd8qnrHOHLThBNqacnzBGZ1DviiYV0lFZrnGsqtT+fYXLkhoKT36D/uF80Q==</Encrypted>]]>
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
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciLwMw/ImEB/IkaKEI/xZ3ZSGANTRvbTcSJPqJBAJOroiwT88IPkWWzc1HUqYGo1YhnrG0N9/vE2vuDxWAWXfXjCU1ai4iUa6jbLzfEw5faqKOGrgmAIPgO87mJWGhEp2OdVNky0dqITegfzJXdhfd4ma18aFzqrIqBsh+i/YDb2YjOG9b64hLgknpYjSTJYNYW1Dtqa7A3nn39Ut/tvWpRwaFKBPYCiP0OFoWozsZJ4Dd9PA5eaFS7C/1GMcpEgRsWIw+dGCubSc+NE4eu1e3JKR2CZl6yYsT01/gu/zxiKHcyz5QSxM2IHMAX6OaduGA3FeAE94rFH1C5kUGWD0FslEfQs3Q+tfhyw1jklw2XV5utuaGmV1uopwJZSj1BrtcOm2ATXneQ3Zilc7/q3osrh9sBDWC3Fcmr6zSVLvEyWWR6YI6HoF+IR8vALoJt6I2M0X4MXXdG/mqJZ8BwQQDmlpkH4UzVjRyD1w0wGyEp</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ciLwMw/ImEB/IkaKEI/xZ3ZSGANTRvbTcSJPqJBAJOre6pGN3uTItPb6IdUue5z6ZuSjENHinBQ/eqXyqi/1/We69rKuiFA7M9rDnJBhnrc9ixsQ65nvkvzE3ELUrVxsSZl8cfJ+1qoeNeHsCLYmWLmTuluPz0THkuQK2p4FtVF/3iCJDdBVylnldeSa2Ix2HQP2DlK+KcqulyKyDbZu7cY9FA5WylfKvIPShm0ud8P</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5XocILBnAvgK7lbk/iLqUKosH+alKmUqeF0ZAfGDFJv9M1E5yhCavzd/MJK6ToEaQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzUlEsA/IGtDzb1inqeoD2h0UfRPWrI20QPM93QbEBr4QLVm11R3O6D01a2Ht6iqdJ+uvvdFV/qyf7ganjN/o8ztTB/+Jq9GB5GR2YJbg0Kzj5eT7NYmIyIOsAGl6pp+eGZ7rYwjRrh4ZxXtmWrstLWNM02+L/GNQ0Dv+YBjRj7vsLZfOV+YZ/vmUWs119FaLlVkwoXWNu/Ea1XcQGefiT9kfrqutJ9MePFqCypjODpgz5IKzlcjH7UsiZYf+13y4D5ZsufxpXKFq7Ab9XXSJASmBH/U6DkQyON7/95Qwakuf/U777mBVIQnx9H1/JjODwvObcqsYrekNZ/oO+gVibPhkenVe4QeowrbSauA6Em0ZIcEfWICkpH61Ke+G7PBl0bUoIVLVkOKigBYYs+jLZZ1aI2rnHen7s+lAwfBNYktvuRuBvMUCzNWu9jnAlsqqPNxC8Fji3PJ8tXgJr3lzUW0vO7GactKF4JmZoI2yMD7VL94emLMUNCrMaZmHF8eTA6kIF34RtCIhoB/2sjkA19tnCBGfepopF/WztLlIs59z0d+kzY5alAC73iWwOJ57n75/lRMmfMGU6rayBjuNnfUZRlQQ1ILshKtjXvG74AuLTy7xW8NyOltDjJJKwvLgYacB1WaJ513iL8h+Pr+OlUjV1xngL7Iz0R1xQLCMxnNwpMcdCBCgPFGKSa2yyFX6O5wqy6JtYMAVu67eptJILBZVBVr/6VfEPVbhXoELc/NItKT+tquZph3GzdiY+yBtNDeFz+Q+xohfFzVPRqq56fKALfZjOZwyxd1zWnh16W89uO6X+N9+c9UetfkozQKDNpLe1jjAqoiXqRXMoL/po4jdlwovLvY1uqKUsNBhJMzm2i7RSKxmdCJEKMNhMfDfkuq7H+z9KkVWmt/UYGfQAesiqYYiqcjhCyosU2qRu5YmKub3R7SZy3sYGWZZ/sVlQHmyfW79pVmLhIfKJ5t9yIV4ru3uXHsX9xVLw1707PxYi04dZ97LaIyU066Bu09Z6vzkszPYDOLzHYmY00KasZjro5FzP6IbqXfleeZYI4lbRgMVigRdr8oNK1BVEXbDcQYvDhoHNdAKaaIGlyma6RfInAQ70pFgF+Cs23sXjBdg==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyctttQFkPUSHA8a4RLwhbf4C3dH95u1OGkvOt8Ks7Zl4bXZ98NYYd1FSnp/x69q1Fn5i5cgK+OoKsI1/e8LHLmkz0Dd1Nu5cIHCLQ87ah2DdROGgC8MIz6a4rU0RudXgEdFragvmjnGWghDVT9YTCp85L7OB9+pIgCLlnVylfYhxUn84+nykm1V1GJGll/lT5jMFI6aInv8wQ/tczYgLU2BcSt83i4AWhGyw6aFVb/N27Ei9Nm9mdwbQ3s9ERAvFx6srFmr6Qf/1wWIPPFIwvBK</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTdydH+C0mgpzSC578ny8CnfSa1IxpD6U1KaHDg5H0md/Fi3dDehPb2DB3jqtuiXCOm0ETcH+Rv2fDqY9yuf6kvigfzxIZShSvVQ3KGMG09wPefHBiVD6ivpHVJ9o43x2xYjC9pTAkrvprffxXQYX3lGL3ntAKvv+yJg4N/h9u2A3KIMHbcKvJZo1+FsQQZYt8kYhZdFpoVe6vdR2I0VytgFB2BUAIyZ9uo0vm3Hr1db4REiMmzZLRBuYM1se+Jq4qAio6AFeyuF6tyoEv7AuEALQSivxo7UZPpJuVstNXPxr8rBishvuGjkx8vMJCCOIBk=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezXdSuFOXru2SUum5B6uuhHlFEbECmx/X1sdDt9kKVbHbpWJCaBWnFv402GSGeJbMKsjO9ojMWAoKkEOFsOIMAgxJ3Q1xeWGBCTcwy/JhyvzUKoL7tTkb3WIvs/zhVV/rlzHMLG/eXUBhP5dP1lEsWJbl68dmQ90hKO4QsIrAP8VV1zXFkak0neH3OyLYS8H1k</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KkyM+BtQQNcZk7mdKL5G+45d73hsHaY0UF8NnB2EOmYFExZTdR+X/cVMhU1MQNFSJRtczLZB2mNUsTom2xr5BU/8wu24TRnIC9ZlLlvP+ZLE=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHL5y32aP3/++55DErbf4U3HrbA6JiUrLcdmnNEmJcWJ/5NsNFTGX86PDdqefgtib7L7DDIt/PLv3NfzAV2l+xvHoIXnXDKfpkhdlt09twAqzmvhZvKf27UrHQui9+jDFOXxxf5WiPm8figuHSD7cGvw4zLJmuYZAe3016tSYxdJ+g==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSm4fXJKbr0Ilo0bHhx2IddWfC7CbSR76p13NSPM4d6wzgPI6G//d3xSgrfyqkXgpMALAyC2ppln+1OxMNlirTDI5nKMqqJKkVghVW8oPzBzrmQZOpUmuq/Q2TiUHZ4tgDWWFiU842Ppvu9LSbc1J3F/KwoKF/N6FNaC1XzrhlOir7rtNczDmXCSD+92Gi8cb7+fccv1l4CeEkVRjpvlw4DWCRvTCNBjmMWc33QPly3vAxGEgCrg/SFTSRjHNW8NMQ0YHq0qnVro8eoBOZdqGkb6dIgwvXM7jRBwbbQWGDQ9U5k6inQ6nuK7maMu/BaEPz1DeHJGxZHHznKlmv2doBWs77y1Qd8z0ZjDC4i3Mfjdu1gVQgVTqYHk5U+QKlRa7d2oO8NiI8x6yg1w+rKMzYXRSC5EXjOcH4DkDb+0HcaiJM4QEiUJd3jFcO0BKiYCtqBZruJbbvxqnCs7zgm7gFr5S5z0jqpilbQw9dQ/ULKbOEf8uc5g4OivHvH0ND6F4LIxIWvwuFXG9bU6dDWX0h5/FNgYvuyUmN24OQZ3PTOdgfE8MWtO/MTyJRwcg3+GIe6JWBvvOg0oENL64Znafk7cS5NN7L4oNUbMB/5yron6QOwBoBWnSN4tudUF9YFjbkm</Encrypted>]]>
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