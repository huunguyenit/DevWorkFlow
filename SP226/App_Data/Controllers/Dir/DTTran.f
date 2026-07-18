<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenRequestCopying.xml">
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
  <!ENTITY ScriptExchangeRate SYSTEM "..\Include\Javascript\ExchangeRate.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherDate.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">
  <!ENTITY ScriptVerifyInputVATInvoiceNumber SYSTEM "..\Include\Javascript\VerifyInputVATInvoiceNumber.txt">

  <!ENTITY APVController "DTApproval">
  <!ENTITY APVApprovalType "00625">
  <!ENTITY APVDetailTable "d57">
  <!ENTITY APVHisTable "a57$000000">
  <!ENTITY APVCheckCategory "case when @ma_dvcs = '' then @@unit else rtrim(@ma_dvcs) end + char(253) + rtrim(@ma_kh) + char(253) + rtrim(@tk) + char(253) + rtrim(@ma_nt) + char(253) + rtrim(@t_tien_nt)">
  <!ENTITY APVVisibleStatusNum "3">
  <!ENTITY APVHiddenStatusNum "3">
  <!ENTITY APVStatusNoAction "0">
  <!ENTITY APVStatusOpen "1">
  <!ENTITY APVStatusApprove "2">
  <!ENTITY APVStatusClose "4">
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

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpC4IUGz8Wg7HsSUsA2k48g85oMH3d3kHsAgjVyi9mGtF0WLtnBsssqlT++Pc619tLOCj9ykzlH8GG7kkuMcXa3zA==FastBusiness.Encryption.End">
  

  <!ENTITY % PostNotifyApproval SYSTEM "..\Include\PostNotifyApprovalVoucher.ent">
  %PostNotifyApproval;
  <!ENTITY PostNotifyGroup "06">
  <!ENTITY PostNotifyCreate "exec rs_CreateNotifyDTTran @stt_rec, 'm57$$partition$current', 'd57$$partition$current', '#notifyContent'">

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.DTTran;
  %Extender.Ignore;
]>

