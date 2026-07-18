<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenVoucherCopying.xml">
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
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">
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
  <!ENTITY ScriptActiveVoucher SYSTEM "..\Include\Javascript\ActiveVoucherDate.txt">
  <!ENTITY ScriptScatterVoucher SYSTEM "..\Include\Javascript\ScatterVoucher.txt">
  <!ENTITY ScriptCloseVoucher SYSTEM "..\Include\Javascript\CloseVoucher.txt">

  <!ENTITY DetailVariable "@d55">
  <!ENTITY DetailTable "d55$$partition$current">
  <!ENTITY StockType "1">
  <!ENTITY DeclareStock "declare @stock int
select @stock = -1">
  <!ENTITY DeclarePost "declare @post bit
select @post = case when @status = 0 then 0 else 1 end">

  
  <!ENTITY UpdateCurrentStock "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu29ofh3/U8Wbbo5HjFmMqU4SbipKxGkQLhVEVmO0YJml/S+KFM7rnyA3BMcQez5PyDav8rUBrr0KxI6aKu0kGKuKkutPJYPeQOQgZgm4kMCScy0eQI+unKeS8RRAShUXPj7LNKWcEkidcBSCItXKITJ6yvEqy+apZtCeWkQ1sLly585200c+XQWxhiiDf+PgvLmkpDrdu+lzYnVVjEdsL+v87GtL6u6SLufSSyfl8kCMFastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22ekrIdtb9alTFFkoHtcVWrsF6qDrc7M9y9LWxFc5q537zgXmASst7/ahOpgvmQihT0gd7DgSArbQjkhcAXCmNOI5nzWSxc3CXJk2chcpC12vupygur8XEocSFmPjtg6kgUwwUVrNZLIpyYgw+N/b3+HMrU5oEIVVLWuOrAxqbYkBbJ/3ACN2+pHZ79tcwA8T9QfkxZNDi8cBbDLGgVDweOo=FastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$nNk8dUe86ilcR4y336bXqTUSy7ktjjXN/aKikpyVpm7pvAaSNYioN5+ftG0XDEnr7fZi9KHAOHSnqKkh8eEtBv5lvbDyOfYZgoSgOW6HIwvp8HFtwt7nxwMYODRb1SXQzg2GYWuZj+0soPd1P9ZkhiAKo6pZjXocyRa3abbDhXaZ0iaRw05tQbGqvL16a4sbSa+ej+7CoAFoaByGqIVCrg/adUc944GSPU2lr1883DsRL6rJ03YjJiC9PBA6ksVtFastBusiness.Encryption.End">

  <!ENTITY ReviseCurrentStock "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMuyng3w/X3X9PV9tpzg3z+nTB/M8myVIlemCfTMJHqNrBB3xmSlVwh6zgY6h5OrlcIQ/llzEq67kkCtDm2g+nxVmwXXDYWgGCJ1jgSh2GW+U+i3QRgDXGQ9DpRgqdof2mgSiQoq2Ecb8G5XHFKx3gcPgYgmdDvdy1qbxXGkl/lp/FP4B2DdauFAEi/KKR+21vBurhmGf6FCV+oOcb1nOC/OcvxrBS8xXo6B83NrBZPrqxiBsU1xEaOS8pShMYk8h6JA==FastBusiness.Encryption.End&DetailVariable;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22WtJF1Oh/s+pAZVy8P7PyYUZ/fPgF41vfqA/cxE4z7pRONhgTO9TP+xkYev/WfAkrSDBb3juxFyEesJ5Dvo5z+6ns4U6V2wKn4Pc4uelgnAoR42JNMmbS4EIja3FBkrsymH93+EH8Dhf/FcifyNv2+u5ulJvSBNlGBqLDDX7D9RUZdXmfxw+RK8jYedNBxsR+id6qqJjfBgkYBkcJu3G60c=FastBusiness.Encryption.End&DetailTable;FastBusiness.Encryption.Begin$M+kvXi/dU/Pm/PVr5kRbNK4m69qtOF5F07B8DmvtehsQ5CBejcKOQFiGwXJfBMbz/SQGV1erFxknfH/M/LzBLNuFeDfDFapPDGpqt6YRjHhFc3z4AngdetxTOWlVwMcBqsrTVdeviub7cCc0o/vIjejQ6yy33cKaHgnMaZF1TWUnMWGJmF94zuSPucY/109anHWx8SHO6QIdz75CRXXpM9MiZdVBS8qgMQcjFMNHRYvCW56lyLb6LjQXwnhH/TS6LXozNMiWttjnv64sF/atyQ==FastBusiness.Encryption.End">

  <!ENTITY DeleteCurrentStock "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu29ofh3/U8Wbbo5HjFmMqU7QnS+OFX87B4omEs+NrKpHUdpxlHaNS7G8mYU9xvMyeeHrXvbbMTdjim3HByiV+TLr9zDHTYFDFeDe5PljcjnqyXv9Vw6Hxkwx3BiAoNjZ6ZMVpHxFDzgh09vcvXdx0R9Dce9HOrQzZCug+ynW36mR0wpZhYoJYD8X8MnLuTJkJA7bAAQ9Zkgp6BsQBHAyiLV73vQvsCJuLX6Pq7nyGrUr7THgB4rUzSHb7e9rXvGBacudHEQiSUyCpBR+ypQn3V0COstuLA1L8mje650x+dRTFastBusiness.Encryption.End">

  <!ENTITY f1 "FastBusiness.Encryption.Begin$UnpyrB7faeNIV3QST2LJ0w3tdAoMZw5xdJc/2pJf11YyySZqScJgrCBFxByOV/cCmMew2jwM0BvZzcZWQDm0OeUzlU7NsHXaGjHAhktraFxHs5PBP0zkNww9rPM2BTdxFastBusiness.Encryption.End">
  <!ENTITY f2 "FastBusiness.Encryption.Begin$UnpyrB7faeNIV3QST2LJ0w3tdAoMZw5xdJc/2pJf11ZoMRRFgLZNlhPUFrYopuez/iTLvL6VoUBYbcPOzapvdU96arN7W92xUtSpXkv/oWKpWCg5vAWG9sY9wMMvlMThFastBusiness.Encryption.End">

  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCHjNy5CfA8iuSkRrP0B890QZ+7aQig/P5oFnMeyTcvddlnI53FTpT+9h0Bv1CgymVSpv2eQSztqnLlQbdUnlA0dIP1BwHDiBIIbfEWKcwdcWwkhksduX/MdLo6FQ+b7Qz3WuIwI//6ZDKNn1shhs0kw==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5pelLSjJRhAtd224Ny7f3LSi1h5dEhX/M5GtCjwAJ3k024cTqj7cjFsbtjReDGyXVd7uBm7aCiiHSyROE/uDxyf3GJny1Pv0SaaiY2g5R2VevDOIZBGM7LByJSSh7FETmC+cJqBa8A8EBViGEtq/9488VS13Fxb3ouuevfBN9eE6dV259udx7SrpJw0i+nBmk88O4O0nOS2cMNop62DjE8ZmxfOzlG8SR8m1U4w9Xpw96rji2w8RGjSDncodabzr8B9O2V0sGxcWps/V91ksvo7FIvjMJ1HC0VLatN1IedLD9iPWuUAzucW/ygLzTK9l0dEMiEX571jKaR8jIjuFEFPf6kgr+wb9g0q8LUMudYJfdgzGSeINR+m7LhXfcPKmAvtt7I5goHDpgrMcvUyA5w5QOsWI8RsSCsrvkMVFRfUBf+VW+8ZJsGg+UkuhKKUrWr5znVLJBQ+8Zo7JtPDt3d6d//CeYkGc1q4RKMLAMjyRCLNCmJMtKsQzngH/Z8c1ecgdAk4wa8crQARdBoNhly3wz1xwGqBje4RCwQ2ooLnvl/OWEALWsYe11eC7APpLw==FastBusiness.Encryption.End&StockType;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4TrRBgp++BFuLAZiVrbzKD3lMSy7ymglimvPsJkH7SLSLQyYDEKD/Z1dCRZhutP0l0awmMOHhLN0B1x1J8fpP094c0NwUr2GhJYZpTnsKwwLL5Op/G1bul6qghQHp0fY1A==FastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu5uwlARyOQXt1PnAT1liYaVUTNiKDRWNuRiE1uAC2FLf9CrtMjv2zYiYhIlKM2Nq6w6QOTr3rAvi116BU4Djrj9uui9oKF1jf8FoUSZCLloxFastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEyP4QjvQeUup6SB9e2IDzQ4JHL6uocbFO2/PrXweRzUWy6a1hhRCR9Erh96dapKmLahEuMBezHVVMuw/140v95LEUwoC9f8PHavEkpyuCOBBoMelNIJVcC91gDWGE9sNE=FastBusiness.Encryption.End">
  

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.WQTran;
  %Extender.Ignore;

  <!ENTITY % VoucherDeleteLog SYSTEM "..\Include\VoucherDeleteLog.ent">
  %VoucherDeleteLog;
  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;
]>

