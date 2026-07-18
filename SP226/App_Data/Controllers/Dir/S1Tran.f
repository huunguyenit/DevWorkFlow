<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenVoucherInit SYSTEM "..\Include\XML\WhenVoucherInit.xml">
  <!ENTITY XMLWhenVoucherNavigating SYSTEM "..\Include\XML\WhenVoucherNavigating.xml">
  <!ENTITY XMLWhenVoucherCopying SYSTEM "..\Include\XML\WhenStockCopying.xml">
  <!ENTITY XMLWhenVoucherClosing SYSTEM "..\Include\XML\WhenVoucherClosing.xml">
  <!ENTITY XMLGetVoucherNumber SYSTEM "..\Include\XML\GetVoucherNumber.xml">
  <!ENTITY XMLVoucherBookAndNumberFields SYSTEM "..\Include\XML\VoucherBookAndNumberFields.txt">

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
  <!ENTITY CommandScatterVoucherNumber SYSTEM "..\Include\Command\ScatterVoucherNumber.txt">
  <!ENTITY CommandShowWarningMessage SYSTEM "..\Include\Command\ShowWarningMessage.txt">

  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">
  <!ENTITY ScriptVoucherInit SYSTEM "..\Include\Javascript\VoucherInit.txt">
  <!ENTITY ScriptVoucherNumber SYSTEM "..\Include\Javascript\VoucherNumber.txt">
  <!ENTITY VoucherNumberLoading SYSTEM "..\Include\Javascript\WhenVoucherNumberLoading.txt">
  <!ENTITY VoucherNumberScattering SYSTEM "..\Include\Javascript\WhenVoucherNumberScattering.txt">
  <!ENTITY VoucherNumberReading SYSTEM "..\Include\Javascript\WhenVoucherNumberReading.txt">

  
  <!ENTITY BeforeVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTNoeIsrZM6JPpQhWIA2MX6DmNvvqSe4ieLyipzeFydXhEUvO5exunuDkN/JG44NULeTUY34gTPRjxOPRFChzejB+KkGP29RPTNBacxx56RHhNWWvO0BS2gLIXmL2541WT17jHM5h2jEi+JQ1gVuXzcGw==FastBusiness.Encryption.End">
  <!ENTITY AfterVoucherUpdate "FastBusiness.Encryption.Begin$HyaImPxHQ5biuJrqbcGZ6NpeSWDqeQQhSXhp+3vV0dz+MXYoy2cNVebeF8rxraTN83FcPoMfPOnsSSvGu5HMayZYG7m/hBd0alFbbSziNjyMh0EszXGniUJ7bjdonGSFatXyxYl3nq2mJao8hs9OoP677+ZCT4BBWeJns7fkoruHBzxNSd0j0Y0qzVoFHseXYNm2fUC6Omr4wTgGAU29Dg==FastBusiness.Encryption.End">

  <!ENTITY AfterUpdate "FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQjHT2vn2xmreKKewvv2380sIvHbnGgnhg/s/TVRF+1GLrbsDtgI6sSDGHw6s+ptVFhKFRDhGf8j5wLIe7HiSpCsXraTNxNti2ALrvj+8rJ/ljI5uQBw+v0ZIzeMehCepUNW486okgM6i2W6OulNs1uDZQtwg4wW76zrWjA6TrpaucP91KHRnN8gHjzT4nOpjHBLJ6mXLw6MHOjlDqnZIVboe9ZgHgiyVAzhAQvdi3y0Q==FastBusiness.Encryption.End">

  <!ENTITY Post "FastBusiness.Encryption.Begin$Er6kBCOukK5FxLFOw1tnB+JKRGhuZtNZyp3l7Nnd5s5zHBxg22MjL6gJXOg7TigFickdqxqc/w3ttU8EqPMlILguL6tvhACKREU4qrKOFDBphYDBweI5exVBO85nzyUMFastBusiness.Encryption.End">
  <!ENTITY WhereCondition34 "FastBusiness.Encryption.Begin$+JvSKuOY0uvppa8Y+p8pYWSwqGJe+ZR91dSTDTJUttbdetJeFouvZ0YxjbJ1XgMMTQIhcGZyRJILrU3EAzmAOw==FastBusiness.Encryption.End">
  <!ENTITY WhereCondition38 "FastBusiness.Encryption.Begin$+JvSKuOY0uvppa8Y+p8pYWSwqGJe+ZR91dSTDTJUttaGREfkp1vxMcPaHzz5Fh5xva/dy1B4eq7KQCg6Qi5yjQ==FastBusiness.Encryption.End">
  <!ENTITY CheckTable "FastBusiness.Encryption.Begin$B4h9aG85icI60UrQKqhR23yTt33Nq4WI3eYhRtLFboHNDaMddBbq1E1sPvID4oxYFastBusiness.Encryption.End">

  <!ENTITY Delete "FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMuxBx6p3mxCvv9SvU+Y4W07VnHWV3Mvt0XeIONFdu4Vh8FastBusiness.Encryption.End&WhereCondition34;FastBusiness.Encryption.Begin$mESLYKUGR/20AFH6ZrQMu0rlTlAPPk1d/lxG63x4NKT5f4/gekC9lbJ5MWghyozKFastBusiness.Encryption.End&WhereCondition38;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22aGIq/tl9AJXl2nDyZJ2TSsRImomVT2hriNrratcT+tPWI2okEpwye7BNQdboStzaA==FastBusiness.Encryption.End&lt;&gt;FastBusiness.Encryption.Begin$x+5bXSLravcz0XIrWhUDpzZcE2YazsFaZNKpq6UdELEGO6yMDRAAhB2N6KEMzxNFAaXCXE7yXzrRK5jpAri5QKodYe3LlgGtnH378KlwZwglH21SHvy3Ply3r7bxpAbZ0+KE2MNLcV8JeTtJUe8wBujFAA3DCNuz4BpkSlgIshc=FastBusiness.Encryption.End&WhereCondition34;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4VdaQsgk4Ut+0U6sNAAQriHlFoDCN7YRnmDSADpj/EhniicIBUqVLNCn4OonKHnP7w==FastBusiness.Encryption.End&WhereCondition34;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4UgSegIHCubSTbg3NNkz0dCuUj/4zPQ8Xdc9+kN1JAbXccB7TmU9XSx8hS4dGuU1nA==FastBusiness.Encryption.End&WhereCondition34;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4Xr6PNa/XqWGxTgLUWT7L7sn+06TeFl5zFlVOkGnNz5iMDYL2x/tVEVkXjprX0+t+A==FastBusiness.Encryption.End&WhereCondition38;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4YK8jFqNVCRPz5f55JNHOlPTYyNFWY/43rRC+Un5GZpXug+Xsbp0/69CQMB6BSXoGw==FastBusiness.Encryption.End&WhereCondition38;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4RK5oaE8/edrBboVE/4cQmtkQlud+YzUGv7vJUwvWyUAUvacJ91x7VgB1xUffOFelQ==FastBusiness.Encryption.End&WhereCondition38;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22V6nkNDzMxC9DrJNE2ZsR7Xg6cSxVrRrfOq7/7snJvqT5FsO7H5cqiGZxQyx6P/PCaurjLpX7k5lleijh/Mj4hJ5itqIgIunfdYHM+WMUTLPeDI8qdqwTr8LZljpo2XXMCWTx3kjaCHnVyeiPX76yF4=FastBusiness.Encryption.End&WhereCondition34;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4VdaQsgk4Ut+0U6sNAAQriHkvNWHjIQY+hhBFHaSUPHU7DqdwY1viO5lMUOgwghjMw==FastBusiness.Encryption.End&WhereCondition34;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4UgSegIHCubSTbg3NNkz0dCcoLf8eqIe4E/Cp3zzbsY9wWCmpejJaaf66TFLrCQ9Jw==FastBusiness.Encryption.End&WhereCondition34;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4Xr6PNa/XqWGxTgLUWT7L7uNLu4lYASeZL8FvZ0/mKVd5/eZVizOywPNBTDwRwiXZg==FastBusiness.Encryption.End&WhereCondition38;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4YK8jFqNVCRPz5f55JNHOlMLzri8cbBayrGCnljk88RoXnfoUiJwbpVrTkBorH6LhA==FastBusiness.Encryption.End&WhereCondition38;FastBusiness.Encryption.Begin$0s2Lg1fWBulqwUn0jadW4RK5oaE8/edrBboVE/4cQmt1oE0IPVrzTX6ZMwfzYML5aO1sJ0hyLaBEnk4ZFvmFXw==FastBusiness.Encryption.End&WhereCondition38;FastBusiness.Encryption.Begin$ubZtUSPJWC7E3qu5YQA22dSsrA/ac74vbUYdAJ19DIuxiUlX183MeWGGzkHvuRakFastBusiness.Encryption.End">
  

  <!ENTITY % VoucherEditLog SYSTEM "..\Include\VoucherEditLog.ent">
  %VoucherEditLog;

  <!ENTITY % Extender SYSTEM "..\Include\Extender.ent">
  %Extender;
  %Extender.Include.S1Tran;
  %Extender.Ignore;
]>