<dir table="m57$000000" code="stt_rec" order="ngay_ct, so_ct" id="BPT" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="đề nghị thu tiền" e="Customer Payment Request"></title>
  <partition table="c57$000000" prime="m57$" inquiry="i57$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="dia_chi">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="dien_giai">
      <header v="Lý do thanh toán" e="Memo"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb6oCvCyvGNeTkvFCI1bz32ZJ8lXhThkCwWNnPFWt5zZ3A==</Encrypted>]]></clientScript>
    </field>

    <field name="loai_tt" dataFormatString="1, 2" clientDefault="1" align="right">
      <header v="Loại thanh toán" e="Payment Type"></header>
      <footer v="1 - Chuyển khoản, 2 - Tiền mặt" e="1 - Transfer, 2 - Cash On Hand"></footer>
      <items style="Mask"/>
    </field>

    <field name="tk" allowNulls="false" clientDefault="Default">
      <header v="Tài khoản nợ" e="Debit Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" allowNulls="false" clientDefault="Default" defaultValue="1">
      <header v="Loại chứng từ" e="Voucher Type"></header>
      <items style="AutoComplete" controller="TransactionType" reference="ten_loai%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="loai_ct$dmloaict.ten_loai%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4WPBY9Z4E2DttbNSMn4AfgyYnyMgEYD7WWfqa1ULxcB4azdnVto0vLlgYjf4L7+rk=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb5BYwfrIxe7sbc0hyR4eVljmUTDHmx22aCjIAbE49BcDg==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày thanh toán" e="Payment Date"></header>
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
          <text v="1. Chờ duyệt" e="1. Open"/>
        </item>
        <item value="2">
          <text v="2. Duyệt" e="2. Approved"/>
        </item>
        <item value="3">
          <text v="3. Hoàn thành" e="3. Completed"/>
        </item>
        <item value="4">
          <text v="4. Đóng" e="4. Close"/>
        </item>
        <item value="9">
          <text v="9. Đang duyệt" e="9. Pending"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d57" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="194" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="DTDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &APVXMLFields;

    <field name="dong_tien_yn" type="Boolean" categoryIndex="-1">
      <header v="Cập nhật dự báo dòng tiền" e="Update Cash Flows Forecast"></header>
    </field>

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    &ListField;
    &PostField;

    <field name="ma_dvcs" hidden="true" allowContain="true">
      <header v="" e=""></header>
    </field>

    <field name="tk_ex" external="true" hidden="true" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ten_tk_ex" external="true" hidden="true" readOnly="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="254" anchor="7" split="7">
      <item value="25, 75, 30, 70, 50, 187, 100, 8, 58, 42, 8, 100, 0, 0, 0"/>
      <item value="1010100-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk], [tk_ex]"/>
      <item value="1010000-10011: [dia_chi].Label, [dia_chi], [ngay_lct].Label, [ngay_lct], [ten_tk_ex]"/>
      <item value="1010000-10011: [dien_giai].Label, [dien_giai], [ngay_ct].Label, [ngay_ct], [stt_rec]"/>
      <item value="101100--11010: [loai_tt].Label, [loai_tt], [loai_tt].Description, [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="1010100-1100-: [tk].Label, [tk], [ten_tk%l], [status].Label, [status]"/>
      <item value="1010100-----1: [loai_ct].Label, [loai_ct], [ten_loai%l], [ma_dvcs]"/>

      <item value="1: [d57]" />

      &APVXMLViews;
      &ListView;
      &PostView;
      <item value="110--1-10-11--: [dong_tien_yn], [dong_tien_yn].Label, [t_tien].Label, [t_tien_nt], [t_tien], [cookie]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &APVXMLCategoryIndex;
        &ListCategory;
        &PostCategory;

        <category index="-1" columns="25, 75, 100, 25, 212, 100, 8, 58, 42, 8, 100, 0, 0, 0" anchor="5">
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
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4IJ+zPBW2k+1o75apxCZqtKhplfE95GYnR72LWQuAaf0WScsbEbOocWKSomesoXWdyVhcbEWPKMRKTJ7qKefNslS</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWd6HaL1OGauusRtQb6bqs07xG6Qjwkz8N1z0TqPoMU5IOoFDY3nwNKOqVHA66gwNgja25/CKYoVnG6NbMSTqOa2WHsZV6QaseAnpSS1wXTh9x1cpNc03uvgYV5jR6N+rfrndZSc9gpzyamP7X1nhS5CKn8EDLWQ2hpHqEBrn4EwozwzG/Pkz8oASYw5SFBi2V901s1/At7x0nvYMX3Rp6Px3ZSkIiOCmkvR43hT7xELQw==</Encrypted>]]>
        &CommandExternalFieldSet;
        &APVInitExternalFieldsDeclare;
        &CommandExternalFieldQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0z4sFwF7cdKnIcbhLvJe3kpBMrwoKl7v0r37zxXuk921YvRvJ0QkSiCSgzGzd3n+rA==</Encrypted>]]>&APVInitExternalFieldsSelect;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJmqsAk72Ii7Myu4XNWxBZ7LFRJnpRsOvqw+sGYYBmMK</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxkW8sDrYa7jtl7JPjw97A4kf4yyll/zk4Ipgz7w9PC700XJUr//DBLtLUOcj3l0w+E8JidS6GB/R2JH3JUJupIGWxCDcRaYVuR5+ba7QXX9LdAV3JGcl+xWc+Pc/+3rXRTM+cFStI95RDIhMetRnERQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLWWbwVOoxYXBeUBbLUNN3gTsZeUg3mWXm30w5O3xgyeO8dIh6tKBZA/rPMf5nAkMseTU9SoT0tQ2S2WlTlBf/U=</Encrypted>]]>
        &ListDeclare;
        &AfterUpdate;
        &APVApprove;
        &APVMailApproveInsert;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34IHlwt24I/MArn2WpObnAPd9LPwnQpbpIQWpziQ+9oUQtNomSacdtGfI2lm3lvuj9D3L8/fUFdeIm4L2y6vh+VO3vYTw1B9PQ51R2ttB7NMiA==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku0JWaksKtmF1z5SaVqOVAXCC3l1gPvEBgWJluSdoYtFGeNP+caB4eQgDXBS1JfPvd25rKWuLTohB1MAQITj5X/29D/V72p2xr7LVPGTqfoMcG/rOaduwzvDtdp3QYZg8grXJ/HZP+xjlKXb/b9XulANQRYZoiYhUEuSpBQOf6Mu/S1Ru2eQ+UAfMCoxIrSLeY8ChT3MYTIZAQEvkd4GVx6I=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ZiHX3qPjcDSXEfu3MQ4Q3gXf9XmT9NHQm8zaJ6gq+b5V7OatnL/i3zk4y/odmbJkKbwmotoq4TAwptITHxJQALd1ngfwGTbFqui/81cmpV9buiWNJPxbtRzCqhdoEI6s8SLMUMssbCJ6iY4e36HAXz6r5JL8akqKHbQo5iSWFvPKws9/YCq+rbeGBM5dgu8H5G4enOtnZHmFVBq20FFTBpUk0moBaoU9uqaVMigc3KE</Encrypted>]]>
        &ListDeclare;
        &AfterUpdate;
        &APVApprove;
        &APVMailApproveUpdate;
        &EndUpdatedVoucherNumber;
        &ListWarning;
        &ListCommand;
        &ListQuery;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZNhZJeqlGKX7sMOUOCtgTgR4GL5bpcicJgKWeLdNAS1M3dMa5lkYob/N/1+hEJlukCm8W1MmwvVHW1nVINiACEJbZC1I0rdLb8il52wWFoW</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6rj182wT8rFhqY7nAmlqv6IJcH7444RwP8EAc6h8qcgNibugTbBBmAg5AtNasgocKvoj4wk+TT44ffD2DjXRik=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EcC2Reti8lbzdZKpOM2XcPtyqfedDAKFTy0VepLk2E63hZJoAwpIY+oLxHyD+eZnldA1leiElIp09NwkpGqHg8cty3YVbmporYX6IifYdiIQEprlirenBEihrlH7qYH2T4o0ZYdAYzY4/5vP9OcT43KPsG9buN5G2G4S0s2LPs0XX8WGMcND0VwJIz7gn7IuVPq8+eeu9XX4VCIFhfdTWSQ4hNf3lFf+kzBE8g8r0kjbtt85D8wHYhElcWfnHU0AJIgDtmAtBK9Y8AZiNCiBCjvywv0PEApAy2jwKXnLgGNGq9JutQh/8V6gJAotxn4CKirkHITQWeSj2dcCFHgHrZiMCvgj84xzD2rNDxHBeU/XzN6yGV362/lERcfFNh+7kofTF4F9G3DAJXzoby+B4VVlNTabf4zGAOCYal1qPS0ZvNeKhVpYNVLRRu6E7bYjx75iGTo83n444R/KIqXHFKLbmm8qiTPCn6HjyF4063xOv5I+mqmTzP4HKtoTAb16oYknbzyX4YkvoXHgss5r57ywcil61UGqJJFzXUJhVQsxXLeffvRAIGUL1Z0V/kxH4Elcm/PMmS7eo5XgrbUKVJNkP7KB/1xKRhLcnNf2E5e5FwO2KkfB0Kpo2YcKvO4BhA==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5Lpya5pYlEWWAacedGhSUOcnBVTepPq/RK0ZHcGx3vzmWllaktrR3ayTGRTqYfyAsr3y6NUQ/SSM6kMR3XW4HBooYbVAdvctE+8GLSKkiSttRbQ==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UuCDoMOlUGKCJw2dFaaB+3M0UBVxZfG1Oci4F0DFi4xhiPz2PzA/1Gjr7UurAGapQHtJKXPLpkt31cROKhu3RQjLmS6ytje+fgntJhyfvZ7KzzL9nKcKGlmYtKyNb++gDX8x3wCGbTxkhr7cZ+FSp7uSCErH8PWMlz6v06awpOL</Encrypted>]]> &APVSetReadOnlyFields;
      &APVHandleStatus;
      &VoucherLogHandleStatus;
      &ListCreate;
      &PostCreate;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+MYv8XGG4TVYOq1SdOrDIew==</Encrypted>]]>&ScriptScatterVoucher;
      &APVSetReadOnlyFields;
      &VoucherLogHandleStatus;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVpcm33CbYspUl2iSbOE17851TWgxRmgfnQKlvNRAdsTtQ==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WUdrEx4Ddkm0kC3THp0yucCac6Gy1WN95f/zL7hJus9b0CuQ6XrcEHH7yrD8gVOSq/twRIx8SpuVdGHLAkZ9EFb1Rt1R1PCyVc1ONaB+uBAY/WZy0FwepFRfrBOQZJrhSHdYULDFD+lJixq2He7cuBxsu4Z1erq9WELAO6yvJPqSkXWl+66onKL0dJlqcO2uA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacez5cfrvWlCZlYzYKsk9yn1nfXOaZWf8VkYigc9bW6sJrYCusGNjSW1z9MddK9sqk0kewqrgdnhcUwMy7kynpIMEkTbWGdrumfFDiBDDkDSiqQ=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwCxcYd2J0gZdsN1luN6RXiMwfzBe5KdsEX3N8ILCJPOTZZktorxqif7gv5nD/tr0+egoTyarxLa6qElRGJ1QNkj7clP9SXWHBJTDx/wxT5P6rCY4pQb1KfG/1vMTftIvygQZFkyhQL9K7n7Geyq4fc/Q4otu4C+76i1eZdRFpiAVRtEm2L8kiEBI27Y1gkiQ==</Encrypted>]]>&APVAddStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KApgGJvPb1DW+53xCFh87q4Cts1wNIpklhNvYvCE8W6oN+MfPqjdHIErI3jRIkO06ywAi1SCQeGTnocLNxcD+0A==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7BvHCz6LZw5zw3oF/HOmTHAgePXvCv6g5eMa9HDDqLph8IGDG/4q0F3RIudgn4XWKUFvuhGPHOUU3PQ5uUAmg4nyNOogiBGnx2R4/eZTSyRKA01laCfFNOvxqp32BCK8uUnYm0HWLQEbcEpcrAsqLJF2TeHs5qU5xi1o+IXIQhOJUEOJbBenKNk+17JBdqPAlAXq4VcH2wJGaTiYFeN79ZiMd4FJQZdtPl5kITwJ5y8WgUfd4GR7K/fdk1X5VXaMKHMP9HNM0TB9oxD5z8bdHZE7hlAty2Prq527tKAwS6Scf0E3Z6/I1XglIU7XIq14nMiwlZV7VqOQrzw8x96845gx5F039wtqm0fMqKAu6cQFw==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOr2MLY2bYw4Flxo4jU5Y2bgoZ8ED3VMSJbVnJrC7+hOizOEoO9+g57nCTQq/EvErKzNRfRgU/CgjMa2bYnU125B</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UuA/TaprI5bZfQQ/n3Voe7UqnvAf6GMlru2UPsktsgZxoleE9qPZK2kI+Xya5N0yrAnyUqFMbAoqMprubQ9WPxh8ZAdki4UA3Mit0lnbZRZHZE7LBPxlRpuodh2YZCt50RQP7PldQfIFqO5gMmIwUA=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6EHefn2QMKuKKJPQcG/URqpyFqpeqboTmw5axERgN3+fhxIanO/AAGIgj9iO0gbekUIC4TtiKB6UdCP+zXmU6lG7gvzf2fSoOwNDy3edQ6Ljo0BPB5C6uK7ucmnLOcHoIF4Q9NYmv5MRsyC++BsORRBRVqmjnZF+Vz+v3nhuJ/72ANz+Fn/5RiDu1S0zGH4dHaPEhmP7lQ5WYFW/R3QiLK6KehCvWDi04K7X22wBf45avUIfFlce8xEVHqZAnR51NpGCgrTY9R3pj7xBoh4EoS92ShEsit+a3JJTqkJHRL6Ntx5ghZ5jJl2aFu57jeNDvVbpWue+HBmjvZCe1++ijF4N+F6SjgLdkU4yB8OOuJo+x1pYrCizNvFxxUsA+0ZfkGKvKQHhLJchm+4ltWF4SVyd9zuTd52FeIM1sCkdt/zBMb7c0jm48xWW44trmD//MCv66Bsa0fk3rlqmQClTLAUDBbI1BLGCuPWS9yPf4nEi970hmT6ynJTZAhOSa6XPUrAl71li6bV8xlfT2znpb4AXf7n5E/1j6bY7O0Bx2zrOv/gRWkxu31Phxx1PLE8DtZbXf4Be2uTiMtTbnTL1G0FtRPVuRrNkOPrfPnShE/M2knsLbJzJfnrrGtG90gRgT5za0rglXRocalNik4sqN+dhT5cmeXWOovWVXuiFn/ncgUnblztBHltiLpZhX1HL3DPKAu2ee8MGsBK52e5TsJg==</Encrypted>]]>
      &VoucherNumberLoading;
      &APVSetVoucherDefaultValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &APVSetVoucherDefaultValue;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bAU1aExzCN185HTaWw87fvittoEZBpN2oBaAC/2a1AnUe9nYIguTalERdLel/1UylHNH2z53sdnJXO9hQhj+Lo=</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dJgeUcGBXK6zcr2MH4Yp6dQE5CUfWxJ1aqyjnDiCVZy</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bKIhWweCxWZdCRwT1MjxMlqfKbKtWmGpCidRoPiue+jje0ayj22uSHgcmCXSA2OHgvyztP3r+p2Am8zpzQBZgtBsJ55kbARoCk7wDAxf0xxP6ExdbwGp3iJxo5LKHxG04eWJuIepH6cWioyFKpbup3XVzni3hIo3KzW5hFduBYi9YNlamNgezfq/3PjTYKW/o5OP/a0Hb9AuPeF2nsXzSYm8+6+upukRxFhqTPxftANbXKWabv9I2SVguQTm8sUiA==</Encrypted>]]>

      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtS4aLN9cilX/JX+cTK+0kHgze8NFdlqjoHUhhzhQjjWO572NJ2pTP88AfEd7nmQeI1/58VbTFwgbk3yZewAFrLaf65s4dVPSp5tjvZVBJOIgY3HmLFRrlaJExTE62m75tnKuVNHJYWFBns2OHlZxmHxqtwv/Xd/0KZ2CZlujB7Bo0DBDlKWa0zzeLOrilp5I3fKEDdLxDpJg/UNF8aFxoM29jGUYB6JQXFzh8HZR9I0vnhjW7kFWv2GeEB64Q3YJNYrlbECiWfZMIR0ahNcen3D39oikoTQlsIN9A5A8EpTg+PPPW9Gm3ErbRcA0WAWWx2YyGD6m0lt1gdb5+Vjj0GxALxSwPrxS4bGG803c7nl0Cg6O8wn27qG7fbLjLZhcwzKoyvuc2DSXN+CcE6UkGMQai//46AsLVuMb6cw0L1EG4StW6LivpFELYI3uuOvZJeUcYFpXKRTjZN3Iks8pHD7iMdq+8lkvMSJ3ne7sqixkSBE0SKTosXFbFyPNwnxALEE+vtw2BxXEvQo7cbrTUpuqsW6pFN1jcM71+HHxCogqTlXjlXgXZcfpHLSQ2MZ6elpj6K8yr1h2Ltvr57u6oTu9rBM/IEAzLg8QwB3Lh63M0WFhVHbw+RGggU5UI74Iq+y0QvsGgU9Vzea7ZRjevvgjdjQpmKz4bao6hSUghqrhSFVoWSKCY5gEw5aQ2BpoH8y+Dz5t+2Hn1WcpPy0UMgZLOQ7Dz01oc0f5ETN/Gkg6cM37H+yuwyX5ZV7nY5kU/GU5oO0CUvQQmBP21uqoJ54Fa6GacDfSdQKo5AOGd4T11eaF8+8tXwDHRLOba+YduQ==</Encrypted>]]>&APVWhenVoucherCopying;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWytGZEYA+8+fSsLrGP2IK7CM=</Encrypted>]]>
      &APVFunctionScript;
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

    <action id="Customer">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqapXv2dF/zPQRP5o3OalCwdTMH7NI5A8Zo5S5/oNISzpVZjha+jFW5cqyh5gpniuS/R9QuNoXJ39kLVtjsnzbqA/VoGeGB3mjJoBds4pYs4enpRfHsYihNPlHJF2ety+uhRy8CprYtg2ErDaz8C1v935vN5XGALTEQqUU7RLfLDbE=</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>

  &OutlineCss;
</dir>