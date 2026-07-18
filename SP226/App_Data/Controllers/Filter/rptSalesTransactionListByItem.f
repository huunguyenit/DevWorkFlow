<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Controller "rptSalesTransactionListByItem">
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeFieldUOM.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">

  <!ENTITY Identity "&Controller;">
  <!ENTITY FilterExpression "f._filter$Expression = '&quot;' + f._filter$Pattern + '&quot;.indexOf([ma_ct]) &gt;= 0;';">
  <!ENTITY XMLGetParameter SYSTEM "..\Include\XML\GetTransactionParameter.xml">

  <!ENTITY GetReportFormLimitRight SYSTEM "..\Include\Command\GetReportFormLimitRight.txt">
  <!ENTITY SetReportFormLimitRight SYSTEM "..\Include\Javascript\SetReportFormLimitRight.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY DynamicReportFields ",'&Controller;', '#$query', '@@sysDatabaseName'">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ" e="Voucher Date from"/>
      <footer v="Ngày chứng từ từ/đến" e="Voucher Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến" e="Voucher Date to"/>
    </field>
    <field name="so_ct1" align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="Chứng từ từ/đến số" e="Voucher No. from/to"/>
      <items style="Mask"/>
    </field>
    <field name="so_ct2" align="right" dataFormatString="@upperCaseFormat" maxLength="-100">
      <header v="" e=""/>
      <items style="Mask"/>
    </field>
    <field name="ma_kh" allowNulls="false" aliasName="defaultARCustomer">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn = 1)" check="(kh_yn = 1 or nv_yn = 1)"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>

    <field name="nv_bh" categoryIndex="1">
      <header v="Nhân viên bán hàng" e="Sales Employee"/>
      <items style="AutoComplete" controller="SalesEmployee" reference="ten_nv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_nv%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_kho" categoryIndex="1">
      <header v="Kho hàng" e="Site"/>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="ma_vt" categoryIndex="1">
      <header v="Mặt hàng" e="Item Code"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" categoryIndex="1">
      <header v="" e=""/>
    </field>
    <field name="nh_vt1" categoryIndex="1">
      <header v="Nhóm hàng hóa - vt" e="Item Group"/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 1 and status = '1'" check="loai_nh = 1"/>
    </field>
    <field name="nh_vt2" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 2 and status = '1'" check="loai_nh = 2"/>
    </field>
    <field name="nh_vt3" categoryIndex="1">
      <header v="" e=""/>
      <items style="AutoComplete" controller="ItemGroup" key="loai_nh = 3 and status = '1'" check="loai_nh = 3"/>
    </field>
    <field name="ma_dvcs" categoryIndex="1">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" categoryIndex="1" clientDefault="20">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu in chỉ có số lượng" e="Quantity Form"/>
        </item>
        <item value="20">
          <text v="Mẫu in số lượng và giá trị" e="Quantity and Values Form"/>
        </item>
        <item value="30">
          <text v="Mẫu in số lượng và giá trị ngoại tệ" e="Quantity and FC Values Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="transactionGrid" external="true" clientDefault="0" defaultValue="0" rows="126" categoryIndex="5">
      <header v="" e=""></header>
      <label v="" e=""></label >
      <items style="Grid" controller="TransactionFilter" row="1"/>
    </field>
    <field name="transactionList" readOnly="true" categoryIndex="5">
      <header v="" e=""></header>
    </field>

    &ReportDataTypeField;

    <field name="ma_gd" categoryIndex="2">
      <header	v="Ds mã giao dịch" e="Transaction Code List"/>
    </field>

    <field name="ma_nx" categoryIndex="9">
      <header v="Mã nhập xuất" e="Reason"></header>
      <items style="AutoComplete" controller="Reason" reference="ten_nx%l" check="1 = 1"/>
    </field>
    <field name="ten_nx%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_vv" categoryIndex="9">
      <header v="Mã vụ việc" e="Job"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" categoryIndex="9">
      <items style="AutoComplete" controller="Department" reference="ten_bp%l" key="status = '1'" check="1 = 1"/>
      <header v="Mã bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>
    <field name="ma_hd" categoryIndex="9">
      <items style="AutoComplete" controller="Contract" reference="ten_hd%l" key="status = '1'" check="1 = 1"/>
      <header v="Mã hợp đồng" e="Contract"></header>
    </field>
    <field name="ten_hd%l" readOnly="true" external="true" categoryIndex="9">
      <header v="" e=""></header>
    </field>

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="186" anchor="6">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11011-: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>

      <item value="110100: [nv_bh].Label, [nv_bh], [ten_nv%l]"/>
      <item value="110100: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11011: [nh_vt1].Label, [nh_vt1], [nh_vt2], [nh_vt3]"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
      <item value="11000-: [loai_du_lieu].Label, [loai_du_lieu]"/>

      <item value="11: [transactionGrid], [transactionList]"/>

      <item value="1100000--: [ma_gd].Label, [ma_gd]"/>

      <item value="110100: [ma_nx].Label, [ma_nx], [ten_nx%l]"/>
      <item value="110100: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="110100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="110100: [ma_hd].Label, [ma_hd], [ten_hd%l]"/>

      <categories>
        <category index="1" columns="120, 30, 70, 100, 100, 130" anchor="6">
          <header v="Thông tin chung" e="General"/>
        </category>
        <category index="2" columns="120, 25, 25, 25, 5, 20, 200, 130">
          <header v="Lựa chọn" e="Option"/>
        </category>
        <category index="5" columns="569, 0" anchor="1">
          <header v="Giao dịch" e="Transaction"/>
        </category>
        <category index="9" columns="120, 20, 80, 100, 100, 130" anchor="4">
          <header v="Khác" e="Other"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu3FpC9Jock0vSy2vnVGePvnZPRiKEfPKjxHBmJnvU1lVtlo+1Oh7odASSFZnsPBg9Zo+rjYXqzXYFeMYQpMONV0=</Encrypted>]]>&GetReportFormLimitRight;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcM0GUti1kCp50u/Joaj4mLrRFBFrkg61EVyh0XGpA19zx05m0tH1OgdPSKya+jhQB92mZjn9Ot4aMXMuRM9wUx/xclTHT0ytQP5YzsDNDeJ2</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterClosing;
    &XMLGetParameter;
    &XMLWhenFilterQuerying;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8aw7QQl6GpFTR+nkvjPXzdj2HRtG22WqJUlEnMZgp8ZDfEPrGnfRicyak4zw7pWHRQnaoL50IWmYpC0WVRvT4e9rXSPXuPpF/ozJwkYTk/KQrlobu8vt32mpy/i8q4BQMr/RMYbYkf+WdTVFw8+WaQCpjR2au1neeaRWSUClx4xCH2cB1rJNAnI/W2c+gXmCtDAD1ROFtRgoqGv2qYWfc/4ZlCsLavYr7YinQi8QbY5</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR74g1O3m6RoZRPRYjifX/Aj8PFYLrshnbZ3JwkbE+7wwKoRhqi+IAcuxyl4OcA1ZD+dq4PyqWsZpMFSDOWpkwUSzX9bspyxgoJ3XJXSsAo6QwIO0A37S54m9AOsizxo7hkXF64HzI2eSu8NOybDbEFoQ+j7dzzRRR7ns8V0W1PILEx22X3KykP0Mwy7n6jQmca9+eHviKO9RNusEZWShlVrpK5Jo+zZO+ZgdWlmP8nbEudB+IxsOj5dAvcnCkdnkiLtLqHLtyTsjkFiL29ZzPPBQs/7N/xQEqvwiv8MdwzgmcKBVEOQsdbuT9b4Ttvlr4jodf383NMoqheL7P2QadxGXy4N+3VUTeYy7Bsz78c1a+v8tdq9o9W5lNL0zRuXnRVw==</Encrypted>]]>&DynamicReportFields;&ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      &SetReportFormLimitRight;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtf0ePKWMx2z3mvcfODpAeD6TbO3opaqe/n04Q34AtpZ1kFiw2I6YDJ5nIJArEF00UAss8gDJRM+iNvgcqKmC/nvk77HX/1DIdFlpZWa5luDNHsCXl72pjLyzWUGZHjCQYHYmc/Z+6TqICZKNXZeEpwPmsXUxxFyORpLxa9QLx7q13pVLbD9oFlZFu10TAXXdPGV5wbFTGuu8eqbjx0hbZ8mLnl5PvRKRU/doOt4k6fjp6VFOInUo0kOxocBIHl99r0ENdamg2kmoqVIqWc1hx0D8r6AZhvyLvaWKv6VNpjn0C7tl/A41lVtRvlZ9zC2S7HK5pvWwvzvIJE4a3lMzoqeYy/fjmctaxk9KiLUC7JUm</Encrypted>]]>&FilterExpression;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4YqEsZRqYUKJ/dSUGTfsj5lTTNsHydE2I7EuCjH6LNfN5lZKCXkPNHLNTAJ7oQaizdmk3vMKQ9yuLT8Ue0/PaxBbZbIf1HwR+8/5wmCoXP8z8G2vWW/VI3hK3HpoZoqWDfUh6qzLKUnQrKr8cm+vzBxzvyHnEmW7OH/JzSAAE4+KQcUhTp7I+HbyRVuiCuWa8mZ/J9SBSTYbpdwrVLdKKHM3qEpFfNP3rWQJRt0VlrjHvmJvAc0SGqC2zF6YJeQPzu6HjOCTxZfJlxf1TLxLR8NN2x6aHU2e6EdhJkAVcGl1l+n26OKEuJnJYCHDLx2URRZaD3aWxu7lqXZXoaoZsU0+GeiUFHaQ8YjyqtKO6iw2F2Os8L5vwOjkCdzTNCZysC15DNcYN+nU5QxR9o1hDZzlKuZl4RXIYeNSbsOhpThLu9sb9qNYi5bdU6TIhbKwRDhEi861RXvimKPz7vjUBIsSahIuitYEfBpUl75fyBq+iSFKaLosSr1i3hTChZlJa1+XQZtAnS+AyuQgqref5dAKYmgc84hJVPKy7mHOfurD1oysuWbu2xTQBwZz6JAqIQ4aLOQ9S4zMKqGREoX3e2UpJdymvn9xECRiAbdway/nFJrBQpQ6YqBtLRHtSI5QEM97V85AM72hPnr4oV1wi16NxSlgZ60Tu+/1r24YOROmLGhGB47NwH/qMbIg7Ct02yUUzXMlLuaWrgtm6gtAm2lAxRhifeS6cJM7MUzPJEj73PR9TwdpeET6OTtyHOAjUQVc1YaPy73xI2waN03U3b0JzDrtr6NCwCyXjp7ryc3w7XDbfFcYR0rhbVtJdiaTOGUNWY2MT72C+YADe8eJJie+bOgzHI+YCX07GPN53Op7wMfDKWppWS2C1yfrmjW1iPT0/Zwxm3DFx6e16sRpDbrwrkeQR2uCoTa23IiiHBVdMlgwJpiryWxaXGrHTN3kVPloFHAA/vuahnGGaVw3SarrwjMSE1GjDsavnyAWItksIy6RQmFmXemp+fmhtQJGikiImD3gNIdfGgjCsvV6GPFINrE8hO/6QKqNVXC0nPhxuSCScgn7ER3Er6nKw2u6QZTF3jlUg26IzeKmfQJKyl9lWXfV2MvDfIkVDJCmDpyz</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetCustomerName">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifiyQBkdvDG95EJTEdIt66OthR9eO67QSqiPINLsmM4GN639dLBBQ+x1X9ZnHpKCakJyJk1BwWLfytkUvQjSAwAffnXj24No6yIXYMhUdViTSbq1sF2zMqHa5SJZpOfNpo=</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>