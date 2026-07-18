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

  <!ENTITY APVController "DCApproval">
  <!ENTITY APVApprovalType "00630">
  <!ENTITY APVDetailTable "d52">
  <!ENTITY APVHisTable "a52$000000">
  <!ENTITY APVCheckCategory "case when @ma_dvcs = '' then @@unit else rtrim(@ma_dvcs) end + char(253) + rtrim(@ma_kh) + char(253) + rtrim(@tk) + char(253) + rtrim(@ma_nt) + char(253) + rtrim(@t_tt_nt)">
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

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCH6ZaCKB5FIZ12aJm+2Sn/QnL7K9AU/+eXeeCUIBr6LTbHeClwhan7hny77Lq31JlgBvDdJN5fDxIcvHyYWY3mg==FastBusiness.Encryption.End">
  

  <!ENTITY % PostNotifyApproval SYSTEM "..\Include\PostNotifyApprovalVoucher.ent">
  %PostNotifyApproval;
  <!ENTITY PostNotifyGroup "07">
  <!ENTITY PostNotifyCreate "exec rs_CreateNotifyDCTran @stt_rec, 'm52$$partition$current', 'd52$$partition$current', '#notifyContent'">

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.DCTran;
  %Extender.Ignore;
]>

<dir table="m52$000000" code="stt_rec" order="ngay_ct, so_ct" id="BPC" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="đề nghị chi tiền" e="Supplier Payment Request"></title>
  <partition table="c52$000000" prime="m52$" inquiry="i52$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
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

    <field name="dia_chi" defaultValue="''">
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
      <header v="Tài khoản có" e="Credit Account"></header>
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

    <field name="d52" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="146" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="DCDetail" row="1">
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
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế nt" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán nt" e="Total"></header>
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
    <view id="Dir" height="206" anchor="7" split="7">
      <item value="25, 75, 30, 70, 50, 187, 100, 8, 58, 42, 8, 100, 0, 0, 0"/>
      <item value="1010100-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk], [tk_ex]"/>
      <item value="1010000-10011: [dia_chi].Label, [dia_chi], [ngay_lct].Label, [ngay_lct], [ten_tk_ex]"/>
      <item value="1010000-10011: [dien_giai].Label, [dien_giai], [ngay_ct].Label, [ngay_ct], [stt_rec]"/>
      <item value="101100--11010: [loai_tt].Label, [loai_tt], [loai_tt].Description, [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="1010100-1100-: [tk].Label, [tk], [ten_tk%l], [status].Label, [status]"/>
      <item value="1010100-----1: [loai_ct].Label, [loai_ct], [ten_loai%l], [ma_dvcs]"/>

      <item value="1: [d52]" />

      &APVXMLViews;
      &ListView;
      &PostView;

      <item value="110--1-10-1---: [dong_tien_yn], [dong_tien_yn].Label, [t_tien].Label, [t_tien_nt], [t_tien]"/>
      <item value="-----1-10-1---: [t_thue].Label, [t_thue_nt], [t_thue]"/>
      <item value="-----1-10-11--: [t_tt].Label, [t_tt_nt], [t_tt], [cookie]"/>

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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxkW8sDrYa7jtl7JPjw97A4kf4yyll/zk4Ipgz7w9PC700XJUr//DBLtLUOcj3l0w+FlovKvUY1j7aNpQ7X/qol5kt4xVMVy92igGdfKs2/dR0BGZzi8DcnUiLku3MLyqvyFMOgqPhhH0APzSbuuayVg==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcB0T8Z9QBogqfgzg+rCy587YlLxd8PTIuxR0uSGENPMRf5pR7ZEltshjM6758vPFtiXLOFgrTvtK2F9ANFMR8lI=</Encrypted>]]>
        &ListDeclare;
        &AfterUpdate;
        &APVApprove;
        &APVMailApproveInsert;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
        &ListWarning;
        &ListCommand;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34IHlwt24I/MArn2WpObnAPdHhKaA4F+GsAEK+jiax8IJcTfcwlqfW0yhj18spOXK/41rwtH1gmlNPszzU6mHmech/O6yj4Y+QPuvGnQlheldA==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku/qTuSb10eLvB4XpM3d2RvKGclBky7P0abnAIpSCSWbZrfzyyLJAosq44v2ktW6ORSphkcIHnXAG7KX55rF/WyteQNGYROvWNjOO3w+CzhXM5ygQNyeVULUC9FLaJUPhhhwRxYUPJ64uHbKXG87bwz86+tfBQVuFiUNggeG9zeuGTjyD3ri0Kj7zFlOBSXGINiXTfoYdYnTXV48/Dk7+YSw=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bfwaoV4wl7JG7Yf8eFy4KENGB8rrO+at8GRtBVHQ+RzuElDqTNHLhMlU8UFtWwPFaNeVyaj9E79214oE2p7NXLsspnXcgV6ag496qLmYEOum22BusiFCOfWhZ9te0ZUx4w8KKOdnysD0NymcoFFDZdkYdqZXlkLp5f02+kRuIs2qHuSbhLNeJb/ajzAWizcNTnonIzCxA5QvUaSn0x/qPP0S1WqxitJujoFkjPADFdT</Encrypted>]]>
        &ListDeclare;
        &AfterUpdate;
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1OrfaLGdwr9Y9N0nwiyWVE1T6I/WU0nAkkBg8dJ18xt/z+XM/BwaIxXMldtf0j3ib4043UUEO0k8KXJxKdZPAo=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2EcC2Reti8lbzdZKpOM2XcPtyqfedDAKFTy0VepLk2E63hZJoAwpIY+oLxHyD+eZnlf6oIiIYDJ1ZtMsaJ6u4oDrzwajfSMtBOIJ95O+m2GTNpQVB0jHxB/GiXX6Npuj2/BSqj1sjL9jxkgb8ZKx+zu60v6BGux0aB/TtiUK5cndymu7R9B3OTJ3cn3MKO2+PZ2X2UIDKv44LJeMrxvHlkHWTmbSAqSgQhPl3rEs5Vh/8ZrMKkjAhAlvCIHFK7W43nwpY9siUvVb44UGvfCebWjmuUuPVf7IlW85oq2ISGyrBeWKD1enLs1J6vx1wSy4rB390oeoBX1StdfmM0c7ztYRUitRrPESps7oTXVzyMMXlCgid6prkvEtmCcPzzzXJc2Lmq95kJXRz6+aTwmj8ab1NfSg4aQu9GlE57mFAk5gi1tGEZNSBQG0soroKdzS5kuUcBAygJ3UXP1mURwxEisD1gBQPqWsTIUUXENZKFvNucPN0enErh19NW9z3tKTuqPG3BBAy81iNEi2uNMFVpnLeV5uqoHSlUz5MjWaebF7D6TM93UW92OiZ9oEjk33Iip8kARR+UfmJFqOwav7XtL/D32Sh67nMnnSTpYQv+TBqbO4V3Pyp6W/37WgTNDPUVw==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5Lpya5pYlEWWAacedGhSUOcnBVTepPq/RK0ZHcGx3vzmWllaktrR3ayTGRTqYfyAsr3y6NUQ/SSM6kMR3XW4HBooYbVAdvctE+8GLSKkiSttRbQ==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Y5stcl4LNQzljXPuBVsa2ok5CXLDAvEmM/6/MFkwqxQ/sf/v8CaTnEOoIzFG3UG6yf/04+79GX6wDV3I9DJIFj8uVct3icg9M4VGSUAgAbQ+H36tiNC8dZUosoFPQaB9m1stfVg8+yLJbpWRI5Ug983F7Jb+F198s9vmD+4L2WU</Encrypted>]]> &APVSetReadOnlyFields;
      &APVHandleStatus;
      &VoucherLogHandleStatus;
      &ListCreate;
      &PostCreate;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+YvVXuQEhKU1Ddtc5DLxSLg==</Encrypted>]]>&ScriptScatterVoucher;
      &APVSetReadOnlyFields;
      &VoucherLogHandleStatus;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WS5KX+Q+BeiR6pPmL5zKVpcm33CbYspUl2iSbOE17851TWgxRmgfnQKlvNRAdsTtQ==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WUdrEx4Ddkm0kC3THp0yucTBUHX/crFsAPa69JfUgkxScuHnBeF1ZnQy+Zmfjwh73gq5MZb2X8bqsE7m4Kb4Y5RmtZqdyY4fat0g+aikmKPHZkhajQD2Xille/2zS0Uij5JH81RPzHmyPxTdNOZKZ2x5MnkJuSCfwExqZv/O4eDlu24YkSMW/s7rR7fLZp3xw==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezpJ7eV6C/oRWDApXWTgkAdHuziDVBeLTVJnA1GrQmCBig+3eMsdP1nfVS1KtkxTDdRom5+cGiqWf8zCJN69S9L0uK9eaKs+CzPSbF0ZH2vt4=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwCxcYd2J0gZdsN1luN6RXiMwfzBe5KdsEX3N8ILCJPOTZZktorxqif7gv5nD/tr0+egoTyarxLa6qElRGJ1QNkj7clP9SXWHBJTDx/wxT5P6rCY4pQb1KfG/1vMTftIvygQZFkyhQL9K7n7Geyq4fc/Q4otu4C+76i1eZdRFpiAVRtEm2L8kiEBI27Y1gkiQ==</Encrypted>]]>&APVAddStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KApgGJvPb1DW+53xCFh87q4Cts1wNIpklhNvYvCE8W6oN+MfPqjdHIErI3jRIkO06ywAi1SCQeGTnocLNxcD+0A==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7BvHCz6LZw5zw3oF/HOmTHAnY8XR4+qIMMy2qeLQBfOnpwttoPoh3UfIA8ORZE4WSEg4Q7NMy2PD2MK0/G34BaQDH0/Ge1NQycqoQxz7wbPrbbXrea4jgYvBYUqBVBcy4pDDWSO8ULu29kXHbIn/91aUm3Oq2DePWDNB+CnueH1NajUf6St3W5QjBT3s89nNKiWKaguTk6Q1EUjnQIwkO2D2wUfLLs2BqBwlUCSpOKvtDEGNUfnGd6r8DK5vnW82eoIbqqky6tw6+FfgSSN/z7vYdtIrYanYl0sKds6aW/munc/Ho2CO4JH9T7G7UJ3CEPM2zrpJdlYOAV1MA84Q+4xga8V34eHQzLPFOxdt8nSVEGYIeKj+Id3bT1XdwNESuU6jie819qzLFzuL1DZXeLICdcHjpmulj63q5mMcgsiSkuJ8PfVSprkFQvU9W+uKHBEc7z2YsMVmEXxMFtSohpeE1VEOtDvB6gJwrUbjyBTKjZl61Z8ETmlZosw5Yh2rTUziuFwjD0jRug84yqmmMSck/SQPqkdZu9FYM1JeM/bZuoyNAvDXfPAQIwElNatzMFXFjDXbT+2jT31o9Avk35j/7bgLHoJvzegDRblU6AXOvONNhXcPeZStYxfCKnZnfOYVJ62FRewTXso7EcDq7UVfQJdvPO+jpve1x+moK84Xy7ifxTtXgxv5DmnLHxOlH5rzEBH1OzUpPddh6ClKF+Kk4cYMTQFgkZQnx8LQdn7iABsWZVRcT4ZnKvQXUPT6wBip21yg8ZOjd9jKSRkQrFyDSk7LlJEhRQ/xPtjH0C/3G+fJTcoaYQR3zDCFkAc1zs=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UuA/TaprI5bZfQQ/n3Voe7UqnvAf6GMlru2UPsktsgZxoleE9qPZK2kI+Xya5N0yrAnyUqFMbAoqMprubQ9WPxh8ZAdki4UA3Mit0lnbZRZPyqghFlS8i1l36cuBPlqCWiwOBlL2EKtzlL3GQEvlrg=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6EHefn2QMKuKKJPQcG/URqpyFqpeqboTmw5axERgN3+fhxIanO/AAGIgj9iO0gbekUIC4TtiKB6UdCP+zXmU6lG7gvzf2fSoOwNDy3edQ6Ljo0BPB5C6uK7ucmnLOcHoIF4Q9NYmv5MRsyC++BsORROxhBAxOL7OI27U7MI532hVK56I0oeiCWy/ly7WXUN+iTiCuO+ucOcLlbZsKQWu3YuliLuJTZ9W1ZJpymwk8PhZhqkvF9oIwq4M57qcUMMMg4uR4NE2csqXYQ5DA3DDOAl8gGt4aX+9eldpjBqrdPbHWFoh+soqjJYf02LSJ+PArdWO1PeyEEg1FBmSFN9oy0vlwKYQjzOqd6sL711z4YUYfhzuMcpczmbisBfP/fAi8kYL2QTibI/DvfzJD8TgERZYQLLKIoYmqsbSMDivmmYkbxiwzhTPFpVzHfw2FcHY24Zobe8PEMvpZLWza6w4dnqOoksQb2J4LIhrtmte2qppPRTZYEukjfYRjDD4scyyn0tls3qeyWvD/eHsg1cHEfRkY3pLcLLgD7Jl+IgCaOg/2O9Mu83GMFsgV8yyUY9WggqNjxG2tbiGvpp9vzBOoacDkBsgoEt4SUEj5AY1EbRqZIKENJt40dQKOqRhyMrqukXETVKJ7bnxEkSLhMZ1mlipWz8CBbv/Mk18uZp9OSW8HTbaUSMROm3EPI1DVFRqrP34IDWFOQ4iyL8IjaX8jeA==</Encrypted>]]>
      &VoucherNumberLoading;
      &APVSetVoucherDefaultValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &APVSetVoucherDefaultValue;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bAU1aExzCN185HTaWw87fvittoEZBpN2oBaAC/2a1AnUe9nYIguTalERdLel/1UylHNH2z53sdnJXO9hQhj+Lo=</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      &ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dJgeUcGBXK6zcr2MH4Yp6dQE5CUfWxJ1aqyjnDiCVZy</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bKIhWweCxWZdCRwT1MjxMlqfKbKtWmGpCidRoPiue+jje0ayj22uSHgcmCXSA2OHgvyztP3r+p2Am8zpzQBZgtBsJ55kbARoCk7wDAxf0xxP6ExdbwGp3iJxo5LKHxG04eWJuIepH6cWioyFKpbup3XVzni3hIo3KzW5hFduBYi9YNlamNgezfq/3PjTYKW/o5OP/a0Hb9AuPeF2nsXzSbaldV0KaBK+KhSJgg3GZw7m0y415i9BxSOZZGdX1Ub4is4ScyoHo6OyYn67Ek1rMO3sksRrMifW2r/dFSPrpICRfb6H5S6z4G0sXwE0VCy8Ar9S4Dv9eFHcfdL6FbfFBQgMI9l2RhWF74RC85/2c50Y6TMAY3/DCap/YNFtPC1MDP5AsvS+y9nc6LODRTPzKFmv9KhqyeGjNlStaP6o0UEFwjSXtzP6qShTXAsGHp40T/03ctFuk9JIcsHqqpseTeRjGnthwuaVzFPDmgBvHDza3DrMn2dTIJ1fs05cLIIAHzd0zYPhjb90bpw95Jt31Hk1Nj98Mot7/9LdqEof6l/Coo1bwUeU3HKhob/WCk+c0UdeFjfL6CX/cnGEM8WKCpM+iw877F+vNeItusmoC5hH7WZdolfHOxfefgrORIzm2H73zoE5eHBi27sm3qmH2eR6tNpqNnrErCPUwcYBatUEquLRkcP+ZU5TL7UC3tchAnKugcDdDrZABNrGKs/MDZo6+7yoc0WtEXjlj0Wj/RHuwTWU4N/VKt92ImATn1JqafG7QUTAEDq5OJ8JxnQDy9nV4hdPTx+g1fO2DKdDUq5U45LvNSFWJHogitVI88WQi7LItNhN9p5/uKnn8/5apQOOsdwr+fTnN1pOu3HPuCxD4seAWJGgE1SQa7s/XHkLn1ERni1Ux0EODxm+aQOSbr2GKsxc+A9Sfy23D3VhWfg4qBsYmwt+c728WCQJMA0+CiY18TGjNKeK9MlIEQnlwN1T6xKpzLWc3M11bPdr+3dbcS6BnNP1Z/NyOejbXe6Mg/IILOg4R0c6lSDGNQH+nrevLr+TBHow56LV/0rukyGZIUNX/4S6vwR7/bruuVrKSH2FM4bO4/BuQZhgQPq0AM0fUKDK0vj553oQf3rKCwbk+70cb5IiVo9RE17AQQV9nmR2ES7awZxRceXKX6RE9y6wvXSpNgwVQHIUaZ6TpgLrxATJ1EqFlh4EcIyyVqYp33tcqjr05Xp/Otg2JYxheI=</Encrypted>]]>&APVWhenVoucherCopying;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22TgUTPZ2dcLCXC0JLs+ueAI=</Encrypted>]]>
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