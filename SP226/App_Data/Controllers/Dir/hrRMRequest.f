<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenStockCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
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
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">

  <!ENTITY APVController "hrRMApproval">
  <!ENTITY APVApprovalType "02801">
  <!ENTITY APVDetailTable "d10">
  <!ENTITY APVHisTable "hrarmyc">
  <!ENTITY APVCheckCategory "rtrim(@ma_bp) + char(253) + rtrim(@t_so_luong)">
  <!ENTITY APVVisibleStatusNum "3">
  <!ENTITY APVHiddenStatusNum "2">
  <!ENTITY APVStatusNoAction "0">
  <!ENTITY APVStatusOpen "1">
  <!ENTITY APVStatusApprove "2">
  <!ENTITY APVStatusClose "3">
  <!ENTITY APVStatusPending "9">
  <!ENTITY APVCategoryIndex "9">
  <!ENTITY APVXMLFields SYSTEM "..\Include\XML\APVXMLFields.txt">
  <!ENTITY APVXMLViews SYSTEM "..\Include\XML\APVXMLViews.txt">
  <!ENTITY APVXMLCategoryIndex SYSTEM "..\Include\XML\APVXMLCategoryIndex.txt">
  <!ENTITY APVInitExternalFieldsDeclare SYSTEM "..\Include\Command\APVInitExternalFieldsDeclare.txt">
  <!ENTITY APVInitExternalFieldsSelect SYSTEM "..\Include\Command\APVInitExternalFieldsSelect.txt">
  <!ENTITY APVCheckApprove SYSTEM "..\Include\Command\APVCheckApprove.txt">
  <!ENTITY APVApprove SYSTEM "..\Include\Command\APVApprove.txt">
  <!ENTITY APVMailApproveInsert SYSTEM "..\Include\Command\APVMailApproveInsert.txt">
  <!ENTITY APVMailApproveUpdate SYSTEM "..\Include\Command\APVMailApproveUpdate.txt">
  <!ENTITY APVDelete SYSTEM "..\Include\Command\APVDelete.txt">
  <!ENTITY APVWhenVoucherCopying SYSTEM "..\Include\Javascript\APVWhenVoucherCopying.txt">
  <!ENTITY APVSetVoucherDefaultValue SYSTEM "..\Include\Javascript\APVSetVoucherDefaultValue.txt">
  <!ENTITY APVSetReadOnlyFields SYSTEM "..\Include\Javascript\APVSetReadOnlyFields.txt">
  <!ENTITY APVHandleStatus SYSTEM "..\Include\Javascript\APVHandleStatus.txt">
  <!ENTITY APVAddStatus SYSTEM "..\Include\Javascript\APVAddStatus.txt">
  <!ENTITY APVFunctionScript SYSTEM "..\Include\Javascript\APVFunctionScript.txt">

  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">

  <!ENTITY ExternalCheckVoucherNumber SYSTEM "..\Include\Command\ExternalCheckVoucherNumber.txt">
  <!ENTITY CommandCheckVoucherNumber "declare @ma_nk varchar(33)
