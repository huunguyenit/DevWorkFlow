<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY CircularCategoryIndex "1">

  <!ENTITY ReportCircularTypeFieldExtend SYSTEM "..\Include\XML\Circular\A08200\ReportCircularTypeFieldExtend.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
  <!ENTITY ReportMarginCategoryIndex "1">

]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" aliasName="fromDate" defaultValue="new Date()" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" aliasName="toDate" defaultValue="new Date()" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>

    <field name="ngay3" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>

    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>

    &ReportCircularTypeFieldExtend;

    <field name="mau_bc" clientDefault="10" categoryIndex="1">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    &ReportMarginFieldExtend;

    <field name="tk_so_cai" type="Boolean" clientDefault="1" categoryIndex="2">
      <header v="Xem tk số cái" e="View GL Account"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<Encrypted>&mMIfXbnzBWLp1SyeAv8t6n9a+Subd69PNTCdbLZenTBiJq0DpC4bmv5LtQk+qsxsMU+eFCl7OD+wgrWA2ghO1w==</Encrypted>]]></clientScript>
    </field>
    <field name="tk_so_cai_1" dataFormatString="0, 1" clientDefault="0" align="right" categoryIndex="2">
      <header v="" e=""></header>
      <footer v="0 - Xem tất, 1 - Chỉ xem tk sổ cái" e="0 - All, 1 - GL Account"/>
      <items style="Mask"></items>
    </field>
    <field name="tk" type="Boolean" categoryIndex="2">
      <header v="Xem tài khoản" e="Account"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<Encrypted>&mMIfXbnzBWLp1SyeAv8t6n9a+Subd69PNTCdbLZenTBiJq0DpC4bmv5LtQk+qsxsMU+eFCl7OD+wgrWA2ghO1w==</Encrypted>]]></clientScript>
    </field>
    <field name="tk_1" categoryIndex="2">
      <header v="" e=""></header>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="tk_bac" type="Boolean" categoryIndex="2">
      <header v="Xem tk có bậc &lt;=" e="Level &lt;="></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<Encrypted>&mMIfXbnzBWLp1SyeAv8t6n9a+Subd69PNTCdbLZenTBiJq0DpC4bmv5LtQk+qsxsMU+eFCl7OD+wgrWA2ghO1w==</Encrypted>]]></clientScript>
    </field>
    <field name="tk_bac_1" dataFormatString="###" maxLength="3" clientDefault="99" categoryIndex="2">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    <field name="xem_tat" type="Boolean" categoryIndex="2">
      <header v="Xem tất" e="All"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<Encrypted>&mMIfXbnzBWLp1SyeAv8t6n9a+Subd69PNTCdbLZenTBiJq0DpC4bmv5LtQk+qsxsMU+eFCl7OD+wgrWA2ghO1w==</Encrypted>]]></clientScript>
    </field>
    <field name="tk_chi_tiet" type="Boolean" categoryIndex="2">
      <header v="Chỉ xem tài khoản chi tiết" e="Only Detail Account"></header>
      <items style="CheckBox"></items>
      <clientScript><![CDATA[<Encrypted>&mMIfXbnzBWLp1SyeAv8t6n9a+Subd69PNTCdbLZenTBiJq0DpC4bmv5LtQk+qsxsMU+eFCl7OD+wgrWA2ghO1w==</Encrypted>]]></clientScript>
    </field>

    <field name="keys" hidden="true" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height ="112">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110---: [ngay3].Label, [ngay3]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [chon_tt].Label, [chon_tt]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
      &ReportMarginView;

      <item value="11001101: [tk_so_cai], [tk_so_cai].Label, [tk_so_cai_1],[tk_so_cai_1].Description, [keys]"/>
      <item value="110010100: [tk], [tk].Label, [tk_1], [ten_tk%l]"/>
      <item value="110010: [tk_bac], [tk_bac].Label, [tk_bac_1]"/>
      <item value="--111100-: [xem_tat], [xem_tat].Label, [tk_chi_tiet], [tk_chi_tiet].Label"/>

      <categories>
        <category index="1" columns="120, 20, 80, 100, 100, 130">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="20, 30, 20, 50, 20, 80, 100, 100, 130">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>
  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+YUa3VUwXVfPnv/KdvG847f2znxDCrSVaFiohqX42ukKexJWZ3IY4qais7bbtn9ZEhydDRS4rc7us+g6P+bUAxxQdHdhgYvo3846nwJ4G88IeVbSoFae2hbjjOtRW2t6S3WUbNYeNigCs5kb25F7fhGoEMq2PJR8K+HZX5TrYGLRX6SwnrUf4Acquid5AnA+/9RJsPnp6EtdIpCkfbutihEtzYfhu5Reil8qwwpnNE8</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &ScriptQueryFilterString;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD7LkTr6EVa6C5cVPNskRLly1PrSUUFX4X5XQzf8p2oyZOhqiZ4FoWBPF9FpedlAnLfKtGPDgTQ9uQynzzFMQhU90Tqv/IhRxzRVfKb+9FX7yxfKXkC5r6UIRlPYlsGr7Xq0i8MxEC86izXd5hi3l1JhSIx03fP/1C3AAbeW6leisAhfHN2DB7Xr1sx47Il813znmW7+bCFjJ3GhxlT9VJM0rRUSjxipFNXBNaI2yrgUML6xiZF4HzQEX95FdcsFFg3/+v9jFvROUNYwUQEMw7JFyqfxP7klmB8FcGjCX/C76dlf4tKt30YoNoWqGnRSQbloXlyU9YdiOUCQwArOj6QwidALwmfMA7tlwsU51pkb5yBASx40YdITkw7M8vqxdYjRXnsjw78XrXRt5n8h8abQhf/PJZezxjp6DxM1OxUegU1VujGuxot5o3n3E7JBHRDabPrOG64ieKPcZaluVGH7hlUVql5PXAMG48D764CbCmgL8VvaJ4+FOlYpGBUw1V2ZCrcJSiTMSuGWr3fp1un99ZQru45zsX7lzIPxGzo35Sz2qxMhurTbuwXUH5lmcGuxXRONPiRW+411WFAPUgHrun6GLT6P93wppu6I/Xxz2nfZIaoQH4+2DcPPSuvD91foJ7m8LWuuhAteXwOENPuuujGHK9D1jRCyShXuGZCk7sIiFqCwYxFwGfcBX4mvTIa96gSzOwiwXfXOTPEYuA7MRIllqUpSpo2Zm0BocoG4FC7ppmgVFngsF9XdTiM0BexvrrFsU0uLp/cCjiTUzn24YSHqwadfienrvZBJdCcBK/KiZjEoAdl/LQx7xcWUU6yeWNl+NhxYySraXKTCwrUw6F2Zb/uhGBbUYeGtEvHdv/ERsFOPRNvj/t+GCUN5WOBytqpIg+vzY6r0UssEfquZRAPz3h+6aad/r+Ejk6p2bi9U/0LclLxi019XFLgqWFj6wnsxVbuC+bBTBQoo9GSS4hH0nHdrnYmI3/5kWB54+oblBy+c9nUL5EmXGTPBFMpgiyEIv2Mpv1JN0tgqyV1YyIO+4K8JDPmobYX3D2v7qdBF8B64KcT/CYSL1cm98cO3FvwxtwVvOQE9gmB+7CYXxD+DKhttKUMVvpzHbd5OLtL0n9tl4wv3Xa37Q7loxT7l85vekwXf4yZ5uBFDiCLTbywyS3EQU+2UV0qOmTcJ4Z0sdWSYRlRFb+TsIlQxEsTL5Mm6bXyAHZyXyqLSi6kBJA3kiy62oxY3X0ozcwhuqqssS1nmcn9UcElBSvi5+Yq2EwDohrHgqa9FuTqcqTaBwIEjiFI+HpjXUQWEzd0KEF4UZjgffvKnm/TWgns4N/VoFHRhlKWC28lB35hLiU+lMmE9mh1IYkMxiaZfWtc3X2ATG+8d1sHPf2RgV37+P4uUs4gs67y//8ZaljYq3JyYB7ITnPE06sIL1xUtGEcm92H5crVCDJFTqmDsalwz7DE=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>