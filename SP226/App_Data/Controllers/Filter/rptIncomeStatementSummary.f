<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptReportFilter SYSTEM "..\Include\Javascript\ReportFilter.txt">
  <!ENTITY defaultTable "V30GLTCTH2">
  <!ENTITY defaultForm "V30GLTCTH2">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky_nay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Kỳ này từ ngày" e="This Period Date from"></header>
      <footer v="Kỳ này từ/đến ngày" e="This Period from/to"></footer>
    </field>
    <field name="ky_nay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Kỳ này đến ngày" e="This Period Date to"></header>
    </field>

    <field name="ky_truoc_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Kỳ trước từ ngày" e="Prev. Period Date from"></header>
      <footer v="Kỳ trước từ/đến ngày" e="Prev. Period from/to"></footer>
    </field>
    <field name="ky_truoc_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false">
      <header v="Kỳ trước đến ngày" e="Prev. Period Date to"></header>
    </field>

    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn - năm" e="Standard Form - Year"/>
        </item>
        <item value="20">
          <text v="Mẫu chuẩn - giữa niên độ" e="Standard Form - Mid-Year"/>
        </item>
        <item value="30">
          <text v="Mẫu chuẩn - bán niên" e="Standard Form - Half-Year"/>
        </item>
        <item value="40">
          <text v="Mẫu ngoại tệ - năm" e="FC Form - Year"/>
        </item>
        <item value="50">
          <text v="Mẫu ngoại tệ - giữa niên độ" e="FC Form - Mid-Year"/>
        </item>
        <item value="60">
          <text v="Mẫu ngoại tệ - bán niên" e="FC Form - Half-Year"/>
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
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsBldA0/ofLF9/OM+wYQh5cGdegLypqmJGFbjqIbmcX1IYjsgb+Gte8TQj412JLiDGAp0Nb5anBsvUTqgWJD7aS+5ksvyziC325Dwiu+CfHXlwt6rBQjGjyG1Z/RvSUUzLl2kvNMpslLlXddb0Z3Q6CnB5Ue0SspwyO3CnluSme9RJckzOm67CckPhxeX3PBBtPyWSC1TnvfYKwZb8gC2Knt</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8QiKkG49Kx1idfVzVS2VIt+XRt3rOFT9gJtGwI2URgtfg9U6g2K/PF3yhG9IHSa2l4etboxxa1ddF7G7YdhaASYEVUwIOqZ3voBTPYz6lTn5dfS799Vo4gAUvpoR+vNuZGDnSAh0/vQP/8ocw9izjq+m6KPGYmuPic1rq4szaN5sw==</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8SfvNz4tGnj6XFkN4MvchDBtYb2AJBCBWuxiBr/ztuzptg3ysyH29AFd0gGER19UPcM2VV0YFkJQZUeaYQ+lT2SHZ2BIwYtmMpP0xLuvlyLKx06QTaKEXpPuAcjW5JwSVt2Eqhme4az/qKQSRKtSp5eNMzrMTsG1Gbx6cfyA1Lj087yKurTo5T08Vagnvhm+sJfIvu9cE5/NxBfACj9p6Ln</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&KgiT2k4AdcxFxW1gK2q66hY2Q8s18wMZY/spWLapXuNMp84vLgEey6QGSEB+UzDHo+Kgc2UJrqDWMGkf4DPTKQQ1hpImQmxbUDCW1abYndQ4mQ+RASDIwY4lZRJ27t6E/PxQ76AWsaR8jDc1X8pKym2Y+8WO3/wYMhTmkBZxI+kVmwr4T0cl7bB/2zWvx8x+aA49L995RzG3bY0nNy5208R18HjvZ/OGLT8ektOuXvzcnTKfCITfPPxefu8TOcNjEYuNEfDPpIrKce2n8pdYA0vR7IDNdj17/NQ7r9xX1qNuiHd1Wrd0sDZKx+tZVr/Q</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&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</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ4mLNZehf14I2kiFHW9yD9A9vfNBAMOTOWtXpkv9tsbM6plWgooErxs1yjd+fkdSX3CCXzFzCdbnMYbY4g1F7cFIJ6lQkeYY6emTws9gKDQ1Rwu1O+uwkh5Aelmw14ELNJ9LT8QS3Fd5f7+bdLVS7IO/tcowfMBCceMo3t32cf8E</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      &JavascriptReportFilter;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdGNkHV5ZGnyzuPmat1lM/R6x4QygxhydwROxlqHlW/1gChzi+3Wh/nKHvjEbJoTF7BZEJzIB5KCfOIVGQl8URZwNQT7NSHExZehcDm6NOQWCd5EqtEC6lTPq2z4kZOnNvqGguFHxjpA1fKuVmjwsMNSGy6m9QjvVsOM2+WsN82s8mPzmnlOEdTWqmVzgRWOxNtxuaKaRCZa/+Oq6D6LOdJQAQPgEVimZELP+cvnsi4DKlJcSBbk8t4XRM4E7rxLeMOqvsddmusnHs1p1wGnCGZ54QfXmfuWRm9Fu1HEb8CyRPAoBo+ORZgzIO1SLPSEkUfEu4qNo9eZbsCudwRsIpqjanpTWkN0LvKN57WdYyJRxFxymEl8GA7oXL5a1E0OyZZMTcNJaUcuN5qIcozMS45a8YiFmo/de/5XkoUGkbw5gZ5WLeo8rv/WmRHAnFOHRYjeKzguddop7ZglR/tGbDAk1/JHhX1ENRL3zO789LO/K9PpDXOxwbuLgCF4D7M+83Kz6qsT+8AaCHLpeUZPQTOxE1N0+k4+FNGGsdWDoBYrrlkVs/PJM/WgdEjO1KnI6AQpPQVgy2oQfdTzmRfeQFs2ViLmlXrssOpGGgt8QH9a/THBC4N5Ttx7Ead4LRgfPBnfCFoa9ufhDlQuTDI03J8Tc4iHsLd6sEZOyOuaat7lIYDBHCnY2NL9MnZKvjKxvRuUSsFMAgr01lwGH0USY4fwZ7ghjKjjytpUwA0qtChfiTJ1vPylgxg4MKVgnI7nY4Izg82FYqa01DvengrcWPHK3TUD8MamPiaar/QOxLOyMrP1ZyGP9RQVcr7L4kzU0Gm9nZxcDm5A5jBM/PAdzicB4My8jiI4a+yD1HxFkajy4LNJ1cl5ZcRXQHXcE27WXsDMtJBpTygAHpoI+wi9G0OElwtWFJkh9lhkrgsQZQhD6/C81hlohsuV7wwdCo8vddcZvMnM236HPuQqriTMR0cby2pEdQTtMOcRfofS9cqh8I/qRiF8AbILhNu+9JTPATAdKjL+4DjvG6iyJSVNC9EY=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>