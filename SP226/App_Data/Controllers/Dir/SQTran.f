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

  
  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCx2Jug3UeMUeMe7xx04AkQ6aWrxcqj3a0GgDlMwWTTUqcXH+B4oRmV2jVr+vD/S5o+cmx8jAnnRuXVF2yESEXPMv0BSCc3Gte0GNp1GjlYQGpxmdhOCjg2QHgB4QR04fsLOIFfySFtuQWMIjkOSn79INNx96NXhLpzydIZYI50dzNI/CBGjibCgSFGCrdXhFFjV3pk99u2DMxP7vQy/lG22ns2fPAwQK361gUwE9YFLr8gMDAAquVwYV3V+A7KdAI/X+lvSymiHwhHh7tGf6DVb3d2VmeEqlR8D1Usg3B+OYyYRhNrW4ZCXsDzVeOrs9MFastBusiness.Encryption.End">
  

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.SQTran;
  %Extender.Ignore;

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m61$000000" code="stt_rec" order="ngay_ct, so_ct" id="SQ1" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="giấy báo giá" e="Quotation Entry"></title>
  <partition table="c61$000000" prime="m61$" inquiry="i61$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn = 1)" check="kh_yn = 1 or nv_yn = 1" information="ma_kh$dmkh.ten_kh%l" new="Default"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4kPpz09O8a8INxByfa87qugq52do9k80Lc4RL6z9QSqQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người liên hệ" e="Contact Person"></header>
    </field>
    <field name="ngay_hl" type="DateTime" dataFormatString="@datetimeFormat" clientDefault="Default" align="left" allowNulls="false">
      <header v="Hiệu lực đến" e="Effective to"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7QxxipynEKp/u+Cjj8pZ5Q+sqSSJZjKM6T55JVypyCZg==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt" clientDefault="Default" allowNulls="false" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1 = 1" information="ma_nt$dmnt.ten_nt%l"/>
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
          <text v="1. Báo giá" e="1. Open"/>
        </item>
        <item value="2">
          <text v="2. Chuyển đơn hàng" e="2. Completed"/>
        </item>
        <item value="3">
          <text v="3. Đóng" e="3. Close"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d61" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="170" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="SQDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="r60" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="170" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Chi phí" e="Charges"></label >
      <items style="Grid" controller="SQCharge" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="ma_tt">
      <header v="Mã thanh toán" e="Credit Term"></header>
      <items style="AutoComplete" controller="Term" reference="ten_tt%l" key="status = '1'" check="1 = 1" information="ma_tt$dmtt.ten_tt%l"/>
    </field>
    <field name="ten_tt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>
    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt2" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền thanh toán" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien2" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_cp" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_cp_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Chi phí" e="Charges"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ck" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
    <field name="t_ck_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tiền chiết khấu" e="Discount Amount"></header>
      <items style="Numeric"/>
    </field>

    <field name="ma_dc" categoryIndex="3">
      <header v="Nơi giao" e="Ship-to"></header>
      <items style="AutoComplete" controller="DeliveryAddress" reference="ten_dc%l" key="ma_kh = '{$%c[ma_kh]}' and status = '1'" check="ma_kh = '{$%c[ma_kh]}'" information="ma_dc$dmdc2.ten_dc%l"/>
    </field>
    <field name="ten_dc%l" readOnly="true" external="true" defaultValue="''" categoryIndex="3">
      <header v="Địa chỉ" e="Address"></header>
    </field>
    <field name="ma_htvc" categoryIndex="3">
      <header v="H.thức v.chuyển" e="Ship via"></header>
      <items style="AutoComplete" controller="ShipViaCode" reference="ten_htvc%l" key="status = '1'" check="1=1" information="ma_htvc$dmhtvc.ten_htvc%l"/>
    </field>
    <field name="ten_htvc%l" readOnly="true" external="true" defaultValue="''" categoryIndex="3">
      <header v="" e=""></header>
    </field>

    <field name="t_tt_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="" e=""></header>
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

    &ListField;
    &PostField;
  </fields>

  <views>
    <view id="Dir" height="230" anchor="10" split="10">
      <item value="100, 30, 70, 121, 8, 58, 42, 8, 100, 0, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="1101000000-10011-: [ma_kh].Label, [ma_kh], [ten_kh%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="110-000000-100100: [ong_ba].Label, [ong_ba], [ngay_lct].Label, [ngay_lct]"/>
      <item value="0000000000-1101--: [ty_gia].Label, [ma_nt], [ty_gia]"/>
      <item value="----000000-11001-: [status].Label, [status], [ngay_ct]"/>
      <item value="110-000000-111---: [ngay_hl].Label, [ngay_hl], [ma_dvcs], [cookie], [stt_rec]"/>
      <item value="1101000000-------: [ma_tt].Label, [ma_tt], [ten_tt%l]"/>
      <item value="1100000000-------: [dien_giai].Label, [dien_giai]"/>

      <item value="1: [d61]" />
      <item value="1: [r60]" />

      <item value="------1-1-10-1-: [t_so_luong].Label, [t_so_luong], [t_tien_nt2], [t_tien2]"/>
      <item value="--------1-10-11: [t_cp_nt].Label, [t_cp_nt], [t_cp], [t_tt_nt]"/>
      <item value="--------1-10-11: [t_ck_nt].Label, [t_ck_nt], [t_ck], [t_tt]"/>

      <item value="110100000000000: [ma_dc].Label, [ma_dc], [ten_dc%l]"/>
      <item value="110100000000000: [ma_htvc].Label, [ma_htvc], [ten_htvc%l]"/>

      &ListView;
      &PostView;

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="769" anchor="1">
          <header v="Chi phí" e="Charge"/>
        </category>
        <category index="3" columns="100, 70, 30, 21, 100, 8, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0" anchor="6">
          <header v="Thông tin giao hàng" e="Shipping Information"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="100, 70, 30, 21, 100, 8, 100, 8, 100, 8, 58, 42, 8, 100, 0" anchor="6">
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
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08zrfjizv+lqzoVflx0G4IL9fHr0zbHIzwkodnTXdJPX+/ZtRNNN2jr+0A/cVyhVELTfIKl6/wUJO/UJhewWFZk=</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ0xQw+xvk97U4tcaZeWlUJWcDd6/wFUkQAwhJl3VmE6CukjLNuujC7Xi2VC9XFSV8KQv6ef0y4z75WSwRxE3kXdqBetXX6hQ2SacPkmcBflTXQaI3RyoaURyXKQpf44VB2w==</Encrypted>]]>
        &CommandExternalFieldSet;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcALHDWKjDupB2aTj/ctHEvvA4L8/l3Kr+ZsTXXBBtsQr4zhuB21rNKNliv+d7P2UYQJ8pRGrK+UBq70zx1N0lVDd1kS87DEubejUByYBECCWHbCBbcHDt5Md2W5z/b4/UQ==</Encrypted>]]>
        &CommandExternalFieldQuery;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ08n0CmZF5x3UWZgsW5UziJpOytVaed5UEsZnq3Y/8GSa5gDPJmckJKpjiV/M5w2tNA==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcMLD5X3CxYsVxnCkXoptd50biKC48OsUlyBAM6lLXsSxZQHWt42nmasuvA8Ha5cIdasa8DZLVvM7P3z9wS24Asmac4wEKePbUXfv7nLxAIG5zGRhtNPigYU11kW9mQ5biUrG88Glfh3mvRbm/HuoJPnFeS8lhMrhNPQC3aUEmz3js2opTcgV0c2Jn9D21x8XC0PmNae1b4SZe4KLEguqGvtBDDXRAJlFPkNeixexaHI0ft4pbd8BID/DNvPU9TW3XA==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNWuUwWx5m5oQzMZD70u2VWPfqANf5Pf+L5Q2i3/pk/TzAqXO3C4Vw5LJNptXypfS6rg2avhVjmBjIHNpCrXEo20pceqBj9IXK069Fjmfm7m</Encrypted>]]>  &AfterUpdate; <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssTtAfBppivVVm7vpT4v2zUutA6ESFXs/ZQNh6/J/LfAX7tPjx24NOe0YeNTt/wyWsDvBkxBkXEOtFLm3PV9FbNR</Encrypted>]]>
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
        &CommandCheckLockedDate;
        &CommandCheckVoucherNumber;
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku7S9I7mBGX/vg8j3Cw9/CoyXG+GXfYRUjIdCBvm31/AO22yZl5HXV69KPr9L0fuGzvUXXoUhP6VlJbwoMyJ+jZgVipSVvtBFf8B8gwWnlcCVhh3sc8jjvdrWi1ZoUI1GD03MMYmE3EgHHQS2kWCyiULX4faFbufAzgQLuyO9ma6N0Cwv7zqsoAOm5PMJnJSSdkLpM+EeVyPWSJojwI3yBOvot/u3aBrpEBSNjIcUsA0IY/SmCcMSDx2rwAf3yDEXeOCC6aPWSPLQqs/VawuLShAxgrsrLdCsyHE6/o72BeGIa+52iu3caKj4AX0JH6LuTSJjIuduMuUWKIexRK0Kpe8lrJeyslLuDwFohcd87L+F</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UMOaXC9bbLw7UhdNlqcgwzR0AbDy/m5Aj6LTGPQkFtYY8G/w90ZbXkwrwWQuQMQw/N89km5XUcGH3DTDyjwbLGa0iCaw1D4S4OhLVHn68QzJSPeRLEhu6h3QIaptn1xwVwutSSsJkTzk/iUmWG4494hTnC1NMISCbJOHexY7ZyEAKfqMGyCzxIl1/lsaUyATmpAO7FdHChvX+XRAWGUbWx+z+3CHLNyF1yFSycOJjiT5XcP5veSuTAZsL4hGO2LgYfK0ptltpwUhXtzxd2XwpQ=</Encrypted>]]>
        &AfterUpdate;
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &EndUpdatedVoucherNumber;
        &ListQuery;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        &CommandWhenVoucherBeforeDelete;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6nskpyE/YdJfyt6cV5aexPnb3Zorbs8CELktoYvKAwy28VMq0FU7Em9bvkzMuY41bT9X94LTrltj4mVU4aAtLQ=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0HZXUQ/gSt3yR7YyMR9xwVg=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuzJuqrxuhzOmopVuH3ajk6lsOtgU+pW3gRPu4KaQ05TESb7pEXCEmiFsg8sxsFr5PGctyWp4bBnpeiONBtABAh4=</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4O4ojEvRAK9jHGAQP5kHB2/GbuHxrnJs5XG6fCW768cAoHASqWSOiYf6TGNM0GosA==</Encrypted>]]>&VoucherLogKey;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&oKF07heTiNCG/jYW7jL2Eas5AOj3BMluOxZoC8msUkBQAdVbojk1aNvsQH59GJpibNCyqWWDfyzvIq1k6Dfd2ztpysOkFh1DusinFF2poxRykT2P2oFAtmg2pre298GqEPs5JxJ42qj71dygwnlEKuh7sSGFCGu04Js7iutVPwJdacy4jJDryLG0f5O89QgI1Qtv7TI09EVJqb4bMBtCn+ZrhGnig3ozVAiySm5ux7NaQlFlurS1q5Dpg6Xvv2yTbtxiMw8OR+PWBXwUvqVerA2RbVScS2E1jjqWQi+V2dWA96G84Te6OzOjMfc5P+BIi7Yi9Qvij/AE4p8/2URAcTAUL6U5eguUKB6RJWI/PjEqxYi7iZY7ACuWe2tJiL8SyAviDZ6zZMvKur6sUlKjZBe/zI1syNwxSYS50/88Zy04dVb5dyRbVxBkCr7La9W3ERjmLgJWXsCcFbfnn4br/w==</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptVoucherInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpVJ+qZbHdtsAeUOs1UnRUNtf6xkrpFDz9yr8KFiTJNxPbDMKx+uUU2uKHHRDmdQrIhTS3VM81n6gr1cvqNLON5A==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxfKooGa3ASOCQ6gSZDzgGMcm4L32+7L/1n6zxMoN9v8k6grgf4T1LX1ZB5WEHQu8fI=</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;<![CDATA[<Encrypted>&kgSH0HK8qzKbg/rQtWUzkSmdcdio3ohxiLtPrZSHcuoaHWnF9tjjgVMWbZ0rNLvXDW2L0YngPPmYqCmwLy63wg==</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWym9wbgs85nvalQ9Nb4tkNBULONFJ+rXydvRx3Exz9pxEjcZSjdGAoz8aB/KQo18IsA==</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezwy+BLn6PHWPW8vNNzbrcE+TapjEHs3BU6f8cJC0iY9hoDJ7oAGPPKTJbvuaJkLj87xvJAyb1pf93BennkuOetxY4T1j2zEfxlTqTE4DcOzw=</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZCdbJ+U2ImncEMAOCRkzWrtT+8FihJ+PDYur3vchdp+5ZzE/0W9FibPkFGMznceS+d08vbUgCukescwu+rlotEM71y6FDV5xb8FFVt0dnR43Jhm7n+IZtm6ZjdbKdnNZeuHIrwA/ang1t0hYynYNGNFG3lXeiB0Ld1JkcmRpjb9YEjtfuYu3mkCYBSz+KSXMXyVQsIPussb/wrQxteDWfcPjBwBPB0JzViwI0YCmA59GVqns8JoYnaXjjV//aIDFMr4VkBDDKCln7cQwjblvs0=</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7AwHTQFqeMYoxYjllYAJQtbhq8oEAy+tyrwVdaO9HewHrQ8VVP7Anfjd9sm6B+ekhWnolM4p0zHXTlSrdtMD8R86Cyx3BrvNb9qxStsawMtsWez3tEofbEF6+XbyIxRUIgVqZY5rcglYIqUe8cChMNxHW6J29wpIIeT9VkLNhFe/w01k8VFIKITTZD9eQu9ynx3B2A90Ozvi2YKjAKAoKkZM0e/gw+Zw5CB7iYaYszuZCbodXeqwQ6xXd1d4p4efmVg2YaVZxF2Wr7N7N4bTNcYsovX5FknAqdojTKzyDgijl08sOxsoNUOHOTfAqL/UpiIcqVfH9E/jfkNEru14511TkGjY2i1azre8hBtjrtsEIheqk3hY7n3cnjRqiShTQNOddDS2AJtHQ4s9FCkg0KDFj2uuIcfCnhCFjPjn0aYh9o6CNLTbHNG80Zt4e+kAmPzxt8Q7/MPJi6vPwzfTlOeOW/G8afGFVItulP6GcuCDIETSH/pxPYkQ1IW6/hGuZ4/jzRG8ZsjcydrrgtokwY1</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOr2MLY2bYw4Flxo4jU5Y2bgoZ8ED3VMSJbVnJrC7+hOiyyhdsGFdMSACJtaxhIj7G0V2ljOd2SeiRp7S1QB/KsoDiq+KzjGNnYEU/5wYeeqTg==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP5Rv+mCle49m+9005f7JGSw=</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZlW2K8ieuytU+mEpQl8J+maOGcI/LLtNmHUyBDp9YmT</Encrypted>]]>

      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UrmbKXzOYganCM90jl6gL5w9fFgNYpLjw4FLHgDIRDxlZv2wrz+HFskereNNxiFu04UDW7wpQF683gMZOEipKHh+UdKJ4cJt07fWtwfo+mV/MutTrx7dxZvbxHdf1CTykYsQXXo08RuOmU+iJAtOqA=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOvhsynU/mAbbOskLzZ0Rl6EHefn2QMKuKKJPQcG/URqppvG7PiW6SVBtaG8j1FIbyjwQ6rsE95CabvKUSnOHS2zlW+Ld+LGaAVCYEyc27TBUbpCMY25z6BWpEm3DRZf40JU/SC0s5LlCNtQXIyxPLTiERy985K13Qt+s/l+PBoRkoQD09Ps4zWS3/xMJdVllm8uFSI8V3mgW0kFDPutSD+YXsjTJ+Juhx5OFET+j4YSxVCL4OUVaO7e4DkiTz5v2bAX1UWR+kIbS0cDVQxmYHbjrjao32DdxYxML9sSYbdvCUEqI394wa4YtMD/TokEerEkSJPJzdy6AlSnif4B5rV</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dJgeUcGBXK6zcr2MH4Yp6dQE5CUfWxJ1aqyjnDiCVZy</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4bNTzq5LP7sYZBMQdrKxMtgglA27t9CnHXX4B8H9CvfUKGyOw1WK5DWI2D3FdrXfORdsRb63YMYh93bBPJYd7fralt9XFsEpei+RBcvQiXbE/n7gBzKbZA4Db0Mzqwig2i6QB8xsf9Rm/Gadp8oFsHdf8fG5Q3K6DsiokAA871HPjC6pK2wDVJxYIvadWEvTf77l85kW3/61Jz7uOq/at+XYAVgVX4J1UMGtiboQm2ci1+KjPvBMEXmajGJkWLczWkw+E2PFbCx1ZBbIIYLSZoSEwuu6zo7l6gIcuFJqZyFPFG/Bi9wEnXckLjGByhkqaTETYzePCswh5fojXLiEtsHjW2k3fCITe+3R/zOHvW8qXFgI0n9EebAka9acNrVzyxxyKaY1uxr2TAVIlkz+SPKQNTkiPjAgntOpcI04/ryVTAXuK1FgM/UdKr4O3TTuXHEcagsYE0eMHLEwMqDoiVcXLvlJ/AaHn7QHNerNcYLR</Encrypted>]]>
      &PostScript;
      &ListScript;
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4YiJgq+FatkzqY/ZrQ0EqasGeVT4hdwXxKLMtBGRilJ58tH7ZwMGvU44TYTVI8+F9Mty3Rh898cz3FfA5BLoG8mkKbFAIuMZySLadCIn9gDwOoDIfPTGyjEn4CrHvMQivLb1S2sh/M7CoT07tJ89VbAKl7CdVLeHoSfKAWlgg27ONOcgZtAjSUDgVO7cdbj7fEfI9zWS5kY4Ki2bOjrfXT</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>
</dir>