<dir table="ms1$000000" code="stt_rec" order="ngay_ct, so_ct" id="SF1" type="Voucher" uniKey="true" replication="1" navigation="true" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="giao dịch phân xưởng" e="Shop Activity Transaction"></title>
  <partition table="cs1$000000" prime="ms1$" inquiry="is1$" field="ngay_ct" expression="convert(char(6), {0}, 112)" increase="dateadd(month, 1, {0})" default="000000"/>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" readOnly="true" hidden="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ma_gd" allowNulls="false" clientDefault="Default" defaultValue="02">
      <header v="Mã giao dịch" e="Transaction Code"></header>
      <items style="AutoComplete" controller="TransactionCode" reference="ten_gd%l" key="ma_ct = @@id and status = '1'" check="ma_ct = @@id" information="ma_gd$dmmagd.ten_gd%l" row="1"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99PKCszOjj/H8rduNfibr9hM5cXSvSQM+nTJCoq3JeuVHkZ/OLOcjGz3v+mETudL6PQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_gd%l" readOnly="true" external="true" clientDefault="Default" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="loai_ct" hidden="true" width="0" clientDefault="Default" allowContain="true" defaultValue="02" filterSource="Vacant">
      <header v="" e=""></header>
    </field>
    <field name="ma_nc" allowNulls="false">
      <header v="Người vận hành" e="Operator"></header>
      <items style="AutoComplete" controller="SFCEmployeeList" reference="ten_nc%l" key="status = '1'" check="1=1" information="ma_nc$sfdmnc.ten_nc%l"/>
    </field>
    <field name="ten_nc%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_px" allowNulls="false">
      <header v="Phân xưởng" e="Shop"></header>
      <items style="AutoComplete" controller="SFCShop" reference="ten_px%l" key="status = '1'" check="1=1" information="ma_px$sfdmxuong.ten_px%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb6xszUdwRjRO9syo2Zq8RpB+mEZmgPvwlEebSNIDANk0g==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_px%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_lsx" allowNulls="false">
      <header v="Yêu cầu sản xuất" e="Work Order"></header>
      <items style="AutoComplete" controller="SFCWorkOrder" reference="ten_lsx%l" key="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and loai_ct in (select case when loai_ct = '02' then 1 else 2 end from dmmagd where ma_ct = @@id and ma_gd = '{$%c[ma_gd]}') and status in ('2', '3', '4')" check="(('{$%c[ma_dvcs]}' = '' and ma_dvcs = @@unit) or (ma_dvcs = '{$%c[ma_dvcs]}')) and loai_ct in (select case when loai_ct = '02' then 1 else 2 end from dmmagd where ma_ct = @@id and ma_gd = '{$%c[ma_gd]}') and status in ('2', '3', '4')" information="ma_lsx$vcs2.ten_lsx%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb6WLdGPbR/otplGt+tDMb53FAzwHcjqdUubshf5dMOz8A==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_lsx%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_cd" allowNulls="false">
      <header v="Công đoạn" e="Operation"></header>
      <items style="AutoComplete" controller="SFCWorkOrderOperationList" reference="ten_cd%l" key="ma_lsx = '{$%c[ma_lsx]}' and ma_lo_trinh = '{$%c[ma_lo_trinh]}'" check="ma_lsx = '{$%c[ma_lsx]}' and ma_lo_trinh = '{$%c[ma_lo_trinh]}'" information="ma_cd$vsfctwo.ten_cd%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb4Dxhmbco5yGLwVkmAaHFFaL1LZtXwqYlCDnIFzwpRzdQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ten_cd%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Create Date"></header>
    </field>
    <field name="gio_bd" dataFormatString="HH:ss" width="100" align="right">
      <header v="Giờ bắt đầu" e="Start Time"></header>
    </field>
    <field name="gio_kt" dataFormatString="HH:ss" width="100" align="right">
      <header v="Giờ kết thúc" e="End Time"></header>
    </field>

    &XMLVoucherBookAndNumberFields;

    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số chứng từ" e="Voucher Number"></header>
      <items style="Mask"/>
    </field>

    <field name="ma_ca" allowNulls="false">
      <header v="Mã ca" e="Working Shift"></header>
      <items style="AutoComplete" controller="SFCWorkingShift" reference="ten_ca%l" key="status = '1'" check="1=1" information="ma_ca$sfdmca.ten_ca%l"/>
      <clientScript><![CDATA[<Encrypted>&zklrcJcvTWecGhoNwtU99Iy0TslxF89dPPDHwAh7Mb7ZFCCggBDPF6hx2k7qg4MHK1CgSfMq9AlWYTA3wObV2+GYSTtUEb/ipS5a9p7osK4=</Encrypted>]]></clientScript>
    </field>
    <field name="ten_ca%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="sl_nc" type="Int32" dataFormatString="##0">
      <header v="Số nhân công" e="No. of Labors"></header>
      <items style="Numeric"/>
    </field>

    <field name="ghi_chu">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="ds1" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="194" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Bán thành phẩm" e="WIP"></label >
      <items style="Grid" controller="S1WIPDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="es1" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="194" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Nguyên, phụ liệu" e="Raw Material"></label >
      <items style="Grid" controller="S1RawMaterialDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="fs1" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="194" filterSource="Tidy" categoryIndex="3">
      <header v="" e=""></header>
      <label v="Phế liệu" e="Scrap"></label >
      <items style="Grid" controller="S1ScrapDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="gs1" allowNulls="true" external="true" clientDefault="0" defaultValue="0" rows="194" filterSource="Tidy" categoryIndex="4">
      <header v="" e=""></header>
      <label v="Máy" e="Machine"></label >
      <items style="Grid" controller="S1MachineDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    &ListField;
    &PostField;

    <field name="t_so_luong" type="Decimal" dataFormatString="@quantityInputFormat" clientDefault="0" categoryIndex="-1" disabled="true">
      <header v="Tổng cộng" e="Total"></header>
      <items style="Numeric"/>
    </field>

    <field name="status" hidden="true" readOnly="true" clientDefault="Default" defaultValue="1">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_lo_trinh" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="nhap_sl" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="254" anchor="6" split="10">
      <item value="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 50, 100, 0, 0"/>
      <item value="1101000000-101--1: [ma_gd].Label, [ma_gd], [ten_gd%l], [so_ct].Label, [so_ct], [ma_nk]"/>
      <item value="1101000000-101--1: [ma_nc].Label, [ma_nc], [ten_nc%l], [ngay_ct].Label, [ngay_ct], [cookie]"/>
      <item value="1101000000-101-11: [ma_px].Label, [ma_px], [ten_px%l], [ma_ca].Label, [ma_ca], [ten_ca%l], [ma_dvcs]"/>
      <item value="1101000000-101--1: [ma_lsx].Label, [ma_lsx], [ten_lsx%l], [sl_nc].Label, [sl_nc], [status]"/>
      <item value="1101000000-101-11: [ma_cd].Label, [ma_cd], [ten_cd%l], [gio_bd].Label, [gio_bd], [ma_lo_trinh], [nhap_sl]"/>
      <item value="1100000000-101---: [ghi_chu].Label, [ghi_chu], [gio_kt].Label, [gio_kt]"/>

      <item value="1: [ds1]"/>
      <item value="1: [es1]"/>
      <item value="1: [fs1]"/>
      <item value="1: [gs1]"/>

      &ListView;
      &PostView;

      <item value="-----------10-1: [t_so_luong].Label, [t_so_luong]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Bán thành phẩm" e="WIP"/>
        </category>
        <category index="2" columns="769" anchor="1">
          <header v="Nguyên, phụ liệu" e="Raw Material"/>
        </category>
        <category index="3" columns="769" anchor="1">
          <header v="Phế liệu" e="Scrap"/>
        </category>
        <category index="4" columns="769" anchor="1">
          <header v="Máy" e="Machine"/>
        </category>

        &ListCategory;
        &PostCategory;

        <category index="-1" columns="100, 30, 70, 35, 65, 0, 0, 37, 100, 100, 8, 58, 42, 8, 100" anchor="6">
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3Q4CoEZ57IyDUmPEXtVLpfswCrevdnuM6icrtLWhv09Iu6Q+bpyHYYDPxmBTxr5FPHw8EbAb1EkDWdQQ6PrAjl+mM6hrjyenHf82NvufBahj74K7SMnZUhZBeLkYJfnaxrHXMugO89KFuX0Qadtexyt2ssg079hcQSqg+ygj5ZBbqT71OAo6MWcqFq2lisHMa4qgsGhLU3LDslLRZXa3GGwcFUF3jlT4pLctfRMYA2Ae85rod6c279m9bTbV3q4FQ==</Encrypted>]]>
        &CommandGetVoucherNumber;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvl04AQbI7kzeDkVHKYYxt6ioX2dlA71hiUG10e8IUM239+JZQP5HN2LFPKnkQnzziC5Hyz0U2XZdjpFNRx2e2bQTN+nUN9/POu8gnXCQVGNTl5wrpR618hCcKEaV6RigyxFRltEvEEKNn2+c7JsUc/uapsNCUFPDmlyaP8+gd4wSw==</Encrypted>]]>
        &CommandCheckVoucherHandleBeforeEdit;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcF/b3IyC6ggX2v6O+lsuFHn1j6FO0HoCgJ6lTN7+gA8SY8vPShiw0ppEm3PpUkcfYyhQLphVg9kYeT7UzZndu4a5Yak02aWAc4mB5YrDcThV</Encrypted>]]>&CheckTable;<![CDATA[<Encrypted>&M+kvXi/dU/Pm/PVr5kRbNJHJfWbHtxMG+gpjcey2LaM=</Encrypted>]]>&WhereCondition34;<![CDATA[<Encrypted>&EMBXdzrvrWGSCBlplPKyThMktZtV2rpd8ldZPtk3cCQ=</Encrypted>]]>&WhereCondition38;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLWP610Wa8/vu6TvdFb7xMcadhzSX9RM9wxBNbXjvYgbOIpJGOFpal7Hgu2ykAXWYVr1VQ6kF+3xJ7N197/ew4/TC4PfjdXv+lHxCow9yUJdN</Encrypted>]]>
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
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4lu5GhEr7giApi2+Qp31OWZQ0yly4yvcOCbkO04ZUCfKPztzCsefTfl3rF3Nr2s+D+syGK0b0ZL9HWOmLYbJ5RGZyGAjTwOJr/CoXTUNsCEmN2OGXXfGfUFWHIaRF3Nds/HS6nS5YOVvUnavbN5BcKikw6YwX4tfGPatPhNxnbXYApTiFqd7iCB27TqDtt3TQCCp9lKxIcPG1nEk5RcP8wQCUuPKpOXlO+lByiPepTxICMYvdX1hrUm9fGiPiTRpGSmhV8atGqQCa7Hh8UroiPmwg2ctYen+NXOLrO/YrTGSu8ZM0QGRKKgtSqhA8lluNfjgmtNZjuWmgzyVzKDxHUFHxiMm+M7aQhIq0Qu8+M2LfYT4iLRb2O+uzs1PXX/dGuS9ZNQKRjgAux3WeFFWWJGr8LavFi1algzwEawRM7EqJNAJMc6SjmWHO2aH6xYO1jGVaFbYun6SGcnJoS11ozx7HRfDB7CowtAP6xn9TK40Y6T5V76QHQCj38jL9hst46LLKGOwoAfWTyD2qzb7Dx/7wXeNAwTWFAjvs1kV9Q7EiHIKnl1V4BujVTz3MrDM/kP2ODViEHElyjOZuu4wCqKI+goTVuwReurKgzPtOdeeHoTmJOSoGTt9E4aw8AuvE3AY6OQosaSMA4mYN9/D0l57nhQvadqwd28CplHGkyNOyUU/Id58fgs3AxzzgsD0GoZxlh1JnmrB4UtDthw3ytyT4X9Py5tjqPA5X0PHz/WQe2A9REIWYb6CZ7v+xj/I4ZcWcDd/DJbWE6D9P5SzxA7cSUxoQCuErGfYJoNxldXwpnIF0Q4peN2bo77rYrmQ6+7PxF3wfrqSvrY8V6MeGp+YKY6Spj9Iwf9U/ZK+ocHieyEcpyK+a3YZqGEW8IBm1td1o+GHhs9Lz6vag1ZdLgeaUHy1O5R6N/c0Kin7HJ+/hhVUq/Dhv69TjLVdg4tV9NH5jV2r5qt03UWTDNLzGj02TjTXIGJ1HuoH85N/hUq</Encrypted>]]>
      </text>
    </command>

    &XMLWhenVoucherCopying;
    &XMLWhenVoucherClosing;

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2VLWpfUz730T3gT5XpYynIvRNIHzQcc1qHIsi5KSoDbPU38sIVQrW+9ApM/V2plF53jmBxkkGhpTTedokXwJV3BhiQNveB0n1ADCDHyX8oNfD7mZ1xV56iGF8crkyvsPPAkL+LSWCVJ/pZeITPmrvSIIgdP0mFnIL6SJ42wK3DITmvHQLFk0r+OIIhq2sTuakQDXb60dVjUIlXplECeUa003tv9J4RsiZTtzu0MY+7aQMWGs94SjK1+2v4Pme9tfYEp6RCiSKWU1l4vSDi2pArsUYWrCjFXxSCSlDze+GCvuXBQgf4el5pgXHmRTcz4We45kYDPz6Ss/SehYDDpigllrjwPbFWzyk1Y5H03vcy0Ems+SOBWHRZT/Eur85x+v5ovIA75/ahylfAA/5o2qxObUM/JPPMEetzQdoCzspjCjzMXUoR2RupmOP7EbqSl1fmjgRsYXgoduRn9ezIqjvm8EIWqiRQ34yFapEzY0P6N4rT8EzxtlgTHt6FEM7LCcwSjSYWksCu5cF39YAnogDf8RQvfbpeI+zfW7WZ4WF2QcU3fYpSAJ2I5ppGNFnj4lKRUM9JqWW9OsZA9N2Pq/zg=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CommandCheckLockedDate;
        &CommandCheckVoucherHandleBeforeSave;
        &CommandCheckVoucherNumber;
        &CommandGetIdentityNumber;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIHVPyuloQsM9S3+zjeFCNMDe5YrcHfrKjEJ4CK7E4UZO3U26xyTB5Lz5AuhD0EQEbwE5Xv+t5WljQOR/djGK/SxqB625mxa2hT+GEGH5N4WXzkIJFwj7tBhskVlGNcrrRduN0GRmDV8eKSgGPbASXsLKcwHv4toteHV/+MuSM/jbmHT0gjabpP17ZNnCQ4j/TxYYWgmIIRrecxJsqcd2gaFjMxNBT8XlaIVLKlDzJ/E2ygu9jjxc3jDgUF4nzdImPrcWEAB9yhTFKIaz/x0Z9mOyfUpgXjQXVfsgfrg3Gip</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHrPBpgtgLzbQquyF4qj8LRILD51+R2nCZprr4yU3WZH6jpVsaW3ZtFgi8bpD70u1wFgQb2v3kZqZ+TX9dWf7KYcOXHo1yV5SCpfkhogvWjJ</Encrypted>]]>
        &AfterUpdate;
        &Post;
        &AfterVoucherUpdate;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7RIeS+R0mzDMxRwdyMPuMpa/JMIc+KMg6gOehOjYmWAc28H3k5Y7pH6xuRK9NoYC56RkWj/cVvsX/5A8eA9Bqf11wj+xT53K4YHxeLiI5B2LGRoqiSuRNBaETScaw5QppWh0ZJ+YiyH8U/Blk92u09z07AbFVnfVHL6qdoeUM09aI4YCHmnQLydZVv49M/Pdx2p8x0zm11043c16P7m7YhB04LzLBaEsVQIITBRo5b6wWRZcS1teWlhFTfHydAy8NGYPxci5aMurKsTNrzcyP8</Encrypted>]]>
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
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G5FM8MW6Rc7wm2dxZjwMa/i5ihAqTbAYL6AvVtAWse/NfvxgpImD5H0b7x7HeKbcMdLD8wSlIgRT96aAbVZzJLyVv627T130rgH4REw2jowpqqSKhYRBFLMnS5+aCpLi0Gn3rYsa3S5GQAk4VCb0e+mJlSAjGE0nsbJEYgshdoA==</Encrypted>]]>
        &VoucherWhenBeforeUpdateLog;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Z9uu9TKVYFHFUnuRWkCu9kRlZsTKqIn8MlZEPMToSOUvqm6CSCwbvI3WESzfGiwUN0pRRL4x50aRtZoEVQ07Q/FGS4KXb2QEkTs+HmMoezgvB/tWQ/Ke0ASaw+CG8eku/fuDB44EL+1ne8pVljFTXJ0jZp4BY2ij7xU3eVRlUIC2WndNpzXaaIY7h+miE7A979Vyvkc+0Jgk0A/mdFm3bzZJt6ZnDvQsQSeLz/RCFoU4P9bL076J4nIUnYjq+C/wZ8359xx7RtROpji5M90Beymlt8H2aZLaxJzQWChOhpAgQsrSyFFTf6biF07XvJmHxCJdvv8AP4WqHwQjW9RexFl5lAz7QmGckv+5dMBbzvUY9Z9b/tIskQyU0bUsoFXjgIg7G0tnVa5qm4j6pjuBzrGsaJnxxYzQh6iSzAUtBUPKRLUGB4KvfVvMDAqPEXaPYjOs0efgUKAfSx571KYv4EoeajPiXzMN9BULCUTciN52so87IrXPr7LQKntiQj5/+UxDeDrLtIWDkmOqN8/LW2lGOBptfrzetTHlnhEfKgWuqsVk/+7pI4Kc83bKToCFw==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22cEP8BhZ4Dou10CN8NPuwCZ+zJYdyTmutE28NyZiHBZwRlefZByxKGPhZ01PVu2+ZQBtyUBtqloeeXn0Qljz6Cr4NX0THL1p113qExqc/Rq7u1g9m71kMx5mqt5njLtxThfOSR0uh/H4vq2uvrDW6FLmZjbI5wBfAXtpszUJkSOAjLIJ4E5IB+V3RYorAGONy/+XBTlIXxskgoQPjlcbVcgrKK6tVnmF6EE+IRJKQ5MvDdlTn7FzQVOGcSuWrZgE/fwaqpLDBlNwJqvU5OgVLOU=</Encrypted>]]>
        &AfterUpdate;
        &Delete;
        &Post;
        &AfterVoucherUpdate;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7RIeS+R0mzDMxRwdyMPuMpa/JMIc+KMg6gOehOjYmWAc28H3k5Y7pH6xuRK9NoYC56RkWj/cVvsX/5A8eA9Bqf11wj+xT53K4YHxeLiI5B2LGRoqiSuRNBaETScaw5QppWh0ZJ+YiyH8U/Blk92u09z07AbFVnfVHL6qdoeUM09Ru33Kiz199lz216v3G1Jt8VCYXju4aRcj9fL3hvAEbd</Encrypted>]]>
        &ListDeclare;
        &ListWarning;
        &ListCommand;
        &ListQuery;
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandCheckVoucherHandleBeforeDelete;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm4tB5LPIZz29630EzVUuIlr</Encrypted>]]>&CheckTable;<![CDATA[<Encrypted>&M+kvXi/dU/Pm/PVr5kRbNJHJfWbHtxMG+gpjcey2LaM=</Encrypted>]]>&WhereCondition34;<![CDATA[<Encrypted>&EMBXdzrvrWGSCBlplPKyThMktZtV2rpd8ldZPtk3cCQ=</Encrypted>]]>&WhereCondition38;<![CDATA[<Encrypted>&IA9bR0kqp+VFVV6JrAmKLYQkbQljKhH+fOXMo9Snnufix3hMMeE/KMz8RbsISlCRdicFjwzXXfImvHdU7zYLBWaxEw+9zU61CXVEU92byU4=</Encrypted>]]>
        &CommandWhenVoucherBeforeDelete;
        &BeforeVoucherUpdate;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6G5FM8MW6Rc7wm2dxZjwMarhww4hjZEmcckCMH7SkliJYVH7DhtneZB6FW/6unYb+qp8X44RHiXqt9VO3sWqjOYmYpA+FZhmok7LAVf+K9h/AOxq26MmILJraGAQ+EjioleGFHdtKevKLzT//TecEuB7BzjrZ1kXsUTB0/vtXHCg==</Encrypted>]]>&Delete;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu4nnKb+iMkfY0Cz/z+s7OqYVwvOzZcNn+Eo0WTMlMfSQU7Yf/Z0C9YWhqA8WgnxP0A9hCnIaWn9Tdkg+yJ/LlKjDixXIQIyNQiziew8yuaHS+zQtmaApJdKr8OEq/yswpg==</Encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0gPYQ8mxLDcjh2k4CN0ys190FEfoDa4tgRuh2KRTzskkX/QAcNa1vo62/CzWOESguo=</Encrypted>]]>&ListDeleted;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22WNW5tM+6Sho8Vjns2OyPfA=</Encrypted>]]>&PostDeleted;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcIaF5R32Ll5k0Mj/ohn8QB5Mip4en6CM7nbzfGM/1nfl</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTGVMFvZ4f3E68EM838mQnKzUlEsA/IGtDzb1inqeoD2h0UfRPWrI20QPM93QbEBr4dxKHBPdnSvdBPBVp1y1kT1bpfaqKrD/3iKvhi9KkdWOtyNbbx5wfWd+tzRHROOnVxnBNJnOhSIA4rPTXpArmItQ76N25MmHQ9Je/nbm6PYvEQ53wE0cvqCwdghC9zf3ZS8GTCO0JbbgZxhhn6/4eYPVQVsFj1lOEzCg57Tsr5ZHLnhCpJh20LVXH9tzaK6waKnnbMZqqxlx/sHI74J1Xy3fsSDMZX5ca+Ek4Q9V74Yu/j1ZARO0850Reu6wLYPnOkyGCnJcPb9xNzqj21yonz1H2vbCZKeGyVtZSfuIsUIKSeQgkCW2tBxO+yXes1OnAbIK1RWl+zojRuItqXh+yARwT8DfTj8Ckjc3HSQB2WPZa05vCPczekFlaOTWHTcS8XDHEA8TTw0b2sdTT76npX5n5nSLgesYxs42FDa0LWDlbtd7UTA1PmcGsPo1IIJ6qeF+epuQHJLRH9jsdJd3rYfB/soEr6MwHvvrla5pUzChQDf9BfXLrgBbBOJcASMty2owKYtWDncmxMsKqIeNBqryAFHU3419shdJYcV8X1VDdkNw4Ui3lAo0G01FQnSZefiznR0vwsfdN3CIU7tUERgApePj1OA58E1sCx/vAnzZrIqdLe0niwxBSX3aUc8M05df0Z8Vpwijf3yEyKtyAPTEvBJZ6AscXDS99EDvTWs/Ng+Z3iwVP0b9rLrAAzLUoBaTff0b0Wy3u16T7kwz51S8Anp8rDmOD1B/nSNZDJVLy14DluBMNfIeKISkVN8CHI3vdCqYNw/TiL1rLd8uVs9QomxBzs+qqJZaWWPvjAHwxKBDBCqqwgD70dm8m6qd8m4QNAYN00DVevMvYpw94k0tNHOqr1JQseobnvsuYEaowv8Mmypr5kbLDQT2IJmoZQ3jL8DpHvrSu2k+hC7f33UrxZNzsp9pte8TU69K7b9BwlIVQGmBPzVgpXKETu/vdbiiBvNPuxmw6DK5ulsENnV1NB93SGVHver9t0PXIMsccoktnZzinsYNx/1ynD5vKDW7lG1ZXNbT82cSKMUjbZvDQoI9yKgP2llNzZHRUxfe</Encrypted>]]>
        &ListChecking;
        &PostChecking;
      </text>
    </command>

  </commands>

  <script>
    <text>
      &ScriptQueryData;
      &ScriptVoucherInit;
      &ScriptVoucherNumber;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22dhKnPwvcXnRadCbrYCBMqkyoFtuFJNk/YQjbULwpJb97V3wErUdUSCGbNKHfHOkMiYJLRkekPRcI9W+ZON+DYUknDlaCg10v1M1g0tk5rf/4uIUV7ZEcymjJqr+MvdStu7XHcbTf30tlDTWodeqPX0OpxpMPmgBtL49TML/OpFbSMf84WdDGpeuLcAnC9qvMzAEeqIEMGHcKRQjiGUsV188v3jSTXCSSs0F9sButtACVXbdn61aYpCbHJSEiEpLWwG+2I4BbZirzlnJrRtu170yhsPcqEMol9UdiMeLmSwg3aCS9YREYD4EJT7h6dvrqSvjRJU0FZ9cIOp2BiCJ4KNgOPBHAobqrZJeLeKBcVhiAOaxRBWg4Bk9rOAmKg28CD1znOEHdHWYWd9GTDKhxXg=</Encrypted>]]>&ListCreate;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostCreate;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fBS5NpK+Q+x1xx5i0dEfTfe7ODdsFDrZXod+f3uxQ0+auOqx9SFGe27xHLcqSzeZvMhGPz9cZyKuSfeaFN8AiFRaEt5tt+3PstA/H0DEvGJhES0jT/2KnkfaSc50Zxd5ZZwJh+QxE9fQC5RWXH2V+bKaNBPz8kR26i+ncOs9Px/WgzVslywWXc5m99zyZZCvvasEhJm5ovBLyDCOPqKlzQ8IOJ/LDICNk2yxMPHq7q8bnSWSPSU/aQZyXjie6sXYoRFdTUeh/W/b1EY+poegKkYl35ei/8XjpPciy+bT9Rvzh7rW2zNnZN75oNzpNOJ3Wd3goyxRl6ojD/5nVJulW0YX3CPu+durSEKuOvPciy28uFrn31YgCXinf+fH8gyVJzVG7VgPeS82m9Ig0G45APRXDOOWtojGugPvaCjJ5rfkRSe9FOsbTQE6Q1XE8OPx/DQZKFQG3Vl5btUpLvmkDM=</Encrypted>]]>&ListDispose;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostDispose;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22aruzzfSXyQiASwIXNWDpHIsRvCRQ9J0uy6GuHteRq6VP/mXJhinRZ9OMCUj+5Pyz1+aJrgX7t2EWKenMY2iaVAtx6rATjDXD5c8+uuGacezKHSFGSvXrFO3PEGfG6iDQsMwt6lsEeKnkrUt7kGhJwyYXOltN85TQwMhwjY3kYsck4gLyAF8RoyQrtW4YreSnX8l+mDnVPonzV/18OczhfkVO9uVy53ZqRH1tC1UzkbPM+NxMtv+/BUPlNhNRyNlujg3/NJsipl1dgRS+xjy3sIjlazBXAd7T8RcIXoxAQ+3IFw+Zes0OGxLIrpPH4FeXdyjzhznD3jZjjKYGwqrBK2D78BRQaQEBW9RIT8c8g2yDOUnvfKp0UPrO8qxucYbGw==</Encrypted>]]>&ListShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostShown;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4T7rjwMyfNaYiScZqdKE7vx94Z5ta1YH/L8FdXVlZo8KkyM+BtQQNcZk7mdKL5G+412oWvhH4jvXuUVFXIhMRVJcdO26SRO7VINAssS3FPQ3XBpZf8AAse56PJYdv/Aqzw==</Encrypted>]]>&PostTabFocus;<![CDATA[<Encrypted>&N5mdyFZDg+f+N1+BWADWyrbHcGKgLQlHwzG9OeaJurRpUxtRpsiU/VasauyUSukxpCQIczZQQCxY95rZRYLk3kFTMes2G1G9zwVBKo33Rx8WyZnZRoLnY2bWqNL3CQsN</Encrypted>]]>&ListTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dY2opvY9PeFs+oLs+HGxWE=</Encrypted>]]>&PostTabChange;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RwsygCMj0NC+9aWOEuMAoGMuPGf1i2QgLtlqWPUDvUa0OOBBdN0RXMX0AnbVIIduLRj9jX2P80CUcEX4qywyT1b/b4y96WxfakUhO+9kEkvmOwLzO+5Qd7SBUMm492PZVwZPPpYigsNBNRJZ+kAPnENdGbILkeHimR68syOYaZfhTc/YVU8FwRFoAqhte02k+fpXKIBrRo7yyulUmhmp27lSDvyu8pw/2sSEzv2cQQh0Lmk98x+sJsqFJU0MgrdJtWXZy2H710ucuUjPf3ZLF7SeUoddid5ghCXwkX0jCuAUyQU52xWk02Yt82sblKYhQEOarW8EZU/iWrF4Nh2F2N8aIQPEFzNlkdaOzDwXUMLrjcH4ZOHYmFLGcr2aifduOeB1uOhejopz+uouPZnu5D5E5B6MiXaFJ374G/3j/WmK2ySVw9tqVvPXu7HXpJZ2NzGU26OSS8bmUOBkG8HjlGb9JeZ659YFF0doKWDuRzHoves2ucRmKpRGTksexdP+vlNGuRNMI3pzqV97IEH68c=</Encrypted>]]>
      &VoucherNumberLoading;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkgSk1CEulnrcUS2bGJ+jOy4qcvoSc+KbiDgJqhIblRVE6pAhayUiFV/xqmW7cGszw4=</Encrypted>]]>
      &VoucherNumberScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RVWoVBzgrk2vhZIk4gPxkg80ZvqQY8om7J+LvkBkXaQH9BM0dz9fp0Uez4UruTjJGPoQRHPSjfDdbokTX24WubIFvijZk47Sc1CWB/qaMxf</Encrypted>]]>&ListScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostScattering;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4ar5f79axIAeYkY49+CUAjG4pjQ27Y9E8daJPUvVNQA3Kadgw9PlpDiyxKgHk8tCYbvEi3xCzlGQYMAlUTO1GUfhBQ+vZkb8uv+EX4AQs0LraMkhVknTQ4ORrURnbo4vGwVZPzHI9z7FEp26Sn1Fl0XOQhYdx81wsRvzKPdaSIjFo/lJSSs+bLTJoRDe1BSDRy4Sc3Yfg7r+9tjusraxQ4oTaLrksbafIP2RrEY+IiOZUY17KJf2MZ+LLhCo22L+WSBiLXslR4fEyelvi2vpwu8KIS2h+3MOXoc9KaOuL5JdrN/Ju++cUbKFwhJTEkj36i7gkwj6wlMfxA/nC5dRm9iCEGvxpuhnOHaVGe4vYZbWeMj+l78kpKsvHXlhKpYPsUY7PoeKrlPZu08Q9LoT1R5ng2EtsHD4ComjjB/fYwpK</Encrypted>]]>&ListRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Se2ZPyzbZ+hiZam4ChVgW4=</Encrypted>]]>&PostRefresh;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4Th/PFDkGoLpy2TTZvHIwTBagzWcjK1CTU3c47x8zNRZ</Encrypted>]]>&ListResponseTicket;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4QTkFFG6mug5bCfbriUQnmZx2ZbXXckGX3n1davYduSm4fXJKbr0Ilo0bHhx2IddWdjVQdsPSzfLy3ZGf9bgit4e13+3N+ltSfn2LIAxKg8tgHoIPXC/6hSpr00WH1X1w+iwjs2l+kCu5jGxJ2Bi7Aa4phUvZUUOXCaqBIt+sRHFP+avmLcjOPddNdeAhRaHinPdGHCPO4eeKVKJzJmO1J0hhG7R7kWBvaGMiRpiJfs0DqqD0l7GI3UcNPvydQeG7JABqJ18oVnFY5b/Xaj/3I9Dhj7HTSFcIdupiX3MSCa9mzh9bWs2GU0S/X5O68QpzClLPF6gA9dvKBaV2EEkEt9M3xyvA2sY8ClRDkk7kum2rVyj8xDaFzCLJAmM8OMBw9ecy2onnndzcuBnDd+G5JDipzV21tGGUmsEHqO37cshHBf0li6VJUEvwep0ZFAPDnlxwaocAL4ShsObuAXo4w6J4SFzPeHpKEbFdJTTgohB6Pi8OnKQ3AISG37W9cMOQ6Eoa/d4UT/pPowWs4djLnnl6fnJGiOjNW4WWkUPBDfKL4Ak9fJZaphMFsFtegAi85xfUpPM4evK/TSE+u7PRIuxVdKjYFAT3SuYNwmraJ4fMY9LXdAEgzb3VSVFWDPfHItJH4Tbnv/wBHXiSNgimxVR8s5qWGFi6xW3I3XhcxYIPnFIhO+WlCwkS2jbx0BM6IXSin7M9FNVhGuKj5xWGdEfyJtJ0r/5OkzeWu4pQkqA+LCvIyI/3rBh20Ju7zbssaOU3CuPveRIu+prCJnTeun10PnwT1O8joCQcHBGKSBPNK+Jf0qi6Na3QxZcQauUGci7NGay4rjU+MWHiwWQzcbdfsY9ZCPRxcTSHO6ZfB1TqmQld50Q+491aOv9q4QI7Kv2Z20tlA8C3eqHV711SouEwW/ilI9PNNvJyIT5a1sqJSXn1S7rJOBSToXBy/0BNqzLQu8ZDNarypax0IHBBBeO0zlMaPmYth8gL5Ug1yWkSOJ0NpwDUHiq7hMN4L2p5g==</Encrypted>]]>
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

    <action id="WorkOrder">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm6/tTx188Qyy/no5PlbKbKhzfYavW7fchIcjsSQTAeNkIc8FAdGbnNhADHpn11B3wdlqXFgSHmdwHMOnwKsqxIaP03KuxumFYNbYd5xr2HZERk8lfKPVehj2mm2sB+ZgWc=</Encrypted>]]>
      </text>
    </action>

    <action id="Operation">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm7iSIvAZ1HbMMwl1LuI0L8EzBVkyy2VHjVG8jRZwi88dCNfbV0QKb9nR7cnvF0xwu3QKyjVk3zE9OeVSOBExHqS04+My8rL8guNPf90Hl7X+jcLzNun7irQ/cl3qHrMSpA=</Encrypted>]]>
      </text>
    </action>

    <action id="Transaction">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPsDWV/47ztSDEgitarYFiB+AKsWAJqqob3qOw7zTlHgX4f7mnJguIr9FgFphda03qbfeqxRql87vmgnZzCghXR3SgX5JXpiV1ClrpXl79+FpTTqciQviz1I0Gy3ESxGRg==</Encrypted>]]>
      </text>
    </action>

    <action id="GetVoucherNumber">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm5nl147b+zDhVLIuMv6gJKk/1RXaelxAkPJFfCxhcJJS+bmoInaMaXGfeaDg1SAgAvEH5tR/57UPAx7DcnnYdM3zq/3PWK5wOYAGOcXj1wwKGuuUDgD8kqrBRY906Aw+9ykj9zXm4YWbkIhXgq9FEON</Encrypted>]]>
      </text>
    </action>

    <action id="WorkingShift">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm73RZE9lL0F+HlP9pEs80heetci304hPN7Wht128TDM6RqCSdzLG16gtTxfhtS1NsDN2veZvRoyf97+sdfnIZG5S36pnKzqSX4Wx+SfPr5JGQ==</Encrypted>]]>
      </text>
    </action>

    &ListTicket;
  </response>
</dir>