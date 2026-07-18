<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenStockCopying.xml">
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
  <!ENTITY CommandCheckLockedDate SYSTEM "..\Include\Command\CheckClosingDate.txt">
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
  <!ENTITY CommandGetTaxRate SYSTEM "..\Include\Command\GetCreditTaxRate.txt">
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

  
  <!ENTITY h "FastBusiness.Encryption.Begin$uLc6/Bny5UrSIRuDTGst3RhjyhdgZ8m2tzuUiSXT0Ngk7EQ8UntH7utGhmDFK02cDJ5r9W7dgfZwlRUa93NXjc4L6WmpAvezVDvT87F3XwfRLeCkEHvWzZ92pR3unTwn0vCXtJxhdOSsq4kgbZ88s+DxEBvNidMdvVsTU9goOW98A1S/5199GPWxzBeKu1l/RjUHaCkSvTynK530YveBDA==FastBusiness.Encryption.End">

  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7YzMz6bkci7muntn/WJCBWipVOhHSIpkwt2yvxCTOrgmZ88uq9AAgNIZD3KkZxHBmfHRzPOS5yO52x70EUxzS8lGC39QYBxUXOwQv2ULLCgw==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1Dbidi6qiVlgTztw2W7dKsgHZA1N6SXRtF8uzzewhxO4Ns7FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1Dbiatum2UulAfPhUyXRK1/cIPzym3xFuTgdqsEWhEnKZQ6HQ+nvumk5zxQMFzL5e6zf66qIm+GkCWUFi3D0BxqfSRaXWO5hQmq5uAj4XVX4Vf+qgfiLJdIhzdgC5ZNw7s7EdW3OtOiWifjxArXpTDg5eAzN+FkpSiSqOqjlyiMZXN2FastBusiness.Encryption.End">
  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7YzMz6bkci7muntn/WJCBW6UphOoPYqDEj/m0+pSuxopSHPtxaO5LQu4cPrHb9tXT6FUovAslCzU/lkIbr7bGiZNpb0AzLZ0tfju/MEUWTAg==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1Dbidi6qiVlgTztw2W7dKsgHZA1N6SXRtF8uzzewhxO4Ns7FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1Dbibt0nBBWa789CAbuwPJDTMNDlUoP6RSdJcFur2Edtl4OFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$AQX6qKaRp9pprz6TiKdW/Fjpqw6BlAQa6C4+bMYHpd/IckzYnpEleL0T8uO8za/2mwLMlIKa/dOs+Puv8SlUM79aZR5Afx0V9tYOo1LtH3+b1DusXGkLS9HdtWrrUuuFaHcrs9ZdxeYPTiSluHCl7B9uxOPClJLnIO/mutVo/VQ=FastBusiness.Encryption.End">

  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpC5ezLvfExbKfP6OAhDXOYtYRgxopY7YYsm6Rhi1/vxWDrNWTM8XENr1aThfIYb9YwjjTdygSNtU5b2dbxYltnpzd8eXJ5E2+E3Ih4gyIvrp4Z4Gc4qraHsNfXe1xxzfnzgFFZXyPqlOMF59fwt2BpWfRcj9y4KwjOg/vKXHdD9iAjsdLw0weKyeCGQs42tVlGvCBc/ewv5F9EUWqeNneOdw==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$JFAg3c674j2f8bRB56rmcNX4oNt0O+KRVE3qROL8A1GAMXKwzvc9ZCAcnYGsn16DP+SKAfJF/TjuJV5OlGKRRnc/T5NDDSclkcu+mpJuVBuznzjYw9moAv8recQCcWzY9NVSnzLQf6m9x8E0NIMpjYLxMnNZ77yI6lBGpcmk1ng=FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$7BiIvmN/gj6ARfl6W+FQ8mzmmbCdGN7cQ3Mnhdebj7DFPO6kNLfZwlayGZwkGiS4FastBusiness.Encryption.End">
  

  <!ENTITY APVController "ImportPurchaseOrder">
  <!ENTITY APVApprovalType "2">
  <!ENTITY APVDetailTable "d95">
  <!ENTITY APVHisTable "a95$000000">
  <!ENTITY APVStatusNoAction "0">
  <!ENTITY APVStatusOpen "1">
  <!ENTITY APVStatusApprove "2">
  <!ENTITY APVStatusClose "5">
  <!ENTITY APVStatusPending "9">
  <!ENTITY APVCategoryIndex "18">
  <!ENTITY APVVisibleStatusNum "3">
  <!ENTITY APVHiddenStatusNum "4">
  <!ENTITY APVPOType "2">
  <!ENTITY APVSetVoucherDefaultValue SYSTEM "..\Include\Javascript\APVSetVoucherDefaultValue.txt">
  <!ENTITY APVHandleStatus SYSTEM "..\Include\Javascript\APVHandleStatus.txt">
  <!ENTITY APVAddStatus SYSTEM "..\Include\Javascript\APVAddStatus.txt">
  <!ENTITY APVFunctionScript SYSTEM "..\Include\Javascript\APVFunctionScript.txt">
  <!ENTITY % POApproval SYSTEM "..\Include\POApproval.ent">
  %POApproval;

  <!ENTITY % PostNotifyApproval SYSTEM "..\Include\PostNotifyApprovalVoucher.ent">
  %PostNotifyApproval;
  <!ENTITY PostNotifyGroup "04">
  <!ENTITY PostNotifyCreate "exec rs_CreateNotifyPITran @stt_rec, 'm95$$partition$current', 'd95$$partition$current', '#notifyContent'">

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.PITran;
  %Extender.Ignore;
]>

