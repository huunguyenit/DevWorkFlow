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
  <!ENTITY CommandExternalFieldDeclare SYSTEM "..\Include\Command\ExternalFieldDeclare.txt">
  <!ENTITY CommandExternalFieldSelect SYSTEM "..\Include\Command\ExternalFieldSelect.txt">
  <!ENTITY CommandExternalFieldSet SYSTEM "..\Include\Command\ExternalVoucherFieldAssign.txt">
  <!ENTITY CommandExternalFieldQuery SYSTEM "..\Include\Command\ExternalVoucherFieldQuery.txt">

  <!ENTITY CommandCheckDetailInputVATInvoice SYSTEM "..\Include\Command\CheckDetailInputVATInvoice.txt">

  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">
  <!ENTITY ScriptCurrency SYSTEM "..\Include\Javascript\Currency.txt">
  <!ENTITY CurrencyDateChanged SYSTEM "..\Include\Javascript\WhenCurrencyDateChanged.txt">
  <!ENTITY CurrencyResponse SYSTEM "..\Include\Javascript\WhenCurrencyResponse.txt">
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherDate.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">

  <!ENTITY ScriptVerifyInputVATInvoiceNumber SYSTEM "..\Include\Javascript\VerifyInputVATInvoiceNumber.txt">

  <!ENTITY % VoucherEndUpdated SYSTEM "..\Include\VoucherEndUpdated.ent">
  %VoucherEndUpdated;


  
  <!ENTITY f "FastBusiness.Encryption.Begin$UnpyrB7faeNIV3QST2LJ0ydOk1MDDz48QQ3nl/IIxUTmKHw9eH02wgzjad1OYkoeVu8Ao3gYq/PeJYMV/Da7ze4Nv843oIfeCdWCM4ibMUA=FastBusiness.Encryption.End">
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GHZpY7uS23SfdSFzwrTcRkDCJXPM6kzyi6gYOvYy76wRA4ctlJ2XrRU2KP1wuK9iHnDiUo0eM1riGbwulbjuGCWKCdQezOBBVR6+6ul2HVQ2HNGZWctP7T9JOL+FcBT+OV1XeW+515LZ7onfGBtPiirny9pWdu4yB07IeMbbprg3wvV7hfG3YGnz5jpJq257vC87WKCRmxjqOqiywD8J4XJVdgtJ9n3v8qHH4/7JXLL9mRmYjn8rks5NAuv/NFbELx4lorgdj972eIiidVToW6wQCbqTxrfpDEQ6T7l4ZDb86c7eTusXHE09Vi1PSKEeOjIfLS77eoWkyEWvvDJTK6RMOVwIChFTh7i0CwYvRJ+4FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu7Djag5IFVg7l+jw6dseOG19PLptM5duMvXkns3YoMr9wNJzNj2r4sNIW7JGswg/IjIr+LKhYqFlpSMdudYeici2ZQG2Bt9AQF+4BNR5GIpP0Fc8FK/9H3tYMdxErKYc7Za1gSuJYYeX/yjHdMY6r12bjzKwu3bxhRK4A7Z9v5rmAnJTpTM1P9bpOOcTU0CvDC5Pax78lWxnjEX5qH5z4Kxd44vgUxtuwfp3lzUOeIimH7nVsPJBRv1KMOxll/WnPg==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$w1oHuC63OesRrv0rb1DbibcivfkKrSb8Ljdlx4zEOXTcqCnyfrhKrrkxnZHAQF6rKGwxXK6RCyB+v4BLJOF5wF6xTvaF82tpV6404eviCFxgflhc5Wj/KIW0bzAgPKvJEmimP57763a0+6C4Gq256q4brKzhgOBhSN62VseRr2uioYPon/0Ly8/pLWobTwitECCpp631k4t8B1PabL+wBYeJuxZQuWeWgup4O5X4Eu4+NWquErrdm9LDtTbvV61vWEwPVFGmMoxB0SNNxMXjmUubEMLNDWU5orNGRybQywEm/iYaolv4nWasQcMiGsA3x3143U6so67otnHrdKSR+tSnYPVdZfpzYN6QPMYaVtQHvlHORQwNOLkhWYqFkKIgzF92BiEJg/HhSMkx1Wcr542yEXu+Sq4qbPsEvFWQ+8pYO0sO36YXdZUNyp6/kzsdtPID1CXqfEU3o9EgRcurXR1lDoqnqrYshLbrVt7isq/y9pul9Cg46oY1jlyKMu0KRModU+HEjrbUjc4p7L5Vd45UHSx+hNpT/Pko2eHf+jEcW94hz9A9n4eLQnRUr0tj7ic8Rgj65Rxj7ethZ91JG/8FJpOBRGoUm/rP9R93VRCT1clB7GIAp+AUQsPLGDWqBQeyR2ZSSHTig5vaYuHH8a3916lKMQ/eKauNSNC5FtwTDAaUCSlJHDKVD8gVD9u33B9VuRB4oJHenXAhstdFUaEqR8HjwfLfTNATERc89BQUIVT3yBf+oI+20dEGwfoPtjVQB64qnnYkMTSVRyOMOtFk3Hi8FE2X6+bRKr3uHWzbbuPCQvZZJZFcvUlLLAWXDOZNK0bnpRc3ZLOw4Oxzj9Cv/pe6OAIzL24a44RdWNB4Hw5TPmkUWdvXvzNzLyzO/b09hCUTwvgq7gxV/IDR2+gmLmLG8mixLzaZzfLkeEKyGReHhQQKHItUpR2ovd5LRLr+6uEB6kmT87rmSplFc1yFC9xwG9xnnfD8jLUfGtCYiDsI4mZuZVK++3nbucQPmr8eqIhTciY/AoxILAKt3KS9LayYzN2UaanOAg9iw2ycVPnZZqcM8GssXB3l+oCSYVz4OoarF6pZmnGUgnW7FDxSLtCJkCiw7r6/gzS9CV5uyLotlJs/mtuBKKrWlORJLHUVdjzFCiTi+pyHxItpjQx2sl1FD2mObJA/vGVhogh++Bp9E7PFgRNIyp6jbsQd+OtiGvL29hESCIFMLlPg4X53R2klDYqOMTQzbQUthKy25qL8fs36Y+CVDpIVphhPFastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaUeS2eCXWKKHcZsD3vfj0NXSG+VJwFxIklBbB+5JCl7eSGrrmE47ZLXnQieWn9ObRI=FastBusiness.Encryption.End&VoucherLogActionKey;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu3TDZKCPjSWyqXwrPR2FYM6snMXs5uTH01HyTEEThNFxdgbKjm+YmGaGaUlwFHbeUCdba7f7zkNd0gOL/hjp/G/JmWaJ7z+8TgVCjpsZhio1DGFxCtNL2/deTvJdhvAKoMBxfvsKdvYy5eSS/AqPYmkHj3ZAjhEWXImt9d39Xsa4Ie/sPzhjK4EiwDAegK7TY1yCvWVnkwv2FA+m2k5V50TSQCMR+V9sc53P8HFiLjHZFastBusiness.Encryption.End">
  

  <!ENTITY CheckTaxCodeCondition "exists(select 1 from @r30 where ma_so_thue &lt;&gt; '')">
  <!ENTITY CheckTaxCodeConditionByCustomer "">
  <!ENTITY CheckTaxCodeFieldValue "'line_nbr, ma_so_thue'">
  <!ENTITY % CheckTaxCode SYSTEM "..\Include\CheckTaxCode.ent">
  %CheckTaxCode;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.PATran;
  %Extender.Ignore;
]>

