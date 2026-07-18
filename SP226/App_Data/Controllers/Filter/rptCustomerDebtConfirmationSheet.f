<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>

  <fields>
    <field name="tk" allowNulls="false" aliasName="defaultARAccount">
      <header v="Tài khoản" e="Account"/>
      <items style="AutoComplete" controller="Account" reference="ten_tk%l" key="status = '1' and tk_cn = 1" check="tk_cn = 1" />
    </field>
    <field name="ten_tk%l" external="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh" allowNulls="false" aliasName="defaultARCustomer">
      <header v="Khách hàng" e="Customer"/>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1' and (kh_yn = 1 or nv_yn = 1)" check="kh_yn = 1 or nv_yn = 1"/>
    </field>
    <field name="ten_kh%l" external="true" readOnly="true">
      <header v="" e=""/>
    </field>

    <field name="ngay_ht1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Hạch toán từ ngày" e="GL Date from"></header>
      <footer v="Ngày hạch toán từ/đến" e="GL Date from/to"></footer>
    </field>
    <field name="ngay_ht2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Hạch toán đến ngày" e="GL Date to"></header>
    </field>
    <field name="ngay_hd1" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Hóa đơn từ ngày" e="Invoices Date from"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoices Date from/to"></footer>
    </field>
    <field name="ngay_hd2" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Hóa đơn đến ngày" e="Invoices Date to"></header>
    </field>
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" align="left">
      <header v="Ngày báo cáo" e="Report Date"/>
    </field>
    <field name="tinh_sd" dataFormatString="0, 1" clientDefault="0" align="right">
      <header v="Tính số dư" e="Balance"/>
      <footer v="1 - Có tính số dư, 0 - Không tính số dư" e="1 - Yes, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
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
    <view id="Dir" height="">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="110100: [tk].Label, [tk], [ten_tk%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>

      <item value="1101: [ngay_ht1].Description, [ngay_ht1], [ngay_ht2]"/>
      <item value="1101: [ngay_hd1].Description, [ngay_hd1], [ngay_hd2]"/>
      <item value="110: [ngay_bc].Label, [ngay_bc]"/>

      <item value="111000: [tinh_sd].Label, [tinh_sd], [tinh_sd].Description"/>
      <item value="11000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="11000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuwYr2yQAbtOXS+fWW3PkYhLlh23qOlaZnx8ygGIBXkkfsGE9df5O0PhAc7h1wy4DKqQjDyhqyd8HgfABisp975wpuuMBhJyyYq+ZGipJ3cwBZMoWWJVWzMz7UJcpCwhpeGK6ydCpJTBbEP+0/U6Gd8GveENA23VKrffoRX/TXTHOgoWz0lSI4Xfy5EDZEjSi7ndzuwo0aS+QG3co4i6HZvD3Kpgu2NJ8kD4+lHbMP6xxIdBHiA1ertWtLkME+hc03y/wSRqZdw+GHmlurelz97fhOe53yXmrKsLnlzfS4o/ePYR8Ua1svboBtyTkEBYk4q3vKJ/eCvuu0OsVkRPGMjjjHPs3piZAPnW6If2YyoqOf0si+SdgbL/sOFbcSGMdTixfgkn6eYz9wSpcO97rrmVo2G1nTSj0xB1gbbPjbv3c+x0Tp1YcM+r+98IMQbZFrrTBy8TzZXBMqgmskl1uMRz4lXEBFQ1nCtsB4vffGTYlVIByziJcAn20MKjggUMcCSS2n9MBzL5SnYiAJBM3qETY1pfvCIFqiF0taILNSbi/FOvoXfIZCf5ZEcgTEUSFz6ltZvqVABrx09Nv2KZs/Ch6KYyfNnq0B5G+cNmzPrN4YMEe4OBj7nTgbkN+coEaX11ejp2lcqMh9mAFdwMFLpJR1VeVHK+cDwHY7X7kUxIh</Encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUP/1R22xXsb+HK8z5v0XkAtyX9qVieEAsEESD4+eOGTedUZbOyTyeiZhvKMLPUAKFbGy9dNx5uOsnch8lCxd2iqfAzaE32SZg7XApiUA8eLTmEIEsZzyC80jUcXvPvoIaTteZUo2VYpXiRoG3EoP+zNSiNyt9cADxtM0SFSjlqhYl5HYwoc1yIRoovct/WstZu96P/tWztGOzkk6/pSDS7fDT7MxZfrlFlUjzypPtVpxoePe6yRLMrMp+c43PGh8NNg1bp/cXMcBVo+jj8sceQKLAhp5zlafF4uBOAFD1BMlN0OZUFb7DvsxkBPiK0LVdS5X0UQmEzVafpa1wRXDXi8tgZnY9QVo4MI/SBLLNrwXQpbO1DjBqELbj7PDT6M/WUY8zqvnQYyHB3B6T3kk/ht7JXvDrowEgER4MMi5+xzjaeKfWmbIu5ZzY8hoH1BX79wtTavYI1WaMFu2pqHubC2h1RsTwFowAZK5nm+9t3WZpSL2EzFrWFC6T5k/ILgxQWZzJmHLQZPurkL2TrO19KGW4JJUo0a8LnLb/tsa6hiVTjfHxcZkwCRRvEp48kOSRRX8ttk1u9NnmWKcqs9Bga2wkuzM+eL8ACE764WWV2qheX48ndbBsoAX9MUjiZ8DZNrTmbf1c6RoOJR1aPG8RseFPSdet9nIQyRbkIZcK8ntP8RgZj6drviAC/r+HC+MAGnbX9mY+QMfHFfbZVjHRtg0ZdcDoFFCvxu/sZP+80O9b6Qq6ykz6P2HK4ndnr8gSRTJ9wlWqnI6IBlrLPb6zY+ghbf6CW2SPtgMiVReg7/mIRK/TW6Eb8pzxTuRWSlQE4B2pi4Tt8ohnmgpKwYeAImSGQZnFhLoxp8s44hDbgMdTA8FugHQR6QXvsetg3JkY</Encrypted>]]>
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