<dir table="m95$000000" code="stt_rec" order="ngay_ct, so_ct" id="PO2" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="đơn hàng nhập khẩu" e="Import Purchase Order"></title>
  <partition table="c95$000000" prime="m95$" inquiry="i95$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Mã giao dịch" e="Transaction"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="(edition = '0' or edition = '1') and ma_ct = @@id" check="(edition = '0' or edition = '1') and ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7k5O5X+wgEC1J/rtYldscXTB4hHMYKzspHSFOBmRtnKF+RHaq5+6oXfSG0AcrOfsU=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
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
    <field name="so_hd1" disabled="true" dataFormatString="@upperCaseFormat" external="true" defaultValue="''" align="right" allowContain="true">
      <header v="Số hợp đồng" e="Blanket Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct3" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="ma_tt">
      <header v="Mã thanh toán" e="Debit Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số đơn hàng" e="Order Number"></header>
      <items style="Mask"/>
    </field>

    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Order Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb568WENPdSisqRaQDoUqJSO2hkHW4E2dtclFcoV51th7w==</Encrypted>]]></clientScript>
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
          <text v="1. Chờ duyệt" e="1. Open"/>
        </item>
        <item value="2">
          <text v="2. Duyệt" e="2. Approve"/>
        </item>
        <item value="3">
          <text v="3. Đang nhận hàng" e="3. Receiving"/>
        </item>
        <item value="4">
          <text v="4. Hoàn thành" e="4. Completed"/>
        </item>
        <item value="5">
          <text v="5. Đóng" e="5. Close"/>
        </item>
        <item value="9">
          <text v="9. Đang duyệt" e="9. Pending"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d95" external="true" clientDefault="0" defaultValue="0" rows="&PIGridHeight;" allowNulls="false" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="PIDetail" row="1">
        <item value="ForeignKey">
          <text v="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="ma_dc" defaultValue="''" categoryIndex="2">
      <header v="Nơi nhận" e="Ship-to"></header>
      <items style="AutoComplete" controller="ReceivingAddress" reference="ten_dc%l" key="(not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID)) and status = 1" check="(not exists(select 1 from syssiterights where user_id = @@userID) or ma_kho in (select ma_kho from syssiterights where user_id = @@userID))" information="ma_dc$dmdc.ten_dc%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4E/rPdwvu7dDgwZfFlZ+PTe1pHYR9oJvo6yvbF/95D0g==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_dc%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho0" defaultValue="''" categoryIndex="2" disabled="true">
      <header v="Kho nhận" e="Receiving Site"></header>
    </field>
    <field name="ten_kho" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>
    <field name="ma_htvc" defaultValue="''" categoryIndex="2">
      <header v="H.thức v.chuyển" e="Ship via"></header>
      <items style="AutoComplete" controller="ShipViaCode" reference="ten_htvc%l" key="status = '1'" check="1=1" information="ma_htvc$dmhtvc.ten_htvc%l"/>
    </field>
    <field name="ten_htvc%l" readOnly="true" external="true" defaultValue="''" categoryIndex="2">
      <header v="" e=""></header>
    </field>

    <field name="nha_cung_cap" external="true" defaultValue="''" disabled="true" maxLength="-106" allowContain="true" categoryIndex="3">
      <header v="Tên nhà cung cấp" e="Supplier Name"></header>
    </field>
    <field name="dia_chi" external="true" defaultValue="''" disabled="true" maxLength="-106" allowContain="true" categoryIndex="3">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="dien_thoai" external="true" defaultValue="''" disabled="true" categoryIndex="3">
      <header v="Điện thoại" e="Telephone"></header>
    </field>
    <field name="fax" external="true" defaultValue="''" disabled="true" categoryIndex="3">
      <header v="Gửi bản sao &lt;span class=&quot;LabelDescription&quot;&gt;(Fax)&lt;/span&gt;" e="Fax Number"></header>
    </field>

    <field name="ngay_hd1" type="DateTime" disabled="true" dataFormatString="@datetimeFormat" align="left" external="true" defaultValue="''" categoryIndex="18">
      <header v="Ngày hợp đồng" e="Blanket Date"></header>
    </field>
    <field name="ngay_hl1" type="DateTime" disabled="true" dataFormatString="@datetimeFormat" align="left" external="true" defaultValue="''" categoryIndex="18">
      <header v="Ngày hiệu lực" e="Effective Date"></header>
    </field>
    <field name="status1" disabled="true" external="true" defaultValue="''" categoryIndex="18">
      <header v="Trạng thái" e="Status"></header>
    </field>
    <field name="ma_nv" defaultValue="''" categoryIndex="18">
      <header v="Nhân viên mua" e="Purchase Employee"></header>
      <items style="AutoComplete" controller="PurchaseEmployee" reference="ten_nvmh%l" key="status = '1'" check="1=1" information="ma_nvmh$dmnvmh.ten_nvmh%l"/>
    </field>
    <field name="ten_nvmh%l" readOnly="true" external="true" defaultValue="''" categoryIndex="18">
      <header v="" e=""></header>
    </field>

    <field name="t_cp_vc_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18">
      <header v="Cp vc ước tính" e="Freight Charge"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4KIwiQ1afFSybOFiYb31DIaM+X0OsQsHH+OXke3JHm1g==</Encrypted>]]></clientScript>
    </field>
    <field name="t_cp_vc" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb76y1rZNcYJx5xUt+1koGUI1ftcH2B5qHN0CfPCAMRY2A==</Encrypted>]]></clientScript>
    </field>
    <field name="t_cp_bh_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18">
      <header v="Cp bh ước tính" e="Insurance Charge"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4iqRdtNPp/+954R5/YascfRhoXFALMugTfx6NTySLL1Q==</Encrypted>]]></clientScript>
    </field>
    <field name="t_cp_bh" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb76y1rZNcYJx5xUt+1koGUI1ftcH2B5qHN0CfPCAMRY2A==</Encrypted>]]></clientScript>
    </field>
    <field name="t_cp_khac_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18">
      <header v="Cp khác ước tính" e="Others"></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb5qSN98VdwDA9KoZ4YZiTP95WbBAQfSHjkmO/7DeXAzPA==</Encrypted>]]></clientScript>
    </field>
    <field name="t_cp_khac" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="18">
      <header v="" e=""></header>
      <items style="Numeric"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb76y1rZNcYJx5xUt+1koGUI1ftcH2B5qHN0CfPCAMRY2A==</Encrypted>]]></clientScript>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
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
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Thuế gtgt" e="VAT Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
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
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    &ListField;
    &PostField;
    &APVXMLFields;
  </fields>

  <views>
    <view id="Dir" height="&PIDirHeight;" anchor="10" split="10">
      <item value="100, 30, 70, 121, 8, 58, 42, 8, 100, 0, 8, 58, 42, 8, 100, 0"/>
      <item value="1101000000-10011: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="1101000000-1001: [ma_gd].Label, [ma_gd], [ten_gd%l], [ngay_lct].Label, [ngay_lct]"/>
      <item value="1101000000-11011: [ma_tt].Label, [ma_tt], [ten_tt%l], [ty_gia].Label, [ma_nt], [ty_gia], [loai_ct]"/>

      <item value="1: [d95]"/>

      <item value="1110: [ma_dc].Label, [ma_dc], [ten_dc%l]"/>
      <item value="1110: [ma_kho0].Label, [ma_kho0], [ten_kho]"/>
      <item value="1110: [ma_htvc].Label, [ma_htvc], [ten_htvc%l]"/>

      <item value="110000000: [nha_cung_cap].Label, [nha_cung_cap]"/>
      <item value="110000000: [dia_chi].Label, [dia_chi]"/>
      <item value="110000000: [dien_thoai].Label, [dien_thoai]"/>
      <item value="110000000: [fax].Label, [fax]"/>

      &ListView;
      &PostView;
      &APVPOXMLViews;

      <item value="111: [t_cp_vc_nt].Label, [t_cp_vc_nt], [t_cp_vc]"/>
      <item value="111------: [t_cp_bh_nt].Label, [t_cp_bh_nt], [t_cp_bh]"/>
      <item value="111: [t_cp_khac_nt].Label, [t_cp_khac_nt], [t_cp_khac]"/>

      <item value="110-1-10--1-10-1: [t_tien_nt].Label, [t_so_luong], [t_tien_nt], [t_tien], [t_nk_nt].Label, [t_nk_nt], [t_nk]"/>
      <item value="-10-1-10--1-10-1: [t_cp_nt].Label, [t_cp_nt], [t_cp], [t_ttdb_nt].Label, [t_ttdb_nt], [t_ttdb]"/>
      <item value="----------1-10-1: [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="----------1-10-1: [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>


      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="100, 100, 100, 453" anchor="3">
          <header v="Thông tin giao hàng" e="Shipping Information"/>
        </category>
        <category index="3" columns="100, 30, 70, 121, 8, 58, 42, 8, 100, 8, 58, 42, 8, 100" anchor="2">
          <header v="Thông tin nhà cung cấp" e="Supplier Information"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="18" columns="100, 100, 100, 237, 8, 58, 42, 8, 100" anchor="4">
          <header v="Khác" e="Other"/>
        </category>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>&CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafSZKoXBsqMxMCcm/GnJvZS6Jw+L9o3i8vlXtpYszKcxmiq/zYMyXuyFs4NHmVv8A/A==</Encrypted>]]>
        &CommandGetTaxRate;
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
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ06nEkqBGDHjqhQz+EDEAC8iPLrM8ZMEvx/5l3ld0HRtHjrxigFgz1UnUPG4701z/IGKYTgr38DQPZvX8WMIzIKRUQs3/XV6WbZPTnK2u19cR2jpRC84lGQhwkkkiVi3e2zupBibOVWxgayZB64EMtq4=</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ04oJL3Q5VsX6SpAphUM2knezxULBxoXFye538MINAv7VWuefN0RdqDNL6p+BcxqWx6c5CXZ79svam3Zrjxxc/et+EIqoelMiD1hYDp+LSTIullSC624zQkP7aK90/ErrZA==</Encrypted>]]>
        &CommandExternalFieldSet;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5sW+kp4MK11X55maSgW6tBTVwe8MoKP80F6wBzYy4nkHW2q8Hw0xduG1I+1TY4LKby5jaXCuY74wKx5xBciTjd+MdodgDdEEIZer8y9ZZ3r6/bkt35Juhlh8LgxBmANg/OezO4q4X2F3oXQr2WVbbePIsSZ6JmiRz7xwS/zhPAFmEx7/RGQ34gpQ0wVM46QEM9mP8GOpgHyejISt+3ftJg3/deLsU5esRpXqXUG657BkKxKqqACH8O+f1e9QWaD08fO4dzM4WEiynIiXjp5is+kL84YP4GYxAh+5eV/AKjYjP1Z9YLiRz/4uh19bdLDzIrNclsjxYDeOAo8uTv38Wxq75CecG99BrLr0rEJ+A+7opcVJ2IzUUCglpeXIFHeH72Sj1c0yhE2HzO+Cat9OTzGI6kTrFZ22LANJpvbuyZr9jcJ2z+Y/VqE2N/al2Vb1yXZp5dvq9sx4KqulWIm2OEsToKMZIrSKsTqwR6MpcpA4JE9IJLyi/Fcaw/3/D9G8mw9kKw6r3hElu4XNtO2TORsktyZlS86+Ct8OBco8ZStqDPYXL+h1W2UZAOmAIV50nWkdBZ8FePECHlkgkDuzztohCYxuTtV8X1Jqfk7H8Ih7TdOEIVMCUtCr5VF8R5yu2HwIzhhzGwJQEW7sv9/NW0=</Encrypted>]]>&APVInitExternalFieldsDeclare;
        &CommandExternalFieldQuery;&h;&APVInitExternalFieldsSelectWithComma;<![CDATA[<Encrypted>&lINH+XMTqchgmlsJjGeZ5AKAw9c3UFooEwlECRp/GSBdL+q0MqVmYh5qqori5Qf55SfH/AKlP7o6yaqAvop2x/PwG/bRSoRdGcn4c/xIpic=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24AsnO52tgO4TVoZ/WwwYkTHGABd+NiUv1V4S7UvfWKOhAWsVWFrcSqXRiDq9pEN332Pdrgx5PzDV6zZ8h4tJd5FNY</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcB6o8s27JJQaLYO3xUVxXIHxXOvZF5Np6A1diru8+MJ/U7gfMp3/pTFdqCMpFRq/MGhDl+f/r4PRcDH6io5ooFc=</Encrypted>]]>
        &AfterUpdate;
        &Post;
        &PIAfterVoucherUpdate;
        <![CDATA[<Encrypted>&Er6kBCOukK5FxLFOw1tnB8I/3UF6nW9jF2yNn7MDyVT5tWJoqge7BrB+B/5gu4pm4K9YYUIV1hWCDgWkdN071BouYdC3Eyl4Bk/rWv9VfrmyfM41aHdiOQMH3t8wxl5/</Encrypted>]]>
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &APVApprove;
        &APVMailApproveInsert;
        &PostInserted;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05bww1DwCx6t1rrcU3se34LBQzKQN4KcYrc+EJIXzDXMcnHKF7tmNTfh0N6MUcu72yoLYU3jgI3wqjIDOOV8gbMdvFu8DParSJXqjllHZA3f</Encrypted>]]>
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
        &PIBeforeVoucherUpdate;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8ekuyyWtXWsRBC3M/lRVKMGlb0tTZjTBiaMltJefTykyN4yO9ish7a+rq6ksWRhKjOgQiCdjnZr9FtX2HMtjyHJ4cnUDrx+1L7e7cLP65/fRPZwUtkA14XoAFIe1h7jLRn6ujPND2FQlHlZPCzeRBET6FWFEGN6McBNziS0sPpomJvQpKzudS6d22Qm+onHg+xcVZd7ix0NWl1sIQmgoyP33ts=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QWqO4D6MlB1wX5CZjEswUbjlqGksIjkKkURW7JDGmkmqaicizEaN08pC2yFDYyVGrJEjhNPg92mNBjBMAxiJ1K829P2LUs9voChLh+MWFmourRqmZjFo874hDX35bQzrWRom1YFsq9iwQJCU3563KL7e2blLVrHVLpKkB2dbb8bIv5Rk2Z8RwSlnLXa6Yk7QfqN93yuyyPt9WD7zpCjjxvmET5pLvI43YSbAC0rj3ae</Encrypted>]]>
        &AfterUpdate;
        &Post;
        &PIAfterVoucherUpdate;
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &APVApprove;
        &APVMailApproveUpdate;
        &EndUpdatedVoucherNumber;
        &ListQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ04YeFCuahZYGQRylWbgLHOwqWK4QsakMDmg4ogMtoGRy8eRx5C8buvtMFTQkkoVNRg==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>
        &APVDelete;
        &PIBeforeVoucherUpdate;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4oyXg+AirMdeqIbok9A/sagEs0xqXf50Xxilz7u1zF+JwMNACC1YM1c8JsqE6vMmm+PdxSFbpsvk5KzSHW7X9w=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkABKp3OExyVXcLzlU+B1tC5Nptit1HLFQpPGl8WS2yq9fmZwYvADZBphxyXeYxq8POGf0aTxDA5NNrXZ7F1E+H7GZxxQmxmS0O1Ve13LJeulZn6+5il2gf/G577FQ+dKbO7HqeXZkUfBkXNpJVjhLS4MSYRVuB3wGMVhW55YY/L0S5uJ40ASHH1VUQ21nUnN7nwh8ctnTmGnR4FV2yz3CqgjoDzJ4pePYLS+FuXWSjtb+EnagJLlWds7yP0MmPw2ubVsRy8I3YiiWzyGb/ZBGARypN9czIxWeYx2en7o4t5kpuxs6asj7jz/PqWw/2cyDGRNOYL+HXy/Phvw+DNDuAYWlLbQIO2NSBfYilvUOZBUvnmlxjPpMvkY41ODQWKgC+0nsSfWXADAfGjP0r1l52Ee6LgdK86xylN8XoaCjJKtgmGQtSzGDlFknoCEFSgKLsOGLVpd/U5L0y4cTMCqCMr7zv3N7h9F4hvZ68IpZJv3m7VvZNheBf8Ubl2kxCSJP29BMDnqbsv+W3TjIrJZvm3cAmUjg3c0Woud5+aKd4DgGEu+cWtEFjOu+4xJMQXblmgwdzB46VoIsei7lDUeWmAOtJfvE42DnRY5sn+/ovY1V3DITjKk3FAJ86n8cT+RkVbbYNlD0TzL+vUIuSHuYvC+vvbrlJ8IoQ0pHTcKsUzU8sikeHWlm744+Ie7+dD1Zhy0mj8e77QThjy71n7gX4f+ut0B+3sQNJFm+KumFXfDZzbg287sm8QHKRls2ryGr1lwskIfq4irH+rRL75D8nURCWitAz6iqxzThvA7botjjfqUvZgy8+JMm9/pCvzMEpS1bN2MzmK30ZOXtrwDfjoXwJ1Za5eTE7rvIq1px7fBwN9FzNNSFekhNPUJl/6oE67Co3QUQxezMtTzI22gIJxtyhtafOPvtB4/TI7K/K3iHFxX+cVXntMMOOr4xNyA6SGHMTA24P7l9n+TkVp2RFFAb8AardGe/oQCfViAZkvI0n+1lnAa3aqmEEEwJuoyaOLZwoCoyr7OuEsIxIdyJmKbsKXN4U2GkBN8gKwRYiXkbqH2CFNyKcUpgkew1Dd7xWfgOEPgrLRZsSJBhDu7LvIZQtQlMrSyn1pg1CBBRDVvRsbwrSfMcQ6c6utBc3H6Hn7cMZFbBk2Ho07Ptp9w6Z6nPGRpAHJoBmPPZj/EQ49CCi9muV969qUrovxZgLnMAG978NnHZLeRp6lnB7IFPApCn3oAPTp3Q8ysBRXB8gxToCU/lTuis7Tls9/BVXVLC2JI5NuaAheb1uggNICCS/zJLaT6lUsdHQue2XPYrj5eG5UNG+TVXhBy9eTZw+ozj2SLViceMLdGpQQS1k78AN4okmEMhBhNaY6ru/yWUqko2I964I7tosMsBqgbqE8fypNAMeo/BmrfwgmtzlByklLlL6lWQwQSuoB3RsjOMy/FHfMi6TX+W59Y5SsVUyRNPTTpXpOGs7TURV02Bhy8FJy8sQBVr6WKD1QymFKrm6FJOK29s58AIsAepo5HLNXmck=</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5Lpya5pYlEWWAacedGhSUOcnBzhfm6nzKORfUzKv201cW6jl/FmlybIcfGvAuN3l0IR3RWRzC1/mf3443p57/LAljrLg4nytmJB+8HUug5wJkVA==</Encrypted>]]>&ScriptActiveVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxc8dIOvG5YwYi5EbMhrCFqB4Y1aY8Z70nBqFnYia2tP7XDQQQ2id4SdTi4SSmzv9i0FmPGarqAkOJNqpPUB/GRxgZRIiZZMK9dwBq6cdXpp8KLDjVbj2N00gFmJdTIDdmZjl5s7ivXb25eh7LcAz3vi</Encrypted>]]>
      &ListCreate;
      &PostCreate;
      &APVSetReadOnlyFields;
      &APVHandleStatus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>
      &ScriptScatterVoucher;
      &APVSetReadOnlyFields;
      &VoucherLogHandleStatus;  <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cFrDGACHYgJlTs+aCgSnkfLqP7ri8S6rRulNevVLou5L3pIbVN8b6/BzG69+X3PLxRePHQCY17CJdKbYfDm+yTqOrEGVrRsykj6qTqM+M31JGlLtMA7tk/cyJFjCp02HzL+nxM9yjGGfvrC2jgozpQ=</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtMtU37LUaItVAxKgVUWU77RPCA2veb81Rc1NKP9GdZVdDa6Uta+s1kNpxXQxo0WVGpAHAR66b3rfzk2PTDRj7oeMAJi99Qj2VBbdiAVb6PhJH88kRflRLr4/xI8C0Vh0npXfxKDFXQ7WNrGwV/3vbYE/dzrO2Jg4AjLKlHgrQt8SXBC3OJ8lc+rAOxaBu7I0Z</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UkyML8OU9Vm+C05wYc54p6z6L6KitpBA61nxTxkORMtF3hTD7th5MHrh8wMLdOt69FWkIo9K63pJNMNrabLaHGfD7XYHEq2DHqfv7Xxr1ulF7DUf9lWWoBOZtq2dfXaC9Qp79/lul/Kr91uvKcHVJ0=</Encrypted>]]>
      &APVAddStatus;
      &VoucherLogHandleStatusExplore;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QEAUk/EKgKcaijFMxLq3AY5+Bcn2EZj5lMgHJyhGT7ujPXSbcy1AFbfmQcNT9egK+8wBVOw9HiFcIktkgJbeGZmYE8Hpkx4GjtpBj0RuOsxHPur1OsBTZvd/cNxAY5u4A5IP0StPw25DXB0k4PFUP4SaQbTeP05P8fuNWzEhagPoj1M0EA8kTqmNyJntekFSdvtS4ZOPTrJTF7Ddb219pk/iCEF+pJQx6UGy7p+0b9mIGRFNtoLVtuyRWZrMJJ1bC0BD53rdAUC46Is3pwkRG7hG98Yc/oA7zloxO9BsO4KQz/qvPwE8FXf/TCIoqQkX2Ru76AysUgCwB29JRGUB2yansg0gq/nMtNnKrt4kAzYIGQk0Dfi7QuvYQOcq+aHo6c6de0vHbp8xInvk+CKKO0tHn5wkQk0lm94h4aQMAbIXZBcUI2sr0CxU42p/ngLNjSlNbqP2LvfTey9xTkU3+0I5bXgVjRtl6ZzkCxEJb5CD5v3QbZklIjfWecxYwXFAc4alSkXAOUzTNZNtmNvXVjljg/IVamcefLrUPNB/yjYGQjlRULMBEP0/e49HVRKfLT5xsuL85PdHqvvLSUcKQJjVQ/D+dry8ovao1BcfDzJ2iB8t6ROeq3EGDqXolp5+Q3HalR5sla5qjGf8fl9z9knPxh6pgxABmKoBbDgMigaCR1RNbyEkdywxSP69D/0sX0cPYvPjNQ6dlC9mgwyGLo=</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOr2MLY2bYw4Flxo4jU5Y2bgoZ8ED3VMSJbVnJrC7+hOi17+nJSL2S3/N2KnX490Hr4YMorCcMNju/e8KI0gHdRIwU0dbBYLgpR1hqpgSv/B3Q==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/782ZkeoaWQ5mXVAo/VryXS35wpT69EUhWwQpJaMdtsvGc</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxlZv2wrz+HFskereNNxiFu04UDW7wpQF683gMZOEipKGLC5QeSOlUrjPj/jFfdO5zvJREF8FQD0dRWxg0vbBodUC5q+RMZklrrzVR0Oeun/8=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&d5LsedK2xlJ7IajfUw/78wrd1CkSLP1wiAC3llcBHPdZnO9taNtNlQQl6c7g1SrW</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGNr30plX9FPZBHE9HSHSEedonK8jF5r2rjA50iJB36H4wHuycTl22J52CnJ8hWiBy8WHLcBQ34AXf1plrCJdHd1fpBbaYZls1r5pUa02POqi0NVmuPSgBL21zGM3GVlBEso5+YN0eAB/WbOsSgSOo3BK5ipxsCb4JRvFDisWFK4bn+3vRAUrw+oziyfo99FMlKvg5qKJLQbz/97eAmeoeEFondc1FqGmW+pR/vWazuCjg1vorRyg8fYD/herbxXzEPaQlwS2P5noe3sNzb05krzpqKjg0WvXLE5nPL5aJXFzvex5SwJ8nPapef1aTvtnAJRwKfg/VR8TVnfQiOKuKZYVYF39y0LZn8ZeAsO8RanESxovxveXUdIsg6V+CS7D3USM6BGbX8C5jVeodc+f7ysGMove08FwR5/sadsMwzmYUAxhSnK7EWoz0NQz1Ma8B5afVwhEU6H25FIuTj+9wid6ZF3hZsHPfvvxlcBiIo0xmrkHlX3yclRJA2ZSwnJiRyQuCQqjEz1rcuzDPQ81t81tw4v5ql8EwwFgF3cwSl0aVDXySQ/SDHQlO7XBccJOcdBsxhIrmIaG0cW6mZmA2ois+5pLLo7wEisE886D+T77hxb0Sl9jeXj/AZh3bevziPzzbYx7OGBtsLrmrc3p+Ui</Encrypted>]]>
      &VoucherNumberLoading;
      &APVSetVoucherDefaultValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgSk1CEulnrcUS2bGJ+jOy4qcvoSc+KbiDgJqhIblRVE6pAhayUiFV/xqmW7cGszw4=</Encrypted>]]>
      &VoucherNumberScattering;
      &APVSetVoucherDefaultValue;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgmAexscGIb6XmMXc+/kA9N1Nxy9w7CZRaggCOPybbNWg==</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VGALXfw3Kc8Kk3w3FYNtHC0mvevEviHCNElxwFxOJA8</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dJgeUcGBXK6zcr2MH4Yp6dQE5CUfWxJ1aqyjnDiCVZy</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bKIhWweCxWZdCRwT1MjxMlqfKbKtWmGpCidRoPiue+j4tOlbJqkwd6smIvwi+4tlBbiTfN3SU64R+5DlInfqulaROh5+/P8wT/F1Q+bo4hwz69ZRra0ubMEkti4OxRNjQ5/Ffp5UwyB27tQpiVKgfp5q+VyztOjUhwBfnqOTirJIZawdLYUV81npKxJDOe2prD0YqbF1uWQh+FErCcSzh1i997Yj3doDTvOa1ub/qWWYga5LKoi5lFpxXEhcb0XsEpSYI02+/Z7n+jZUrWhjUMm/dIuqcqjPpidXeVIsDaDaWZRdfC9wLNEgXTH8NODmA==</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSm4fXJKbr0Ilo0bHhx2IddWfC7CbSR76p13NSPM4d6wzh63H2qvzWywhAyyzfRxHRuJU0mwZmqEfodLxbvu3ERYobQd1gG3308OB3Qe+q0HF6QmEJtbExPABoyBopR37Ei1jYYpZIEnoAqTu7WJyQJiO+1erL9UItODUXFjaLzVNeWkzfF20WY6R2hSEO+c4V6GwgZE8ARlumSF6o69G5LcIIVtuqFvk5p5RBnEr0EQKACDdfDOcnAQjPExMVed6w6Pbiy4t8DpQ+ZlVPrYlmHYTNaHpN4WtIb+8sYj57xTk/eMR36U40qZ7XqfaHnBwv+</Encrypted>]]>&APVWhenVoucherCopying;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWytGZEYA+8+fSsLrGP2IK7CM=</Encrypted>]]>
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

    <action id="Customer">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqapXv2dF/zPQRP5o3OalCwddkebjQuEWIiRC7gMr70mJ9Mw2uKvUnc2eR0XJ/FCLprAzSZAcmY63KjfyaUXAzw/ecc0C1l2EMrmuBb/V3udUx+k+56uf8uUsTkqBSh1pNcXyB/THA8t4opZ/ule4MRNrEk5gEjrpvQCYsJe6d2nzIdoDpd5vjK3kRJCEIHwDPpcwBuoEafzy5VcXOIJeHl2g==</Encrypted>]]>
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcLoOpiCbdYv/LJHRk0UatSDVEBwhcTw44AVXXdh82eyGScMya6G/EtERSN3YhuHec5ZqbdrCpKdRwI6qgVKRn+8lJWtaVBlaE56ckh747TEz</Encrypted>]]>
      </text>
    </action>

    <action id="Shipto">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm59dRmYVuCCnSM2gTZX/t4ek5yZHJ2QPqGKUsVe6qr7aLpgfPxDiX6FBlfjAA6rx+i5Ct3j0GnI82cTLn6dzSe2A4pK8h7sgJOLjF1p49AqBohNCAT58hm1Mh0mLq90J2FaM9TiAkVI/8m5WbfYVSTsXph4Z6VBDKH7D2tatTq+ZWHc7+a6JTNNROXUePC7yS/hVJEVEQOGGG2wk+oCifIuFobXZ0ZV0jfS3mUGGGmqTrFMlM+xXAEpllPr2bzP4UJsTulvQVWZGj9eAz4oOC0/5eYHap2IdIDmQu0t11Et6bzjPHKFjehyUvFt80rNDx1ZApFytZp5EYssCt8Pat7X</Encrypted>]]>
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