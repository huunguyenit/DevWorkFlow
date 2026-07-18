<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportCircularTypeField SYSTEM "..\Include\XML\Circular\A08200\ReportCircularTypeField.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
  <!ENTITY % ReportMargin SYSTEM "..\Include\ReportMargin.ent">
  %ReportMargin;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tk" allowNulls="false" aliasName="defaultAPAccount">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1" />
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false" aliasName="defaultAPCustomer">
      <header v="Mã khách" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="(cc_yn = 1 or nv_yn = 1) and status = '1'" check="(cc_yn = 1 or nv_yn = 1)"/>
    </field>
    <field name="ten_kh%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>

    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="date_open" type="DateTime" dataFormatString="@datetimeFormat">
      <header v="Ngày mở sổ" e="Date Opened"></header>
    </field>
    <field name="isdetail" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Chi tiết theo mặt hàng" e="Detailed by Goods"/>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="isbalance" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Tính số dư" e="Balance"/>
      <footer v="1 - Có, 0 - Không" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    &ReportCircularTypeField;
    <field name="mau_bc" clientDefault="10">
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
    &ReportMarginField;
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="110---: [date_open].Label, [date_open]"/>
      <item value="111000: [isdetail].Label, [isdetail], [isdetail].Description"/>
      <item value="111000: [isbalance].Label, [isbalance], [isbalance].Description"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [chon_tt].Label, [chon_tt]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      &ReportMarginView;
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3ypD6wIWsxei97UUI0egwICDoXVdjNnZW6O5WtuqwUn0m4kcz7NWVa39niOwofmvSaYeYyqQHFD8/jPkBYU5kvKA87D9N0WOkApZ301OO3N6CpcE5rs5gswL/pyGJrmAhDhdUPYEoMTB1DofWzpPEyXaLuSarHB6gf+7dxwmbVH+FJOKPMcT8vnpR9UFF7RKMlTzgLdoqZbulzQhO6QlJ+5nA3WjGzz0hLmTnaxAq9grfY66Pe2eKAvAUHpHx82N81ZxPjhp5rL3sgXcOzHsGObKbOgaL0SB2Pm8WT6hAiGPr6vFe1bsKgJrikhYoGH8+5vSZbq7CzaS5lx1YthtkKr5GkM5uh8pE0rA1YEOpvgVhRq/4OdCFN8z1/u0beEv3Lwn2PgvIfOVJgb/VLpDhge5QSmdPgE7PcYdL+ez9lyom1c+l/atTjdPc7bt8Y2LkeWNXLvnG0btEcNRFiWSyuoI9Z+ywXX/ZvE0AIMbjeDPhG+l9km0v7jTWdNRTubyJkMufIYHmQ+X6SMbadL7OCDskLrDi1BdDwJUNpn6drEHXWS8o9Cv1wGlCgklJsxTXB8gZOU++GTbykBhNfedg2wdQtihV6/S1VAUL8OHfVg/qwkbWLn/tAgbh74cGTP31jFOrjdK/Y23xkMJsrEMPQ=</Encrypted>]]>
        &ReferenceParameters;
        &ReportMarginProcessing;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdDqS2nZpjMFZD+ajcJqY6S0MraksmenqXt2vjKyhYADTAN8k603T01iM8FyPlNPl1WMI6kgjgjRD/FW1Q3ikp743ZC4kKgqqCP9P+nXYl8fqdfkbcKkAH7v5GBdf3V1SQq/UV7N0MEHVIYYcdFlGVbjalBHhxQQpVGa5YItTqlt3LM2eKzBeLD4brAeFRzRy7ryjHnbYpCCsfiIiFvIzo+kBIkXz3ww0ViIlDlHogvnIpcE/iuqGPf1pDzdXLPOcPTaOV/06KW6DElGkA5ZK+9pGzRdQAo+QM1pWV2pZPBMtDGwRJxNMLCVZHOF93BF5ntCUoy0iAOdlTzckrFTQBHI3+AVfWUUmwSWoNTb6J1aXS1gusPoDDmTybkx8eLKfGfvRa+2NuMxem1Bk2j/K2J8NhpCcTXAH80SLndUpN0aThoClv6XXHZA4QRKamSG6s0emicizuLt2ILuT5Bo1/rGjVE94Hz8xGOQJa6ZhuPUfzRP3r6LbFP6biI4R46xx0wBz7RY5jeNBcPdHb1b/E7uofW679I3w4H6VFIRvkqfMZxRWw6AKclqCg3NQPtR7NnmjtboxxLnikcp/iM3snuLMkXq/vbdi7Hnn+Xd6DVdBY0L/Z/VPVmmttJUW8e2LYVzzdd6Qmvi0VLsegxZcGoCZYXlAfN82lHVTJpy/osXapjPin+wEtrEPp7q8JoPfbAxzwilu1pCTaN+UBvSzZucBS+aKQMZowZCfmcIcfLp5VrbJmQtvZ1pQT28NZtg5HDEQvKfEEQmmr+YRss6pGA+mWKkwGpn3EqDntdJlEXIMRLa6nNIGrE1cl1H9IX22cDqgyxqumCHUA6EHMuRiumyxAtBtyV8lwvdIJy/ii1Beay2711R/YQsm1Krkp5ZaAZlgODeYM3r9VnCvjefkpIsRMYfmjmK8+ltmh9vKBtA2x2GI5BcN4VAJsWKVI0fBnsi3RRyOxOGqBtagwB9eqmo3xajU2gCA9xZEynqUeLj652algyal5j3drVVJqKSxdRffe/wiUoNg7v+K5kE5FoyziINlFMxo0qqpHkLBucYSxlC+ftIg9lweTgHXvUtadaVdBX/ihFBX/eKnRvrdvkcZYMZDvErSyEdBCrHbZj0aQIGHrMLOuOd0BrYibu1YnQ==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifZ+Z8xb2vrymO7L8l1iONMshIBb8irW1YDA7cu+DB6ur11JOuGhj1b0YBXP2XIrznWtDX7nCPm8raIcGqV2RNAf/sP4a9d05bIuC8aZFPACReSn6Yh6f15Zlo7HwfBY7yav8Y00c9ooROw8QjMyGzjMq657SUpxeCdV3tCeBYOFQ==</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>