<dir table="m55$000000" code="stt_rec" order="ngay_ct, so_ct" id="PNI" type="Voucher" uniKey="true" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="phiếu nhập điều chuyển" e="Goods Transfer in"></title>
  <partition table="c55$000000" prime="m55$" inquiry="i55$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Mã kho nhập" e="Destination Site"></header>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="ma_khox">
      <header v="Mã kho xuất" e="Source Site"></header>
    </field>
    <field name="ten_khox%l" readOnly="true" external="true" defaultValue="''" >
      <header v="" e=""></header>
    </field>
    <field name="ong_ba">
      <header v="Người giao" e="Delivered by"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="3">
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

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số phiếu nhập" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày chứng từ" e="Voucher Date"></header>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb5BYwfrIxe7sbc0hyR4eVljmUTDHmx22aCjIAbE49BcDg==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" inactivate="true">
      <header v="Ngày hạch toán" e="Posting Date"></header>
    </field>
    <field name="ma_nt" clientDefault="Default" inactivate="true">
      <header v="Mã nt" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1" information="ma_nt$dmnt.ten_nt%l"/>
    </field>
    <field name="ten_nt%l" clientDefault="Default" readOnly="true" hidden="false" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ty_gia" type="Decimal" dataFormatString="@exchangeRateInputFormat" clientDefault="Default" defaultValue="1" inactivate="true">
      <header v="Tỷ giá" e="Ex. Rate"></header>
      <items style="Numeric"/>
    </field>

    <field name="status" inactivate="true" clientDefault="1">
      <header v="Trạng thái" e="Status"></header>
      <items style="DropDownList">
        <item value="0">
          <text v="0. Lập chứng từ" e="0. No Action"/>
        </item>
        <item value="1">
          <text v="1. Nhập kho" e="1. Receipt"/>
        </item>
        &VoucherLogStatusField;
      </items>
    </field>

    <field name="d55" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="218" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="WQDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" categoryIndex="-1" disabled="true">
      <header v="Số lượng" e="Quantity"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>
    <field name="t_tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" categoryIndex="-1" disabled="true">
      <header v="Tổng tiền nt" e="Total FC"></header>
      <items style="Numeric"/>
    </field>

    &ListField;
    &PostField;

    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="vi_tri_yn" type="Boolean" width="0" external="true" hidden="true" defaultValue="0" aliasName="case when exists(select top 1 ma_kho from dmvitri where dmvitri.ma_kho = ma_kho) then 1 else 0 end">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="278" anchor="6" split="8">
      <item value="100, 50, 50, 129, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0"/>
      <item value="1101000-100111: [ma_kho].Label, [ma_kho], [ten_kho%l], [so_ct].Label, [so_ct], [stt_rec], [ma_nk]"/>
      <item value="1101000-------: [ma_khox].Label, [ma_khox], [ten_khox%l]"/>
      <item value="110-000-1001--: [ong_ba].Label, [ong_ba],[ngay_lct].Label, [ngay_lct]"/>
      <item value="1101000-110111: [ma_gd].Label, [ma_gd], [ten_gd%l], [ty_gia].Label, [ma_nt], [ty_gia], [ngay_ct], [vi_tri_yn]"/>
      <item value="1100000-------: [dien_giai].Label, [dien_giai]"/>
      <item value="--------110011: [status].Label, [status], [ma_dvcs], [cookie]"/>
      <item value="1: [d55]"/>

      &ListView;
      &PostView;

      <item value="-----101-10-1--: [t_tien].Label, [t_so_luong], [t_tien_nt], [t_tien]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="100, 30, 20, 50, 129, 100, 8, 100, 8, 58, 42, 8, 100, 0, 0" anchor="4">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>
        &CommandQueryVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafSZKoXBsqMxMCcm/GnJvZS6Jw+L9o3i8vlXtpYszKcxmiq/zYMyXuyFs4NHmVv8A/A==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvkvE79tZ9WHaTPx7iZ+EDt1NF7vVW4tTequhBzFOQWMZQ==</Encrypted>]]>
        &CommandScatterVoucherNumber;<![CDATA[<Encrypted>&8d6FdEC+h5/GjHqk7LGafZ7wPr5QkGCE6ArQ7UeuPd5t8AXgQinK3Oe26Z4n3BFCnSzVLmYg6CsFtnrXQcCNGA==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        &CommandWhenVoucherBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHKix8BWItqUg2G+17EWtfwMvAahnyAkjUTnVOlamN5QDCjWziQ3ZZE5Xe8JMjFLhg==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherNavigating;

    <command event="InitExternalFields">
      <text>
        &CommandExternalFieldDeclare;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ06Fi3AvPh0m+IRW6MxNXBU/irBnSLDSDdUuRk/YbQIOmAvZlyyNAF5I7ut/rzs6pNxDjPKQ1tUbxpJBexJKsMyBuguX5jU7ddnlLHKRj+CO+</Encrypted>]]>
        &CommandExternalFieldSelect;<![CDATA[<Encrypted>&UnpyrB7faeNIV3QST2LJ05p7W0ruORmEPEL9GtjcKlCh+symbwhJLPpqXN3EYRLhmpvnnKExvbHAiWQELJbzvYDp8M9FSCkeN51zFltJ9LoEVYb1D1kkGS04jSZuIAM6XmI53GpGhuQe6g/xITgzBdqORY7JBbOo6sSaZp15Y4Eo8uEWTYSrPbHdOy1YS1YrN3yrgnIXDDxss166kW6s3LYAHC6SIKyRfU19AaOCA9Y=</Encrypted>]]>
        &CommandExternalFieldSet;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aY+dnvA9CGTIMe2GSSkZlfa8ot1wS1/C+ftHBHPoyK52ii6WezS7AEaNFKsQV9q66Rlc4Cdh9X5s2sgX3mowMxAV7Bi8nRavm1xCGv0gwSHZMsSEEmWV/SZD/0dyv1DZzs6SmbKU0c/7q5oxXtHIkM=</Encrypted>]]>
        &CommandExternalFieldQuery;&f1;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22ejy0vQeeAUs4EyjyvCDLwUVT1Kqjgon5AU9r/cDGZS1/TdXfXEgbILr273CDULyyxfbF6xoZd3YVGj3c9Ta3XDlVEwZxFTee6WaBv06xlTcL0bS655BLtqX2JzbiyIHdQ==</Encrypted>]]>
        &CommandExternalFieldQuery;&f2;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bOk5IqXPHv7Bu63rzY2G6z4Bzy8ErXV5ar0Tqf8haZ7</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Updating">
      <text>
        &CommandRecordHasBeenChanged;
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &VoucherWhenBeforeUpdateLog;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8ekuyXA51NwwN03S8GeDOwpKXhWBKyvx7ZXJ63mJrLqebNQSE5bWd+KeGp6M5Sh/KwLhJ5c65soij9A6XH6Wt9ffiGMbN9hkv1yABjevjCMCtEmAO3VePYJWzHIYulWUx/zQKJeBSe1fgDaWlsWXI0WK+e41TFH31q5NaYinz/Iqk52ZnC2/ZyihmyhJt8bpQBFbSTFy8WuTlGowym7mRM8zu849T3m2E2rr5HmjV3Sm2xxPUVFTnWz8+EKycPC7D/f+bWtC+dMwHW35CL+VDiQSi2unozClV5zuWA/h1piAi8Vn+Zz19kKxE/wPoSDf2VtlOtELKARyzaMwHhJy31MJWg=</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22QfNFltaL3tfVK5oUuOKpJtnfFZBqPd/zJj/bf9buBN2X6OzlgGimmiXZcX7uqbh++unphxqI7TNPUgqCjGftX8hJp6KX9DklB15u8yGNqr/J087qPD7pbXYMjpAfj3BchxhZjlXG4FTJ3wGIq3gbAxvjXDjWwyZileie1fn4NrpRzumGClqF6yuk/O2hNv8QUIrTr3dC50Mo+FW3ffkyliyVmWiyHI1w+MpQKovp5y2</Encrypted>]]>
        &AfterUpdate;
        &DeclareStock;
        &DeclarePost;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcH/OhakbblJHICpivHeunyE8cnPZP1rPQ1XA449hNeau4qmAqgvf18zvTy1c6HmvCQxGqFUMe9WLeEpljh3GcBI75NY1jGjwLiF/2SEkikpw</Encrypted>]]>&ReviseCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4b5GsBtulAkZUYkQI+xhYOeqh2v4joLy+GUE3I9UImhj</Encrypted>]]>&UpdateCurrentStock;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4X/dT0/Jf2Dh0K7QZbadmUe7qmhObhu2jl87oY6RH4S3</Encrypted>]]>
        &Delete;
        &Post;
        &ListDeclare;
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758Fep+k/xlMRtKIcdPXjvqdOiF5WEYvGq3QhIs6AcjgGl25IKOemyqFGLJFdghH0W/AJjNfJnXbBjKonUCK0nJY=</Encrypted>]]>
        &ListWarning;
        &ListCommand;
        &ListQuery;
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ZNhZJeqlGKX7sMOUOCtgTiQ5mZYJx9ZCZuWxDUj7TB3ZDFpvAdWhB44rL/RTPRAok43Q7RBUAICXMm9n6E5Ig8=</Encrypted>]]>
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
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtd0Z2wmqVVXZzSMWRtX5LpwPS/CBgLZqHWwRTElAXrVpxEo0gX3ZSm29Pl+bEgpSSdvmRY4JJ83oEYFzir0FLMEtO6dU7oieNBQDm6EonD3bT2WAZXvRnaI9F+jp0jfjKQ==</Encrypted>]]>&ScriptActiveVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4TA+2sXDBh38ZmyPSTtTMvn/S2s1dfSFAJfBaBojoufIdsDnslIocBmY8TYP+LFRkQpXKe+e91exaNMYYY9CLxeirW9/Xkq1MO7xdYiC/aQ+GxOAgNQnD7k0tf/+IlslHuBmPXnck+N7Vkn+/9xiHNLxAny1ISmaEnZtWTBqE1zWmzoglZ7k0FAUn+SE5JYB9Z8/ZDWLCOYgZPwsI7LHxLm2Y6Q9MGmip9qJNr65ohZoTCfRZalHAxZZ9vNXkqq3K58s/KFvUjq1PTOEyc3X+Av7vCvuCWt7lf/Mv+B5CA7WAmsO0CXKClUWGP8AqKZNEQ==</Encrypted>]]>&VoucherLogHandleStatus;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTf/GCNQ3nfY/K2cFIwqwVKyQweKrkIjDVy1RI1m6UFppA==</Encrypted>]]>&ScriptScatterVoucher;&VoucherLogHandleStatus;<![CDATA[<Encrypted>&lWnqTZZnbWWHJm+kKbHLt+MbPlNqf1GB0rO+zwm24e2Ptm4PHNPEq10OBQKmQ78PJaORv6/nYINABRFvGUc40DCUxzJlM3bnAFFus4v3cFdmNUJblEwDQdJifjwjLZVJ5UxbZPW1baRTm0n4HLQm5OzftUTWSERG+VJa/s2opgY=</Encrypted>]]>&ScriptCloseVoucher;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4d520xASsZLT8oUZm+TqWRy3remEieZ5L6UeswMjUpUdXAvBH/1kWB8RhqRV+S1/DvFxvWas/odZbDvxu9qw5zM6pEypNKnIPIaj7H1XRaTtaXuFQq5qpptZ1FJndKlEGA==</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezAmZA8MSCNkaPKj2F/tt/HqB9KuNAwLRN+mioLDJrug75QnxzTUaKpyKkl5hBk8Y+xTCxmDsmujq4lOsH/rwam2Rt13m2bxMP9gx7hRG9/TpjCY4w6HFcVyJJAzjCqc3QYgFEe6vatlUtkcIHOpr2ibeCZCKDGT/ePIAECYAUBEp5TbSRzHyW/if3hCidaBPsnXhnUNbZz4y9LOtmbG4RNCRfOmNPhH5JZF0P2vHE+4fUsDf7NPu2gkGpaXw/hnKIUeOSxfG0UKGeYGK7NnPUmUL0CJ+qDUpt+9R29GWfooluCBQYyvOgE9Krkyei7Msq</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4YVnK1ejlCY/P7zrDRnJM3qpDwj58O8aR7k8p2S1fAss</Encrypted>]]>&VoucherLogHandleStatusExplore;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vwPGtgN7/Rxoi9Ce/Es4ysHScFAPhl2TZUH3E14E5M/Kw==</Encrypted>]]>
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKXS+hg9oNJf66SaJro+9VFbZsudV8WIbRY47RcNApFYINqEczN71gzbpUeFqPPVZw==</Encrypted>]]>&ScriptCurrency;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4V2e2TYaLymEnjGlrgHErQ/erFsnlRQ4VoClNdj6lWLRapcaWTiXB8axrnX5n4z11NUHetAqT9d2E7XIN/c5Y7BvHCz6LZw5zw3oF/HOmTHAWaWQHWTmQlgyOqwGlr9YGxMl9z2MJX557yMS8RSpJ7cRW2PxgmzVrIzxTdSlGkz2CkbKWC2YHQJqY/a9M+0Rsu3o3DSHFLMbNrgvpDnmsn2oQs3C0s1oYZ4638dL6jPUKFh7igQhx0fa1Zj+FJn9KC0XppvxhL6NYY9NmN7JhDFoOk446LvmR/1HD5v9tqN9reJib8iJALzSMz49jgC4Gav1ubYPYP/oU1c3BwKChEj0RniJIyTYJSLjGi6sSXZCkMYZANE2x/3XGAjLQzaAcDPgm9mOzfvOhYRJmb+nvj/y0Mj8C7pmOCPzxG653u2ZqDEI1hJqswwyp7645vFlGQ==</Encrypted>]]>&CurrencyDateChanged;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDHn5yzAEhvQdTBSHxU0Tgv8XE2xSrwMJyqRZMWtm2WBdXmYqQGjY+VGolFPvyZ0F4jNNTpZq1IypGX9EwmuOqrj2mNavAf9/4ESLwuki8rNCpT5ADX8tlu1K8odc9nSr52+57ohHxlrNb2ZXBh6BY=</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&uuBJzt7VCpdYAUlHWNbNb+1P4TF5EeDhz+9W1UbnGjhAgBquNjHFlPu1QCRr+p54</Encrypted>]]>&PostCurrencySelected;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Tceafg9l15/ifmNmrsk5YprSI46C0AYd9BSYyq9+3JdrT1ebtBu8VKHbeP7bzgl3dQIXDlJ9bXL9gAENcRuUvfchW1ukNQH4bixNAJJnKWDFzSJQizf5azZfrwm+w79ZQ==</Encrypted>]]>&ListTabChange;&PostTabChange;<![CDATA[<Encrypted>&TyR0y9UWID/KUgZp0F+wP4mZc5N+9OVqtDGQIk4DjGA=</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22do4ljPH9SFGorQD8H5asGOiNuRPRlFK9RSFv0dlRskMIk8CbPavVv08Qwz/zHrpMP8MLvLhKUWFV2ybBpvm46MdAlRgFQeGnB+P5GZzOb3lP5nlZHsnPOkMFxIsOjMcG9UaEXqUFrOJo47K8gr1sTI3wvOV0Pmf/AG5gUWQZ4W3XNNZzzm6UNXxmBGBvm5IvwrpAv2hPQWy2OO1iePNMU1SxJ4q14xa8HUD1TZtL0FbShLXUv18Y8NqVf51zH8gvQ==</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4f/EtoBgeEETJ2ri7I7vbnm1IH1vIU7lyvUdnHTByYhECk0oIHDre5Au6RgdF/6wpw==</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Xs3kNmvJ//bhYJpANcHKv62eIe5KwVLCTbjTjNHJ7x/</Encrypted>]]>
      &VoucherNumberReading;
      &CurrencyResponse;
      <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4UHorC1CVYZBcXGRPMcMzaeJO3vnhb3QqwkEVVZebKc712im7cbLnyqIXG9+qJYWuKQuJOIQhJE8YOJesouYoL6KNZMyYzUEyU3nIiAQfXNqChXMlpeOR9KCnwU33S4F+A==</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4WQ2llnL3aocsUmADDbRJ+oTCUb97ex7/FoCqJWEDtb4KF1okwJ8j1nsoFH3ykZNF1DNqvaubOCrRV+S/PzNm4YlaRGNfn8v2mDGqn5SxXMFFRePZAjNBU4jeK1iqq4/3oKC/OvA+H9bK4sc6KxT8yKyP1u2NAfoYgEhTetScNcTS57ok/jJZn65XQY3GUWvnIssurRpQDN373etdg14ow3tr+TxdMSx8UxMtHOCgZEiasCc6EOgnPHSLMC5xqFi6sk513vbATOs7rzheZbNf0Pc5RwUfOMZDuI1r8TNPmKNi16c9wuRpbIg4M2yYEWX/+FMzN883A2ss38+J0m6hSU4rmqhtU043+UB9eHJOd7ZeMkOcN6MwthCaP8Llv7S4Jgk1xSGCyvRtoAq0W52kpdCerFU78SUQNGa9bIJYax57kvES/lR1WBTrIDmo14Sv4fA/Hed9aUVOgtc+Pbj6MM=</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHg8r/thKSqRMIbGNk082QfvCESzYEUeUaxa8kIKqx1K0jWXuJnSFPuS68E+lX/gDDJjMgo1tJ933rpwTTivfTT6A==</Encrypted>]]>
      </text>
    </action>

    &XMLGetVoucherNumber;
    &XMLGetExchangeRate;
    &ListTicket;
  </response>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+cJGZzGJXyk3xcoQtv3fcxSmHs+rKRPGFHHV7LU0p0NsoONEdG6tYunHkRVO6+yDA==</Encrypted>]]>
    </text>
  </css>
</dir>