<dir table="m83$000000" code="stt_rec" order="ngay_ct, so_ct" id="PNE" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu nhập điều chỉnh giá hàng mua" e="Purchase Adjustment Transaction"></title>
  <partition table="m83$000000" prime="m83$000000" inquiry="i83$000000" field="ngay_ct" expression="''" increase="{0}" default=""/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã ncc" e="Supplier"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and cc_yn=1" check="cc_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người giao hàng" e="Delivered by"></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="2">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4LXW3G/8fV8D5ZJNQD+j1vOMoNFneLFQkf/MC0Th2XjQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tk" allowNulls="false">
      <header v="Tk công nợ" e="AR-AP Account"></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="loai_tk = 1 and status = '1'" check="loai_tk = 1" information="tk$dmtk.ten_tk%l" new="Default"/>
    </field>
    <field name="ten_tk%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    <field name="so_ct0" dataFormatString="@upperCaseFormat" align="right">
      <header v="Số hóa đơn" e="Invoice Number"></header>
      <items style="Mask"/>
    </field>
    <field name="so_seri0" dataFormatString="@upperCaseFormat" align="right">
      <header v="&lt;div style=&quot;text-align:right&quot;&gt;Ký hiệu&lt;/div&gt;" e="&lt;div style=&quot;text-align:right&quot;&gt;Serial Number&lt;/div&gt;"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct0" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày hóa đơn" e="Invoice Date"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày hạch toán" e="Posting Date"></header>
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

    <field name="status" inactivate="true" clientDefault="2">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Chuyển KTTH" e="1. Release Later"/>
        </item>
        <item value="2">
          <text v="2. Chuyển sổ cái" e="2. Release"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d83" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="122" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="PADetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r30" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="122" filterSource="Tidy" categoryIndex="3">
      <header v="" e=""></header>
      <label v="Thuế" e="Tax"></label >
      <items style="Grid" controller="PATax" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="ma_tt" categoryIndex="-1">
      <header v="Mã thanh toán" e="Debit Term"></header>
      <footer v="Mã th&lt;u&gt;a&lt;/u&gt;nh toán" e="Debit &lt;u&gt;T&lt;/u&gt;erm"></footer>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''" categoryIndex="-1">
      <header v="" e=""></header>
    </field>

    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền hàng" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thuế" e="Tax Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_thue" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng thanh toán" e="Total Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tt" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    &ListField;
    &PostField;

    <field name="loai_ct" hidden="true" width="0" clientDefault="Default">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ten_ncc" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="dia_chi" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_so_thue" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="182" anchor="8" split="9">
      <item value="100, 30, 70, 129, 100, 8, 100, 0, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="11010000-100111: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk], [stt_rec]"/>
      <item value="110------100111: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct], [ma_dvcs], [cookie]"/>
      <item value="11010000-1001-1: [ma_gd].Label, [ma_gd], [ten_gd%l], [ngay_ct].Label, [ngay_ct], [loai_ct]"/>
      <item value="11010000-1101--: [tk].Label, [tk], [ten_tk%l], [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="1101--1--1100--: [so_ct0].Label, [so_ct0], [so_seri0].Label, [so_seri0], [status].Label, [status]"/>
      <item value="110------------: [ngay_ct0].Label, [ngay_ct0]"/>
      <item value="11000000----111: [dien_giai].Label, [dien_giai], [ten_ncc], [dia_chi], [ma_so_thue]"/>

      <item value="1: [d83]"/>
      <item value="1: [r30]"/>

      &ListView;
      &PostView;

      <item value="------1--10-1--: [t_tien_nt].Label, [t_tien_nt], [t_tien]"/>
      <item value="------1--10-1--: [t_thue_nt].Label, [t_thue_nt], [t_thue]"/>
      <item value="11010-1--10-1--: [ma_tt].Footer, [ma_tt], [ten_tt%l], [t_tt_nt].Label, [t_tt_nt], [t_tt]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="3" columns="769" anchor="1">
          <header v="Thuế" e="Tax"/>
        </category>
        &ListCategory;
        &PostCategory;
        <category index="-1" columns="100, 30, 70, 129, 100, 8, 100, 1, 7, 58, 42, 8, 100, 0, 0" anchor="5">
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
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4IJ+zPBW2k+1o75apxCZqtKhJmhWiYUXX+nzPiaqU7TjRffvqobsaZ7vWCU3/WHGCQc=</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWfcTI8rC0d9fp9omqAEx7TjeSPcvU6ajoxP5jSo77pUgvwrclb6t6k8kZeUyCkVGFz6GVDz83xTsH6/KjMqWZ29mKAzStPZAIg8RkMk+WqrwQ9+UrA1z4tXwMb8gH+VU6oWda7eA9OkVfOHyQ+peI33</Encrypted>]]>
        &CommandExternalFieldSet;
        &CommandExternalFieldQuery;&f;
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        &CheckTaxCodeDeclare;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbUHIp5vuc5I9gBHfs/VRmLAEnvYkVcsnYr5FVzk6BScuPqNJ+JTprKktfm82CD2LQIYWaZYYcBo9QGF/FFTof3qLt0UXLEOU6cl0u9eEF7Nvr28iI8yRHlwPTL4BHbUc7O5ao6qHEzj9CZ9GcoGwP7frJb4OMrNXotjU43PR5mpxgaoA8pejkpsOenUxteYqKP191d+3PK7cgS/PKG8/xWIjuHXoY8ommnhBce4oWcoI0WM1hNRbUPHldffq1dC131oapY2u5gVGvJwM177zQUmKjK0/qoOBGJjCuQod7/zRRZpWN9GvYJFInf6CDlNwW3cYryUA700WqHgc5oKhPTQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        &CommandCheckDetailInputVATInvoice;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcO5gpt6SUJF7HKa+7SYvpDnWChLngV+k6MacHMi+wDYd9n8iWQwiJ9N7zaA2l/wLqNc6zgMPqG4oAF2bB2uu7WRQCfH+V+WQZKcN2iyj4GAk8jajMPqECbEkEfPYsyBo83AqKqIQuyVgq0E+Qcm30z4Hps7ZrhZeJ3jxu8ulgal1OatKMh0w/tU6hm2KcQ9+yrfo7d24W9bNM8zWhlnrf7IHHY9loN7AvN96Er5J1PcwCgIRjbTcKFE0mkJ1hdUlhrxDG+5KuXCA1qqjZKZE2bUSruyqdxHB9md1hJLzgsoX1HujlueM6f3Crq6I4QP8JI2727yXu8ZJxb1zC0I0HjdzNXEt2eY0RcbOEU9yRn9NwJN5iWCGeRSUD2vgKBg3Vw==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM1Gjw8Bd2pFVnKsmhqk5vMDy68j8OWVrNwx5bv8wcXmXFFVtmmGEBCTeCvdf9GY8hoF4es6IqxRzqz7AVOvJDVU/g/koakflVg/8/xQifAFyZ4/GOOKDtFR8x1uEer7c31JAXT9WEsd/0/6K08RafakNzUth65lKFwaUk6JyVW1fGaGgEQh+jyD1JrxbQYwkssKkBJC+YenPVJpJ9wepwo0lVvJaG8CdBlpBvsLCqGq</Encrypted>]]>
        &AfterUpdate;
        &Post;
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4oIzzwbQpRDIMaJrvXIVVy7HQQ0bK7vOgLkItwoSlH1ITGTcrOmDtiJgLBEOOyk9aBlbLRjs3oZeOFwfrVMY7Z0+QJFjtFg07EpcSx5wW2lnP7JPB9bIs2lzmvC5Rdjdg3BAojMW6vYeMO/g8ZepnBsWIPb8HAn9fBrq8q5vtoFqK2WVQz9osMkZXfuYcZhfDaczfWPY6tvRxonDPcX3ECyiLvsv6GuGxaZgcgSTCDqoeozTHTkC8iw+iR2lAHwDTICWaCt6m2eQG4Q8Z1nEiAMViQmlW+0Or7gBlrrm04OHW3ktVXzU+YBpb0yHVkOzTXoSo0COltxBh4nwEO9NciEE7B7fIr2fGiNbufvf0CA/6GSk9ydB7mA9GIzJAgAlG8LmgiRZQbBtYJQAJsi55HeDfv5rLdO3n7gLyXPP7ehJ7GoluXghjzPhzs6+AQjq094wBPuF+ciA2DQ5I6TV9N/yvWhR/Gv1iPbCcqqO1SO</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckLockedDate;
        &CommandCheckVoucherNumber;
        &CommandCheckTaxCodeBeforeSave;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22XXWFyhs69eHzp8/i9wp1totf8UdWkIJzDEa5aGRjVzxdbsKnQA4NvAWVRJEtwopfg==</Encrypted>]]>&CommandCheckDetailInputVATInvoice;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22V9SQlY8u0YDi5PQrYYpMi5Ng4cC7Zg5z94KIKuateQ58Gpu6x/TUgKucZiEPiA55ONIvnMiOAJU3dNxkfxDXJp81i4ia7V/+P+z6d1m2zhwHi1KqDL9UHXnaInSw4l0Xan0PQ/Zbhzok9PUBxxh6HhrlL6tpAbfV6xUUikLrdQXfW0Rt20HFZ8rfU455kLV5D5l10SBPF3S1RbUPjL0hmHPHACmGGerFAyDpxyz7LO0ZUHT5qFUJzzG/HHuaq0q1H06VysLISPvOTzmWoZ432BpsZKDFJ60PCeL84Jyo1in/5SQQKd5zFC2aXUwSwt4I8XW2czR6ULtBiL3CR+FCDc=</Encrypted>]]>&VoucherWhenBeforeUpdateLog;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SkzUMb/tctt9Y7nPTI1NjDJKdSTyN/1CZTsDvcHD9OhcMb6SfzOLtln3VAWcyVOhcKzeYwS+KrFIhWP+vuqTOU45uPdhVjJateo6stPu0akbhgHlBxM4jTG8EV6yGbVJGyOXlhX0tc6VVyWvRh0oYjvlipSdl+swdeVgN+alOTaXdBFwhooxLzhguvqwR5ErCzkZBBNETGsBEtHJZEBSCkK7nZgRCzzEZQrT//sOAbCVvyvnIBQobfvNExFPhJV8k7BANRrRKvtbZZT/WNGBLUT5x9AsVRf93CUrEhC4eoEZ/FtX7cfIngf8sTXvXnbzgIVC31gg181LlEfvv28yCPdAE1pnWwiVZyXTEgMk+fBfHV2ivFfONCABxFyek3CtaRJwOqUu0w7YqmrhY5Cz/h16QCCxUfYUWTvzA1TQaupK0Ejmp2jJzuMSebFp2JSVAO2uSLc1/ElVJ46rjdcgjEGTw6w6DZd+3kU0zNtZyHSquF+t+ZW8a08D7D07ye06gWT57Ufx2b8zQCSWmVZuxRIoZrWlHlrLPyRQIZ2rm1BvWKV1b4SsSD707jDjiCSUw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22SkzUMb/tctt9Y7nPTI1NjDqcKzKVacZ0ifWHlWw83SYyttMABcfMBH5b/UP+bLWgJi3BI0EGUrCazIu71M/S08vTPbbXuc/M7DWZllXogN3U1Ywr/SQnYHc6GAhTVXLtkzUq5D9LJ/ZLbf7+DmLtiA3q3SJWDVr8iw24TVYLyWhiqEDmmvzweKYQFVBcbqCv+BCrZesErvCYFvzCGiGbQz9M963oKLn8bZkoUN8LKMTkyK1o1DvXqSgmi+HkVgX3VTb4v2yD1X4Z+VgKfcE8Ux8MjXVbP8TQ8RbzIo7EYSvBesPkuHgtZEkB20/es0mBj/AuoSd6ytMMYy5T5HGAb9FO2m8/AD/wpWJg1rw7SSElxnwKyIFZlOhoWShaGmi/99nwr4SyJawj0dP4Exqx3K3An5jEzbUvaFTeEb6Hr2mzaxvqP2pS2kir8nXFTg0fg==</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6K/NxMej34l5DwSGBQV7zdpHeMY0hZzLlD1wfY3jE0VkczA0zmhbuga1bqT5aPAI62MNz7Ta81C5I3U1HL46bifCl0m/gZGbKPEEIkdyuVfwYAsRR03dI6f8agfwNSQzsmJ+Oy4pd1aq/k2j69yEXyLbQpD/tnLh66O+8/XtiulpHuPRci8mxGM/xwWt4UVsGxNXXvJrAR4AA4ERmwUnd/sFfGI/tAm0pdKJ44B36elIoMjrxTOA0OuWen9WHERxGSqLyygt5ctSlVJRAuO0G5rFQV/F/4uINsS6wFX2Vrug==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR70wgPAkFmkgrAcEMwC3BisWQiQltXysYsR3VE+QzlDn+bO5epCaLEVl4Z7i9VyvuO4bePc57FoX9u61Sklj+lBad0ZtV/jr0yPf3UMv2ya4Y</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9pylYZYdIaB6LVCToHLuVmWi1JOCeC8N7K9t1bVTHSKP3uf8Q2XQtiEx23iIjkLeA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
        &Delete;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22X9euTvmH3eAzer2+ZvDJbE=</Encrypted>]]>&UsedVoucherLog;<![CDATA[<Encrypted>&/RSNPGCNQdOpUiaA6NGaHvFSNzMHd24rwNP4C3O42rOMhJ6sVTmKDMfBnMkKj5lxRiUoeJNQOLfjvaX6Y5QHmNT9XSLa0vHXflkfkQA82RQoqqm1KqdxYorGmFUDe3yPXS/fT1Zw7xcw6TNKVRDEe5l/TPXMmqrA62bCPSWggb5CJK8oKZ4SvyKZS1JyNIARz+NYrct2ePdslKBtb0YWBuXQ+hHZ+ug2+RMP7aw6wy5AwcnqQE5s84lj7SqPUibFcqnf2B3fmiqzS/ZiB4/lEOeGqSiUdN3DHGBhHkSrA00=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzUlEsA/IGtDzb1inqeoD2h0UfRPWrI20QPM93QbEBr4e4VpRtXCBwh/hD9KY8kazKzroNPLnmzwseTuTOFe9I7xNg+nFUO2iPPDjr3ZY3xiK/rhN847LWLD3hsWN0fBg8LdcQ7A+L7laNnyngPXhbsih0Zzs80XZbOKLTTKqCvamBPLicX35SSJNLB55s2IIHEOtR9v9I/qqHn2WdJ5KYk4CITGGtsXyp3LVZfqDsaJ78X3Djj4fKrr++Km4XP+K4j9etSrJBnlKGNANcmtori6HSBRNA/qJy7B8IJVOqrk4eDeKd7CuStReyDl07QyxmwKDuSIKvZShsMdgW/Zpv4uwknYpKuefGCgdj7oAfAN9e/HO1j4FEIt0cwHcWzU42x3xAlVhCeP5Pd/K2KIW9OLIxUltY52qj/377HNIQJl9zVlLYmehMLSFztIZnyiT2IA8AbaWXPKRkrJJlKM7RESMGem+HemSZtgeY948LewIv3xJImQ6ZXjMC+JTgrD/JExLCJ5S1lpMIWginP5nPWxET1KGjgeKQ6X/b6MQD+elAP25LsipSlBGAYkgRfFsPmXoEUYgcXzdfkFNYQGv4uhb3tI4stFQZpKfX+FsobFlT1N73yH+5lREK/gffcBSZiCi6QOxo5EtvfEc+KSo0S</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpxEo0gX3ZSm29Pl+bEgpSSdvmRY4JJ83oEYFzir0FLMEtO6dU7oieNBQDm6EonD3bT2WAZXvRnaI9F+jp0jfjKQ==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cu4ihFzjsEMULxf8NNqEHIOLnX3gLXrzxwyDQdLlP9vN5ADTtfhMzMLsap0PKh4SAzYvl2a8drLp+MQS4yphVt4RGVzvbXJYGh7sP0RPZJwYnOZ8aZdqsHzWwDZmG2qIrQnVDg7Ea8FAsISeeNvi+XvY1A8SHFbf6i+HVy2nBqm3aScoNR35tX3jKMp801KvFr4V7nA0YjWpvHDX6uQ7h4=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4cu4ihFzjsEMULxf8NNqEHIOLnX3gLXrzxwyDQdLlP9vN5ADTtfhMzMLsap0PKh4SAzYvl2a8drLp+MQS4yphVsOPGgf1eONX7Uslgt3PjW12kXPilRNBRPJZqx6NtFPfQoScIY+xK1LxANDzAvxn9goivR6+YM7iWIkGBYrBEr0</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezJSUPR3CDFDbB8GgGdfLCvf36d8+RqE4UUOtfM8RS0YjpOC44y65lt/OTwVE31A8EFYkzZ1h71oKTEAZUQf05o+eUv60GNg97JAvOakIhbqg=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZCdbJ+U2ImncEMAOCRkzWrtT+8FihJ+PDYur3vchdp+5ZzE/0W9FibPkFGMznceS+d08vbUgCukescwu+rlotFxMcNXWsUw5x91hFxV6rFuqdILU64dvqdspoVJ/l1Pb7FVe+eG/ZaFwOrKJXtnATs=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7BvHCz6LZw5zw3oF/HOmTHAF6b/of4is4tWVF3qssi1P2+W/QUWht3YXuu/xa+F+5SThRFFrEf9wlLKnXz6bLiFZp1Cdcc6opkpN1kfBhCMpSDMc5JqSZ0qWiHxjsfTcjZ7wNKvWUpQnscLIHx5wosqGc66hnEmRVLWQWFWJbVgYBQDzaNEVXYWoMsaJLs5a+KpGUe3kgD9Ac0/WmeNDtdJRuKL1S7X1ndnxC5qhXiJ0GXm0JSJNy7PwY5Ldep9IM6tLcacT7lwbgn2ELKA4pDYY4oOt1eXHgfDdmwefFffiLioAmXNjrDRMNS7ANj35WOG/Ltno+cwc61gBZWsnj/OonFObf3/w1AYB+i+DLOxon2wv4RUKDlvd7955jLgTIwP7Ig8L1X3XFjS3oWzgeQt09oSC5UB69i2TXNuuiMd57wC5AckTZBFKFudBPrr8nRYAzj/HJneolU95IgoF24o/GUWVmLx6OXTD3RXEZ9kZNzgoNQR9wE9bDx/t0XWXrU=</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOqrj2mNavAf9/4ESLwuki8rNCpT5ADX8tlu1K8odc9nSixE+Kjn7aSGxkOYnbZd+e4Yt5FBtVcJG/z0VC+AsaRsz7j0srTFdXgCtCxwxOIiqg==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Tceafg9l15/ifmNmrsk5YprSI46C0AYd9BSYyq9+3JdrT1ebtBu8VKHbeP7bzgl3dQIXDlJ9bXL9gAENcRuUve9a5bc62faLWMgfDHBsVWCSc8S0p4u7pSheVAks48Knz4+0DhNsHQku/68s7xrd1Q=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6zFhxqBxzr4vqs9YjDF3rXrsvKp+HNHE5pIa1AeKbOhSfg6FVHxBgT6IjMheK9eQcVDa1RUXSwBHoFHiB6GFZm+e22mEDUV+WluUjsWEu+z0so/+vOMzCfY7LmrqcUlPAwdVld1UihDNXIuPq9vflqJfFBxR0VzvtnkiTwSz3a8ySzWaBxjogXTxftm1ca1u2dh42PlScBkB9TP/KdqVbKSiwPBji3UkLt5MEjLe9Ph+ISM6hKJSwOZHp2QM+RD0w</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;
      &ListScattering;
      &PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bs7UICdJoFL8+YICCU7EDEyfp4DOAw2zy3ytuW5BTDcSizCoFqsIp1ggCyEkQu+Gw==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      &ListResponseTicket;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUvZmfczXew2oSmKnIQDL8ph717iTKpoHyZD5ZilsKk//3SKmGkin+AQtvW0oDfsmU8Vid67K52Zt4sU1nZTDJ/pacW2SkV6anyo9iHy3vzFHYwazFpgAnQ9p8MDmbJy7cIePM04rb1A9UpL9Nc6C0M8NtWiZBtBPHZRZQWeKrSUxWskTZxJEG/rfNm8v76iV8coEtGEaylYAwGTckGAK5HkqZ1tABTXAihaBSh+E5oB0j4+OKrDbz2V4/hA1EkHVBnbdlwdakf15Ibvislm5sglov48gpgJvs32t55aBPMqhbUkIGLHQLPoSscAPbk2VX4LZ5hJNl93iyxlXfbAzU6FXi5DL5+RVl950QS4DbaALJbrsGxgOruzEdVuc9D7OuzOmjS4mCpnKMoL8bGr23YdoReVsa3glWLxVM9s8Z1s1hLMtKe9kSGMn0A3O5IDPr3fE5PQogczTJY/JAtPR7/T09Gxp9luAVN7k2vp4C7dkNXaHIBXtAln5/tVX6nbC4nCznSpB0TNpyGjSpT7ajnsVQhrrOZ/ggzbNfv+jhWJUl+PbjMrkAlqctU8I2Yh3qReWVS2Wfr/6G1AiSZo7XTm4yFeUr3/Lt4hM7logzSVHFPK8H2zbote6m/P2eGN6JvoXyWSKHeECCT90Hxog6DG1C9CKFi3i+JpJx5YFbqtE=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0Eqaxtk81KWB7g2dSY6ulSogGkq4W7OP571jRmvm0/OLjKgqbssKw5OsRyiF4R941MElhnVZDOPZGcUPrINBsd3tkOnHsY+NZcy4ZKLboZEUrxxcrI/CLbywrTX8w450F7ZmBqPI39uAv4trbmVhkZZR7z/cqqCLbpDbbytiUMVpBMaIPWGUbScg1NQzywN6mEyhEw+zfqpziDppKFY50yLx3Y+XxrwZXyQzTZsiDXhCXjJcbY2OTy57YexIaVBdM88g5pj4Jj7pkDoHNoAR6lUn3g==</Encrypted>]]>
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHggsMepr3W80FGbZ4XH52vDnvISGeFdf3WHBxanA+m09OoL44COTbOcJ9sgbWkLDaAWqswOE1xvRp5vDpri+G5qw==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>
</dir>