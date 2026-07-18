<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY XMLWhenFilterQuerying SYSTEM "..\Include\XML\WhenFilterQuerying.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY Controller "rptCashBookByDay">
  <!ENTITY DynamicReportFields ",'&Controller;', '#$query', '@@sysDatabaseName'">
  <!ENTITY % ReferenceNumber SYSTEM "..\Include\ReferenceNumber.ent">
  %ReferenceNumber;
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>

  <fields>
    <field name="tk" allowNulls="false" clientDefault="111">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l"  key="status = '1'" check= "1 = 1"/>
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"/>
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
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="1101--: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="11000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    &XMLWhenFilterQuerying;
    <command event="Processing" >
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2uVBFN2DxkVt19BLlNRoiq1RzK7OTbikTlGNkc6Pyfdbx/rUxet++RWQpuQLXKbxUcd3Zh9PAJWUYJIbFjiPGpZ/cbi4siUmrAHnXC0MvurVK21Bn+LjqIH1UIttDot9vSe4fufF9vZYp7bTlWqnRVJrIa5yZTnyXbdoF1kKImwhzQ9oj72qXldZ8jRfHlLaCJ8M6TeZHlk54gVQ/PkQ6eVXnr/t6XrIJ80xKowGn5i/BU2RObNIPprjbccPT8YPTHmS2u2QNKZaViES191VOH1MeX7IAJfDS6C3E5IBgYn</Encrypted>]]>&DynamicReportFields;&ReferenceParameters;
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcU5d5UltcR8bTbfrnO2d1KzovGjX8PqAdTr/BMqZOmhD21/kcC4L+SaJqqrhB5BWWvlsz9oKBvZOzWBLmCD0FIpUuF0prwrL1RRYO/ehsJWSIkh8RAxcGnXIXSXqsebZLxZLbkvz4+TSgZiNzDqXOw14d0QwgO8kEd3OjrLCAStDmcUs9RF70+AcWvTpZdXZpdU8plgzO2c6k4tDfJ0oDYn+PI3V7+eY1EcmoRSi4qPrOEvOtJQOiuuObkKH/jjnKnqDCHEi8xZ7K8THxGwmu8jiSgsnJD9Aj+DJcBnmzSvG8uoZhoesuDSYvE9ZkrPy1j9sBhz1md238jx34p+z8TxtUuABZPapRNKlGeV6uafj70bLkJ4SMndmOmVKSlKj7GSoHy+Z3ropy+AcHf9DOn8DaD2urBJSE8evFLlsupvm2QcLb+eecG80toVObKoO1s5DTE3MSB/B+dl2fLYhPO6OvCzstbdsJI1F2j/51z9GPZfPxLkjq5o4wJO+GRgX4MS4syMef97wnqMlrTExteFXzPgqBoqGfJ16/lcRBcJmXVUD7tn5/tJS9c0rp05aEpFth8g/sfTV5TmOkb1mNGQ1PMM9A4gXMlKylfSnXG6RbgedykEFi6ig8hgEM74KTvj1PgttALjuO3fyvLhrcodM7w996O/MZvkg/90ojU4dM=</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetAccountName">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu70QZzsPaDwFs+YifbSouifiyQBkdvDG95EJTEdIt66OsuBWn8gR6H25IKQUsJsFqfIUk3Ljza1LHf/P6f0IRpe8Rfknndoab6bM7+iLo6YvDv5N1W3mi67h4Shjmzi1zeNh6pyVSEtXRmP1k9oqyjQ=</Encrypted>]]>
      </text>
    </action>
  </response>

  &OutlineCss;
</dir>