select @ma_nk = ''
&ExternalCheckVoucherNumber;
">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVScHb0r68JzB4bfUvnQ8Rz3/1U0FOeo6XKBb6csgRfI3DCTv+y2tMkwzyC6rE2kg3aPtsGRBe1GxJgX2WsaN9gzIntE+u6XJe8YPs1Ns1DjyKqWWB7FNGFE+8lFuyvCjNw=FastBusiness.Encryption.End">
  

  <!ENTITY % PostNotifyApproval SYSTEM "..\Include\PostNotifyApprovalVoucher.ent">
  %PostNotifyApproval;
  <!ENTITY PostNotifyGroup "11">
  <!ENTITY PostNotifyCreate "exec hs_CreateNotifyRMReq @stt_rec, 'hrrmyc', 'hrrmycct', '#notifyContent'">

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.hrRMRequest;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="hrrmyc" code="stt_rec" order="ngay_ct, so_ct" id="H10" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="yêu cầu tuyển dụng" e="Recruitment Request Form"></title>
  <partition table="hrrmyc" prime="hrrmyc" inquiry="hrirmyc" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" aliasName="a">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" allowNulls="false">
      <header v="Bộ phận" e="Department"></header>
      <items style="AutoComplete" controller="hreDepartment" reference="ten_bp%l" key="status = '1'" check="1 = 1" information="ma_bp$hrbp.ten_bp%l"/>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người yêu cầu" e="Requested by"></header>
    </field>
    <field name="dien_giai">
      <header v="Nội dung" e="Content"></header>
    </field>

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số phiếu" e="Request No."></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Date"></header>
    </field>

    <field name="status" inactivate="true" clientDefault="0">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Chờ duyệt" e="1. Open"/>
        </item>
        <item value="2">
          <text v="2. Duyệt" e="2. Approve"/>
        </item>
        <item value="3">
          <text v="3. Đóng" e="3. Close"/>
        </item>
        <item value="9">
          <text v="9. Đang duyệt" e="9. Pending"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d10" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="266" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label>
      <items style="Grid" controller="hrRMRequestDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &APVXMLFields;

    <field name="t_so_luong" type="Decimal" dataFormatString="### ##0" clientDefault="0" categoryIndex="-1">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nk" external="true" hidden="true" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="326" anchor="3" split="6">
      <item value="100, 100, 100, 137, 100, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="1110011001-1: [ma_bp].Label, [ma_bp], [ten_bp%l], [stt_rec], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="11----1001--: [ong_ba].Label, [ong_ba], [ngay_ct].Label, [ngay_ct]"/>
      <item value="110000110011: [dien_giai].Label, [dien_giai], [status].Label, [status], [ma_dvcs], [cookie]"/>

      <item value="1: [d10]"/>

      &APVXMLViews;
      &ListView;
      &PostView;

      <item value="------1-10 : [t_so_luong].Label, [t_so_luong]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        &APVXMLCategoryIndex;
        &ListCategory;
        &PostCategory;
      </categories>
    </view>

  </views>

  <commands>
    &XMLWhenVoucherInit;
    &ListShowing;

    <command event="Loading">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvlmb2oV+RpWzVevKN1BH2mMU+bXuWhHEDzcZ+qz+kwqaw==</Encrypted>]]>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75+OtaBLUCnfJIrJQ69IcdDXmpOpzMWJWKo613RuYKkprDy+Uxcc6cXVushGcyynhZHrWVVpqtoWIUF4JnlOnlfKHro8bQ1Jb4gcUjpIgugQidRvXGzTZMUkJWMu60tZ6F/SkEhp0v4zt8WLpDNC+Img=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyaVpCbdGljJ0ivNhQve8w+jxSBasTVZXXbfHmiBooA+Bq0miZZhxAN27iVDIzkPq1GorwzcGPrTZdO6amoBth0ilQvPi491Xd5Sj3ghPIEtTNI784XhEPqwXs7nsnh0izfgbngbUM5JVdrLSrOVMy8YgdNk64coVUoCNJzMf1UFffcqhAYOGHU/UCGthUPHD3GXTUFV4Ou33182w1ns0x8NK8vYsktYTvalbk8PMnowOe6W+vLSRzl0D4zPNQFUSg==</Encrypted>]]>&APVInitExternalFieldsDeclare;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHbGR7FA2O+BiNk9g18pUbZhwfjVxpKPgtyhGS9UQUDkTqBGYQLCK+jjs29AVZoYmq1HK1xNBSYDMIVMQLk5TaR5t+ETjiNyhAeLNFShOs7ZCIiEBX7xzCqUjy7yA0eFrQ==</Encrypted>]]>&APVInitExternalFieldsSelect;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJmqsAk72Ii7Myu4XNWxBZ7LFRJnpRsOvqw+sGYYBmMK</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &APVCheckApprove;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24Asn8hzCPN+Oq+suHcjIsVM4VnF6sxADOMfcLsInODUSMrFp+jKggai5qPR/QEz6mrcw=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&k16JMzyEY5QK2k7AjkEOOTArLbDExRnl11XNr4fkotOxHaw80J0g5xfmNrU6ZjRwNC5AAJmB5GqKmbKipa791Q==</Encrypted>]]>
        &AfterUpdate;
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVT5tWJoqge7BrB+B/5gu4pmhHEq47PfvmECSEmEgLCp6oIuVXVuZB+QyYuSEUeEKag=</Encrypted>]]>
        &ListDeclare;
        &APVApprove;
        &APVMailApproveInsert;
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34IHlwt24I/MArn2WpObnAPdHhKaA4F+GsAEK+jiax8IJWZyeDW+ACuKOuZR40GeFg31IJWuZSrqy8jDZCOa0lBH</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &APVCheckApprove;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbizbgOPt4KCg/UoJsgbLBnc4u56ES5g5Nuwo8FKpOUzcN3eHwlj1xzXe0t7+ZkOBI5gUx1nmIhmVMKmWbIqAw8PUV+97BTOjjOZY3EyGW9ACPVg5yV5hGJrAgDmm+ea9RhJq4ncNpHuuxwNOWILquZKCNLXjd7CmtY4Ajqs8b6636ZKLGQiHk8+8TfW/+nC7DDqTwrtFePe7EXLGBueJwW3gSmDb34/ES6oA+XM1UWFB129IZIRqYxKoaX4DiaLj9QkvWjhh33FpqokLcny4AbgPM8wiaOXGYFsn0HHu1PI+zLzbLqYdDXOLXoKprVtgvz5HCL7xRRLrZ3t1n5IkT/5+u/UEGGlmUPuUM43NKcQjbKV63R6iXmogKrT780Ne5</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WEfcmnv6QR50u2BQE5gsgcBOHPwsPPtJWzATLd1sVqd01qKz5jV+ffL0HJFaTPFbT7TkPw9SzneCXttKMrvgiOr5jpA9yNXQdjeFpks/hMMGwlH5kUtPKKIY5redYzHuPPvzqeFC6rwotgbExwfbJY=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WEfcmnv6QR50u2BQE5gsgcBOHPwsPPtJWzATLd1sVqdEF4I71To1L9cffyp04L9iH0YhkfUDESUI2YejnpnV1VxevMgMgI6bSeYBY2d4WWcy+dsNXIjRITzI3zcHOOzV0NgFMCc9my8ep8KvpS1IRtp5MqMvIoVM3g7hABhLQlmz95rAq7KKtp2vw9z4GY2maNhddDHDblgmJnATbNvVxw=</Encrypted>]]>
        &AfterUpdate;
        &ListDeclare;
        &APVApprove;
        &APVMailApproveUpdate;
        &EndUpdatedVoucherNumber;
        &ListWarning;
        &ListCommand;
        &ListQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZNhZJeqlGKX7sMOUOCtgTgR4GL5bpcicJgKWeLdNAS1M3dMa5lkYob/N/1+hEJluuF0JaZttiWlT0xDeXJQ26w=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5yE3oWgnls18inR3g88tder/Ca9VCtECDRg6joH8dGsJsp5czhvhOJ6B52bz2NkcJKIXSx9inhLvR4eipTMvIS4GYUwHap2UIoKkVnRybw+WU9Vxhdg/zb7eZ8GZrTtdBqO/eE0U5mzNwkK+7RsRuQtopAhhdVzfsIdCGFs4MxXPth4Az+Dtji1CYXLG2VE/qWmRetA9MNTIap0TZGXwKV53m1vE1DvFzFoi1lBdjQ81uMZevZV/5du0VjVJwtnvGsr3ljDAN3mmTpfbIfboiYgeNbuJVZSTLv8WyXlf6gZQ7aUxaFY0Nsy08lYoxlFnga90lGnsi2oIveCQBQKRVfO1L60ksnlQAtpPKg7nWImbS2EvQP+6VdRP8Jau5mrqDdViQa29coJN4n0wYkH5eUlOlTg80bwwF71fHgHfxk7</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu0L1laKj2Pdu26i7rnytHZGcrQwLlQMZYLxjx85jWQ3sxZYRUPhUAuLAMltaSbnfhQ==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &APVDelete;
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
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzg1CnqAqiGaVcLrReGHQaY0h2s+ps/VFLY0H+htakaEnvCEY7rw8iWRcUt9fvri1U75j455EiVCnHiq5P8/jvhT9cVK4a1z3WeCXWPljrvwcgLV8it3c9mpWBHYQGz7wC3hqWW5pEVMejkM/jLgh3ln9fZ2u3upwN8oWGYTGJujLOjUhYdldlqKr9kAw95qCITK3C8D93O96wYeirTK61mfEcfuaTCG9cnP+KI5XZxed2hbj6RXrJWE7Qjf/UQOGTFt3OGymoq6Yi6ai6UyBnQZhWJd35hi4tlFzPMXRIb566GRj6YOTO/lwBzFLMf3mGMoYL2/YD9kvOF8lKHi0oX1OpEJQ05PSSedgAvvaYAnGZnvzm/8M64Iu1IRUBOwBB6kzx9rdmq/eqtsR6rlRyjJ03xV0CKZxylr9fC2oZtRdoPF29GE7RKjBkkOGga1030pNYiUuLdgEVilMBB+4I+xiOMRQNCZFWtJ1du/Xo3ehlmauzMg0Bp2HuB1GJ06Fs=</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpBnoNIZkSaa0Pg9NmkLQ+h+XnLyYVIrTXNP0wqMJeaGPzdvp+E+UU+JyWbz9LjdBgFXg7pZnXhvMHkZoHhqwEWo5IkQXrtGVReU5ing1w3i+0Hz/YJsX0zQQn4Rd4hLK7hprZFcwuzck1fcrGEpC794PW1f9JRLSEyTeZqaricWyColbOx83ZpTRNVvYUJyWZcnnx4ntQ41wbVfraM+DPghUeHe6Ttaqd1UUaRWgtXXevdNJDiuNV2F+0gVOWazu+fjkX1KiVd0S/KgG9ePRl1aTK3RKq7pPly5Fh4HtwW1o=</Encrypted>]]> &APVSetReadOnlyFields;
      &APVHandleStatus;
      &VoucherLogHandleStatus;
      &ListCreate;
      &PostCreate;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+auOqx9SFGe27xHLcqSzeZvMhGPz9cZyKuSfeaFN8AiFRaEt5tt+3PstA/H0DEvGJIUM+bpiKkcZDKcflPthjIaIDfO/0txNF18Zsl6e7GxM=</Encrypted>]]>&APVSetReadOnlyFields;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVrKtUN2I68mS+YNu1kzGd1cOdkJIIx3pPw1L3r3RKmURR8m5+PU/iMzQkaFFOc8+6tVTWhKp1ISJtkuDdZb9ed9KB+n+d0HD1vy1Y5jdgYI9fNz2LNglS0iW5Xlq77UJ1R3g5TsPCvY+ptk1JCTMy7CNA/h34BzBrE6jAVoD1AXV5GS1/76qFGCChGxwxhFucVNQXNJibz+d3KP8C0BwCEISrOnVqt3MilSUYbmwglmnNJmOxz2tlQN65QuXEuRjlg=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezddV196eim9GEX57kLpvhjXigINwfrrUHRIoKguY4mpun0YfplmQ/+1vIahjWEBvzKspqmbEpJTSB7Wtkdd2ebQ4qxZH71vQ6xT4jn3R3wD0=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZCdbJ+U2ImncEMAOCRkzWrtT+8FihJ+PDYur3vchdp+5ZzE/0W9FibPkFGMznceS+d08vbUgCukescwu+rlotFwCUoju7saw8woa9ZCLE90y/4hRTYVasMmW+mVU7Ld1g==</Encrypted>]]>&APVAddStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vy7q44igjOBa39qMgr+zWt6dM8vboflNKeiYx/0PbySY1WCB21e2FjahRFE8lQvaIRj+JqIgiN57NV/+JBwHToQy6SfMm8iIbovFRKswaComFWqIEvdz1ZizTJ6HlkDCqDdq/FwoNLsRpQngqRbLVrN</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22cyr2y6nn85uBlHB0UdecPelpQXMInjEgAHHLlMXM0mw</Encrypted>]]>&ScriptVoucherNumber;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;
      &APVSetVoucherDefaultValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &APVSetVoucherDefaultValue;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSm4fXJKbr0Ilo0bHhx2IddWbjxce6elXs+967p9sXWHrJtzJX8uwLyHLa9xkV1G0Oazj5pcrYFDJDVgyGTbBamVBH7w7fMfvYrKGr1L1mYiGQuaKIpEVnIFeIuF/Pk7JncRI7nvs17baQF57XY38R8+bwEx5miAdwY60/1Qm/yV2o=</Encrypted>]]>&APVWhenVoucherCopying;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TgUTPZ2dcLCXC0JLs+ueAI=</Encrypted>]]>
      &APVFunctionScript;
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