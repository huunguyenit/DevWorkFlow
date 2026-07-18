<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày" e="Date"/>
    </field>
    <field name="ma_vt" allowNulls="false">
      <header v="Vật tư" e="Item"/>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""/>
    </field>

    <field name="loai_bc" clientDefault="1">
      <header v="Loại báo cáo" e="Report Type"/>
      <items style="DropDownList">
        <item value="1">
          <text v="Số lượng tồn kho" e="On Hand"/>
        </item>
        <item value="2">
          <text v="Số lượng trên đơn hàng mua" e="On Purchase Orders"/>
        </item>
        <item value="3">
          <text v="Số lượng trên đơn hàng bán" e="On Sales Orders"/>
        </item>
        <item value="4">
          <text v="Số lượng đang kiểm định" e="For Inspection"/>
        </item>
        <item value="5">
          <text v="Số lượng nhận chưa có hóa đơn" e="Received Not Invoiced"/>
        </item>
        <item value="6">
          <text v="Số lượng giao chưa có hóa đơn" e="Shipped Not Invoiced"/>
        </item>
        <item value="7">
          <text v="Số lượng đã phân bổ" e="Allocated Q'ty"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir" height="162">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110---: [ngay].Label, [ngay]"/>
      <item value="110100: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="11000-: [loai_bc].Label, [loai_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7kX8YD/JNYdtORRYag53t28eSRT+hmwvVA+N/QYpO58JYj3DRTllqhTKqP4PNRgywDh+Pc75MOK8iWw0adk0YnIrT5mYNYch++I76uAaCCqJrWHyJLVtqA5nF33bfOvBTwfHwjQ9PXnX3VMorKzjCannyXZWGka/j8lxr/e8sbO4gxa6F5Hys+3tUm3uwBMJsw1kqpIsTyqasCQ5mVNzvJCb2buDK6LWQrtL8xllQfwsdzCt90+ZGdMYUCKucha8g==</Encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4a9SUGCnpWG0P/AzBJfLaiO4V2fGvJ1RYZwSrynGyGpWkCpjwZAt24AI6zKuOaNLeizJd8mKEPQWYLx5egJIBHZmpkK/t6u3dR7YhsYGPG8yLDQ4AAgyJJQH30TeL3rcyg==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptReportFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGm589nGw3hgv2TNtZkkZj9PkaC1rqAwOgJ0qbuVn8iPe1TBEbzfyhZhh45Wqqmi+sxLtZ3iEKxw98Wr7lJvyj53W73+xDqWJ0PyFv6KgO227wtHaxkXTpPpGnKmR8eqx9wMBDVk6vn79zESzYFshiLd2EgQKdM9yHVKYXb3trF+bfdbuALLibp2DnpFPAU2+ekGHTqxxknU8AB0JAAp+KcHf1F0zRc11j5u8igsy+NWAaiVRCWSuGfWicjwzi262skD9svcPLF91UGBHM/yXLH+SuJKkBFOeigr8JUH0gnzMKIwP+7N47fGFZiMBpxQtxX8FMY2TpuRFJHiikgzQMCwUKK1eOazeoHkpSLDtBj9E1dinJekA9oeNcOWp3D78D/4j12f6JbnjU9ShH7VGp9+FZBDxPefOsp1ImU7mtpDUAOuWHSBZ6J9N+A/L9AtmvkbCs0dL4i8UNHiY+aVPHyIuxZVKPxgBYknrogszL1c/uO69AwoHfO+2MChtwDEE0O5iuLpbT0hzX1PVpp+DDCplQEWu0V6OWvH/UwkqTz8GQBV3QBs/jFhsPl07Ab8MMn1KcRLbHsnJJ/3q4qYzX5Yhw+j/V+Gw5bB/KUWRHDRDgn7MjGhcIP/BRxUn22VoDvJ8C4IqpynONhFia3jhYBI3Y3qf6qlUQZJ2773j8OZahhMl0Lofsr02rfdsDbyHMGvPPKwsGs/UIwLO/67I6mp9wfcYQiAjtdoB5+IU1uy5jM1S74g0FDt/bQfAgT0D23iOuHswktMGiNInNhXYOiMkGhBsZGixaWrfKKySFam6wvjnxR2FrlVgU+D1La0eSTUXFFoRZc3qVRCweZoovWUnWl55vYQZrg6S9DBiItM</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>