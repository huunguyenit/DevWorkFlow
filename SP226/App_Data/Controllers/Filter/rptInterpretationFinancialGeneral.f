<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">

  <!ENTITY TransferID "rptInterpretationFinancialGeneral">
  <!ENTITY FileName "'&TransferID;_01' + case when @@language = 'V' then 'B' else 'F' end + 'C_A03200' + case @mau_bc when '20' then '_02' when '30' then '_03' else '' end">

  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128)
select @ticket = lower(replace(newid(),'-','')), @filename = &FileName; + '.xlsx'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, case when @@language = 'v' then N'Thuyết minh tài chính' else N'Interpretation of Financial' end, '@@appDatabaseName', getdate());">

  <!ENTITY defaultTable "V30GLTCTMTH">
  <!ENTITY defaultForm "V30GLTCTMTH">
]>

<dir id="3" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky_nay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Kỳ này từ/đến ngày" e="This Period from/to"></footer>
    </field>
    <field name="ky_nay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="ky_truoc_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Kỳ trước từ/đến ngày" e="Prev. Period from/to"></footer>
    </field>
    <field name="ky_truoc_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Đến ngày" e="Date to"></header>
    </field>
    <field name="type" clientDefault="10">
      <header v="Hiển thị" e="Display"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Chỉ tiêu đơn" e="Normal"/>
        </item>
        <item value="20">
          <text v="Chỉ tiêu dựng cột" e="Crosstab"/>
        </item>
        <item value="30">
          <text v="Chỉ tiêu tăng giảm" e="Balance"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"/>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>

    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList" >
        <item value="10">
          <text v="Mẫu chuẩn - năm" e="Standard Form - Year"/>
        </item>
        <item value="20">
          <text v="Mẫu chuẩn - giữa niên độ" e="Standard Form - Mid-Year"/>
        </item>
        <item value="30">
          <text v="Mẫu chuẩn - bán niên" e="Standard Form - Half-Year"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="11001--: [ky_nay_tu].Description, [ky_nay_tu], [ky_nay_den]"/>
      <item value="11001--: [ky_truoc_tu].Description, [ky_truoc_tu], [ky_truoc_den]"/>
      <item value="110000-: [type].Label, [type]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsBldA0/ofLF9/OM+wYQh5cG4JTXLbN+0UUnLb5+RVLtWM44I/JZ+gl2mcWkLMn7awv8K50OxKzuUvhJ+bar9oH8BISyr5GHhIefYUdemEQ6mgW6cySvv/ZIjrFT4G7qB1TYQpfG4UVCjaca2x1u/Brp</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZyZlKCPNwoHajA60/AjLPGBo8hVMQuUoSG9s+Tb7k2JsO+cd9niC40vrhwkLWKwQ4l+GBr7MIw6VQEZ2FeU9R9PXH6GDChm1ub8pg4FMQ7pBTcTA3tCFswgcv4LAXKPd8LmAxgTlQliCI2O7tor5P9fD6HF4ZycQ6Ut9ZyGMhO3J</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZwS4zTlhyNY3EW+KBEVVj3sOrnq7XqFHtJBYvTwMDXbfP5AZ77y9TqxIwojbNSDBgbBua3WdU6t0bzNnkjpSs9GNRGXxbQgcL7WTJU7QOAQTD+DjcHDP53JF3XD1s1kXgLYtOyuLfClMGWscpddbap5YNOkprtFhNGAQ5ea4/ICbtXmBXZUVWHzP4ZlGFYJZlBR5Fp8S8CvEClb3AvLLa7g=</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&KgiT2k4AdcxFxW1gK2q66joOtiNTU20Pw3Rzt3iRQqFvQcH03OCAD7cuEN+15j6X7orjppHtlGxAWOwtJue0gEjKrEGT5pOkfgmenT2VX8V/9dvX/f4HioxDBLN2Jgze15ddGWAnXaoul/MPBjtAeoFoO1cT+2yucfecy59NYAXvBHGw09TsIpIgMlotrCbpEwDoFwaO9M/MghWSmAdKp8JlapmDBEZ01O3kEzJA3ueMNefey4a4qY8DmHZBxzN/hXfHzdBaatB5WMpuRQJANzEDl3dSaGGT/YhpsvGHlWM=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHQHZ1sEfLBLAU7ylm0Tw/KMAwDvGz8PZuqZn26s16Y379TkGqQ6m0u5Cg6UVwrK/Pg1/j0At7S025XUSyZZJvk09qh8HqJYUoOjuReipBcoik1UZN59DX7gYls/47HU2Q==</Encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4VyI/voT65Uj9ceuBFLF5X5arInMEin8agW1Ec+JaavNpc9lfFKwzhDMT0+OZ88bnKyBA/yn3fNgJmiRI5R7fMctHl6HVXUqXZPTv8UWcXYW0VWoUCGWAytziqanzVkKHEJ6YqJVdqhnPH97F1KW1dPjb3EVHradLVjMO77Pqt1x</Encrypted>]]>&FileName;<![CDATA[<Encrypted>&4ZPjJCDV5/vla5iUvMOC6y/QGS/TL1Hnzb+wektVlgY07I0oV7J4nBOKCfg5f6my</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGNkHV5ZGnyzuPmat1lM/R6x4QygxhydwROxlqHlW/1gChzi+3Wh/nKHvjEbJoTF7BZEJzIB5KCfOIVGQl8URZwNQT7NSHExZehcDm6NOQWCd5EqtEC6lTPq2z4kZOnNvkbjIMgH7+te88YS2XOUXbrY1CzkW5v3LgPCds2/ARNgbVd9drUDikzYScG+kq7toc2tlo6KYhhRZ5Dfk8viawaCNEyDmdP/ZTVzfTaYHfRwjw1tvGcrE4AKoZ1bxMwoeIQE6f6z1RPwa3WZTcZrZEBemz2+nL3X50E77Pa2MdjKrgBnDC8uHKISAAnyrWEYqst/0ePgFthSwsLb9MuJi1O9WRgvDrApEibvkl55R790RaonaVZv9enOI1yWQjCL3tmWkULQYAsjE/YCDpTUzTv4ZUN5hXCvtBX11jt/DgvsTsYki2ks+49s7Kl0U6EKV02Mx60BPOv/H2k76yr1AxcDAR+O9tlBaSItehEoVuMJ4hqj0VFL8gfCAWQLcl5FIYCPtpeItAHX98A30pSSSWCERi+WuuQ2sIv90RsWMqCdHnnym/vTljR8liTqbrPNS6OWorZoIvSUuLVdth9l8ZTqgpYxST/zyMvvQHPp1ag5WoypMCSTR4Vg8ug9GTy8VGdvIyRumtEf4CvQ/yhl9H2Vbw/QOHiJnhXV36btpJP2YBLLm/nraoqZpLO3DD7HOnmeJk9FWgB5JZuQ9KrqVBsN/MY+m4rsrW/ohbOvQxlz3lTnQsv9mZ1h91NP8cn6LuCwD65UkGSKypCbcTP9leeAzzL3e4bhItq2eLR/X6nymGtu84mBIHAR6soUQnl7eNFCEUPQHLL1LEVxui+KfaT3VDkLZRlh1c0maCZysBcip/qgZ8uMatYkuQqapvhLWcke5XDDXWYlfYnij456fH/QPXSCSO+OYvLTptxzxgITw05cy/Sw4gdnSx0lOb30RP4GXahd20ekDAQ9cnV8VTYLCakgAivVnAg93MCOoykdv9xB6VjTMx3jl/n5C2vW8IrhyJTabzS+WYjOCd/QH8XL5zlNkLirqKxG3VAhO3yR</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>