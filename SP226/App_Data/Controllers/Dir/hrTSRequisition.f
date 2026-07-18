<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenStockCopying.xml">
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
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckLockedDate.txt">
  <!ENTITY CommandCheckVoucherNumber SYSTEM "..\Include\Command\ExternalCheckVoucherNumber.txt">
  <!ENTITY CommandGetIdentityNumber SYSTEM "..\Include\Command\GetIdentityNumber.txt">
  <!ENTITY CommandGetVoucherNumber SYSTEM "..\Include\Command\GetVoucherNumber.txt">
  <!ENTITY CommandSetVoucherNumber SYSTEM "..\Include\Command\SetVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
  <!ENTITY CommandQueryVoucherNumber SYSTEM "..\Include\Command\QueryVoucherNumber.txt">
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">

  <!ENTITY APVController "hrTSRequisitionApproval">
  <!ENTITY APVApprovalType "02601">
  <!ENTITY APVDetailTable "d13">
  <!ENTITY APVHisTable "hraccyccp">
  <!ENTITY APVCheckCategory "rtrim(@ma_bp)">
  <!ENTITY APVVisibleStatusNum "3">
  <!ENTITY APVHiddenStatusNum "4">
  <!ENTITY APVStatusNoAction "0">
  <!ENTITY APVStatusOpen "1">
  <!ENTITY APVStatusApprove "2">
  <!ENTITY APVStatusClose "5">
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

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVScHb0r68JzB4bfUvnQ8Rz3/1U0FOeo6XKBb6csgRfI3CEvaAuwYu4xftN4KmlyWGCYIAbtbRYu79CtOl2+brf8pptGsBgepKe+6wlyLrrVlxSeBioUczYdDLqBB1j7BjI=FastBusiness.Encryption.End">
  

  <!ENTITY % PostNotifyApproval SYSTEM "..\Include\PostNotifyApprovalVoucher.ent">
  %PostNotifyApproval;
  <!ENTITY PostNotifyGroup "10">
  <!ENTITY PostNotifyCreate "exec hs_CreateNotifyTSReq @stt_rec, 'hrccyccp', 'hrccctyccp', '#notifyContent'">

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.hrTSRequisition;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="hrccyccp" code="a.stt_rec" order="ngay_ct, so_ct" id="H13" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="yêu cầu cấp phát công cụ, dụng cụ" e="Tool &#38; Supply Requisition"></title>
  <partition table="hrccyccp" prime="hrccyccp" inquiry="hriccyccp" field="ngay_ct" expression="''" increase="{0}" default=""/>

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
      <header v="Người yêu cầu" e="Requisitioned by"></header>
    </field>

    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Issue Date"></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số yêu cầu" e="Number"></header>
      <items style="Mask"/>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    <field name="status" inactivate="true" clientDefault="1">
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
        <item value="4">
          <text v="4. Đang thực hiện" e="4. Opening"/>
        </item>
        <item value="5">
          <text v="5. Hoàn thành" e="5. Completed"/>
        </item>
        <item value="9">
          <text v="9. Đang duyệt" e="9. Pending"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="d13" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="305" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="hrTSRequisitionDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &APVXMLFields;

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
    <view id="Dir" height="365" anchor="3" split="6">
      <item value="100, 100, 100, 137, 100, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="1110011001-1: [ma_bp].Label, [ma_bp], [ten_bp%l], [stt_rec], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="11----1001--: [ong_ba].Label, [ong_ba], [ngay_ct].Label, [ngay_ct]"/>
      <item value="110000110011: [dien_giai].Label, [dien_giai], [status].Label, [status], [ma_dvcs], [cookie]"/>
      <item value="1: [d13]"/>

      &APVXMLViews;
      &ListView;
      &PostView;

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
    &ListShowing;

    <command event="Loading">
      <text>
        &CommandWhenVoucherLoading;
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvlmb2oV+RpWzVevKN1BH2mMU+bXuWhHEDzcZ+qz+kwqaw==</Encrypted>]]>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75+OtaBLUCnfJIrJQ69IcdDXmpOpzMWJWKo613RuYKkprhLx3FaA+0IMaARZftrhJslBxXpVBRTicvGGaL+CByNO87/zXAFVMemvsOo0wRPgirJQLZwWK0opm6XC7dZcwAnH2CHuyz9g7YYsU83QRQP8=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4lu5GhEr7giApi2+Qp31OWZQ0yly4yvcOCbkO04ZUCfKPztzCsefTfl3rF3Nr2s+JNfAa/oqgHtjFQeQYS2ZBBgjt28da2sWd3zqoTWoAgyVaVfXm9CR39evzeoFOer1lEOEnmGAMFllMhfUrTkwZWagYFqJzgVx0qi3QKu2wQO+4e42H8B/i5QJMCNgK/DLKUNaHexE6Cp8H1WALnZULIv9aERo2ti0sAE9mbvYCNCcObZwk7JKUkqDAe4QbmcHmU30PKihm9weBgLt/zYY5IsbVcwazZRSUdXtjZDE2SR7mJTXR28nsL8ZWRK84aJ9xK4HUwI76vIcoyLiYcvO3r/gnTpzUUTSsGPvbl57VjGocRl/vArZLc1TZN/1wz79A==</Encrypted>]]>&APVInitExternalFieldsDeclare;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJbMsJWTbQUkRTzzjJD/Q0vgSDFzZ1ZpbLkBrlyDE0JMn2K/sBesum/R2CYucRPUL3+mZkRcR1VTiprz8kdm7TcNaLJuOgPQOX0hP9KzghgkbQPEaylYJYPFNbhfPRP0y6myWFz4PrkW2YSmCKQu0Cc=</Encrypted>]]>&APVInitExternalFieldsSelect;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJmqsAk72Ii7Myu4XNWxBZ7LFRJnpRsOvqw+sGYYBmMK</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AskXk6P9UxmDnA/+f1n2KJ3/gu6SlrzCeB+A9M4/Pi9AqzEI+HPsdur/HNgPaQ3JsiHwnwqXBDceqXEZS8gk9Jy/</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&k16JMzyEY5QK2k7AjkEOOckD7cAVUtB73/zFIZo34Rlqj/7zh3PCyksml9AreVopf50YfT9/XI2il98s+ExEng==</Encrypted>]]>
        &AfterUpdate;
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVT5tWJoqge7BrB+B/5gu4pm4K9YYUIV1hWCDgWkdN071BouYdC3Eyl4Bk/rWv9VfrmyfM41aHdiOQMH3t8wxl5/</Encrypted>]]>
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
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22eFuxksSbk5oJT2WIC6NoOC++f2IF622qs1pPG2WHKqe0ka3jbpozNW2XRVAQHXqc93DpNl8vgJfFJ9wVApg3/S94Jmo1sdaVjAd6aEgrdeJGaENN/hfGr5XVrinuAXDn4wzT2K1gUXKMn+vS1oDYBgxNNO0SAJms80cbywdxR6afFfAtiNsgzKpQ1QsIO1jDQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22eFuxksSbk5oJT2WIC6NoOCgJJ6689Si/SlNg0SvrA9AtLG3UR125Fay/YDUYVSR02M79S3m4ErgCZM7W0fnb4QNZzqeRrliURGANRbj9IZw+IiujI9jLfnfT1v1vJltXbAmWlkX75f3/xOEZx4nBm/Vjn4XvP7ZvX/QKqgtIX8uk8dmoH70+W7QXVweHtRzokgi7RHdG2kOFH/VBiuZyTI=</Encrypted>]]>
        &AfterUpdate;
        &ListDeclare;
        &APVApprove;
        &APVMailApproveUpdate;
        &ListWarning;
        &ListCommand;
        &ListQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZNhZJeqlGKX7sMOUOCtgTgR4GL5bpcicJgKWeLdNAS1M3dMa5lkYob/N/1+hEJluuF0JaZttiWlT0xDeXJQ26w=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4W7+Lc585ygcKSWABV+z1diagbhbm327jG37VAlxQODQYHJXEiPyWbZ8pkwYtCEFA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz4jUH9JXsKCCRCp+sIXHbBlzbtvreLzgZS6bAxFEc3wQ6w3lytEvVXsCnxie45lQg==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
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

    <command event ="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTO8TmkEbfdGHpywO2qEV5A1JJRCk+M5w8AVkcglICh7FZQhu7WcnbWo3YOjzE7q0XCHRXNuMaiFYl8Z05mhnRg2oI2DPYdXZtd5Ofeq8BwdUHCqY0v8JZtT0cU6XRWCHkM6oPorLU5ISwQwif239YG+d/+RZsBUiXZ43iU3httJ8VEhBjjmMBCk61NNXjbbFa9IgX4iRzhOOmSQgZiT9zbu3HTz4AnshSPmBMYuooVtuH3ytXlF/ayrYdnpIunyY8awwJ7Xx2fxohi8i1vltVhV/RAmpIAkasyPd6JfljJgX0kx6FRO6gNZS650+3/DtRIYhp7nJDMMcdcP4WN8WEdoKxMoLuXY/lCU5Y0r+0GSRqNiDjz2WFn9WPdowFKF1D5hqROLO8ONVk5i0Bd0ppaQfcvy6hPfCSwUBJmnAfYSzc5Ci59moUhCWU9Z64RLyKi8yEqB9u80r1dWtD9xw4t2Fc3hxHkUwRsrx3Gat00tGjoywaFOFduoUCy/JJZPQ3uOTLW2j4Nizf2lUbT4FtJJ5rBqpHuvTLor2gjG4LPrJDkkRCDn7v4agW332mmNlVVdgg+Z8nndQ34coAk7+NoIlzSI3X8+RSEmfZSMEy+I02IwUXyUYWREhH+iN0qotohTTdAsZ4hysygje27G4Y4NLVkqjdMbR2sQTFb5sJPodDSPycvofvuTVZ4tH+uWsenrcYI+Cq77oZirqiGzHxPZRHrHQiLdS4b22lhW9fs4Hb5a+JRkWpI2x+HEjdm/x1YmhvGtnTLRnwWFrHZVhP75eCH0OuuGGeeLvD0e7mdcOvnuU0u64bd/Ogb7PPt1Tk1OtBkzjTj/6yc1lV7xZgzshxHTgbZ6gVDkLi0mMsAs5F6pN5LXTOHwswRvfCakpbbahKVU1MXNLzknAgAUAtVAKlLDt2i9ky7MP7TiJv/cX2oy76Rb4XGImLT5zTkWBuLgE5isEScao5h0Wi6zehFEVc3hNbxLXBSqmokQaNx0vrRHm+hZrBkVzG+czYwk171dhsOuC7xX1AgRuHVquJgBolxlXyHkZtQs61SsRx5pX0E1pl5WVghrEl95FKt+nW5G1UNlPZ7Tju2c1O2GKrMef3ehk0ve06YnwAPyEF5BSjbZ0EGuCKmnReq77g+K6DA==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyctttQFkPUSHA8a4RLwhbf4C3dH95u1OGkvOt8Ks7Zl4bXZ98NYYd1FSnp/x69q1Fn5i5cgK+OoKsI1/e8LHLmkz0Dd1Nu5cIHCLQ87ah2DdROGgC8MIz6a4rU0RudXgEdFragvmjnGWghDVT9YTCp85L7OB9+pIgCLlnVylfYhxUn84+nykm1V1GJGll/lT5jMFI6aInv8wQ/tczYgLU2BcSt83i4AWhGyw6aFVb/N27Ei9Nm9mdwbQ3s9ERAvFx6srFmr6Qf/1wWIPPFIwvBK</Encrypted>]]> &APVSetReadOnlyFields;
      &APVHandleStatus;
      &VoucherLogHandleStatus;
      &ListCreate;
      &PostCreate;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+auOqx9SFGe27xHLcqSzeZvMhGPz9cZyKuSfeaFN8AiFRaEt5tt+3PstA/H0DEvGJIUM+bpiKkcZDKcflPthjIaIDfO/0txNF18Zsl6e7GxM=</Encrypted>]]>&APVSetReadOnlyFields;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVrKtUN2I68mS+YNu1kzGd1cOdkJIIx3pPw1L3r3RKmURR8m5+PU/iMzQkaFFOc8+6tVTWhKp1ISJtkuDdZb9ed9KB+n+d0HD1vy1Y5jdgYI9fNz2LNglS0iW5Xlq77UJ1R3g5TsPCvY+ptk1JCTMy7CNA/h34BzBrE6jAVoD1AXV5GS1/76qFGCChGxwxhFucVNQXNJibz+d3KP8C0BwCEISrOnVqt3MilSUYbmwglmnNJmOxz2tlQN65QuXEuRjlg=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezk70L06CG7aMwpt6isv1sOmfREia1TN8xwpqqIlBz4w3uH5tGnAOtFtR+Jpd5XOfCQltIdmJUd7C1HpzsItIUhi06KjFSi92ZHlB4bAlDxVU=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZCdbJ+U2ImncEMAOCRkzWrtT+8FihJ+PDYur3vchdp+5ZzE/0W9FibPkFGMznceS+d08vbUgCukescwu+rlotFwCUoju7saw8woa9ZCLE90y/4hRTYVasMmW+mVU7Ld1g==</Encrypted>]]>&APVAddStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KkyM+BtQQNcZk7mdKL5G+45d73hsHaY0UF8NnB2EOmYFExZTdR+X/cVMhU1MQNFSJ5yJW5FplAnfEVWgXm9HBjftkMiRaPp29tBASNFokL1r5La4cqmljzC6WmB/Q/lr2</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TgUTPZ2dcLCXC0JLs+ueAI=</Encrypted>]]>&ScriptVoucherNumber;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QIR+FbF1QDe7yjBFBVgtBDp0CKP3CaLGLXaLE6ZewlpJn8G89VLqS4Ycmct5QkGJ4mNfHAUYWYesKKERaCSDwY8NLRGrZtPZvwvh0UtKXS5PoSMHqbCuxs3nPN1VCbyhBtyh7aiigq9E/nj6qllvr9Et2B6/kTDetQLgPvKrmrZ</Encrypted>]]>
      &VoucherNumberLoading;
      &APVSetVoucherDefaultValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &APVSetVoucherDefaultValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dJgeUcGBXK6zcr2MH4Yp6dQE5CUfWxJ1aqyjnDiCVZy</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSmEphKpRa0WUxaijYYpe7wb5ROoYFM32MWHaVniYohWRTiC1i6uGLVTLxIcRP4MGdU</Encrypted>]]>&APVWhenVoucherCopying;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22f+qeju1WMpdHTyKloCcPObgLzHOCWHZN2tfoMPvbhXO/m6Hcs2oa6szZoFvEE2ASJCuBCPaNuO4zAAuJ4uoyBbq1419b2fpOF+PNRu9qhS0eO1Odc8lAVrs2nrr4M2e+bhE4nYOMb6DbV0xxCexJ9k=</Encrypted>]]>
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