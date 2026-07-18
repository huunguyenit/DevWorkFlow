<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">

  <!ENTITY defaultTable "V20GLTC1">
  <!ENTITY defaultForm "V20GLTC1">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_bc" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày báo cáo" e="Report Date"></header>
    </field>
    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit" ></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
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
      <items style="DropDownList" >
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
      <item value="120, 30, 20, 20, 30, 100, 100, 130"/>
      <item value="11000---: [ngay_bc].Label, [ngay_bc]"/>
      <item value="1100000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100000-: [form].Label, [form]"/>
      <item value="1100000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsBldA0/ofLF9/OM+wYQh5cGdegLypqmJGFbjqIbmcX1IYjsgb+Gte8TQj412JLiDGAp0Nb5anBsvUTqgWJD7aS+5ksvyziC325Dwiu+CfHXlwt6rBQjGjyG1Z/RvSUUzLl2kvNMpslLlXddb0Z3Q6CnB5Ue0SspwyO3CnluSme9RJckzOm67CckPhxeX3PBBtPyWSC1TnvfYKwZb8gC2Knt</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8QiKkG49Kx1idfVzVS2VIt+XRt3rOFT9gJtGwI2URgtfg9U6g2K/PF3yhG9IHSa2l4etboxxa1ddF7G7YdhaASYEVUwIOqZ3voBTPYz6lTn5dfS799Vo4gAUvpoR+vNuZGDnSAh0/vQP/8ocw9izjq+m6KPGYmuPic1rq4szaN5sw==</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8SfvNz4tGnj6XFkN4MvchDBtYb2AJBCBWuxiBr/ztuzpiAsPr9gzOg30Khp1hYxyxoQMnIPpZAbfid3qySbDGm+c/kEIQODFODJ1pM+iLoVDLb/+Eg9wnB2opkYZT+gn0ELUbPbXT9iP2gd+LHfjchJptM/oiSJ43t1X7Sz0Z2fTzITSp0K9PKEqahHjmydDWvyHeae1W1foQTXhSqBNUUf</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ+DphVe8yFQinM/BgY9Aq8SfvNz4tGnj6XFkN4MvchDBlOkkfRjgeyjrf8bceGIXQKjAE2mIkK8qpeJ2qy31ao8wJLLdHcAwLytl5W3RQqc9RAKV3154zHX4+kynwg9C2TBGYLImRy/4aI7q+oe/3jx1hbJVmYdeuQfermnxD4q69wppVDVYZ0Kxa+bb/6dIF33WeUrhktXFGH3hLIjTafu1JBddxRWFxoKAyAgxcsFhkMkOcTm5Nm0BWhBfQCV8JO1uYaBr6Qbwba0bjuySAwllzSpFt1EILyqegOU/3Yvs</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPKctQnInO9zWaWQF/2D4PyW1+7xoVp6oL0YqIVDF0NvBLVugHNKHFHsa/WKpdj2ipmIgojkBPBatTl2oCYYUpU11u58SCqLv5bZ30hjZCU3q7UEwigtZrjq/hS5o8ay+s3UJooIbFJAfttrBwsAht2ILs29Yz8a+zCE1upSsI8/v7jBeYya9S5LOs4O5ogXw4KJKUjn+NisyUfsZFTJXvaJRE89yLtlZ7L7wjpkQtZH</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6UBkjyLCJvaQKhV1r6qPPTglkHqnaRjYR8qCTAKvDrzcgRxuQh6keovaXhyE65GTPgkOM0eWwUraig0e8BYgyj1hy9IinaxW8mHtveUulA0udWAAahX8DDACbSm6HxaeYCErT9fEzOQ9vR0GfwYKxPRn37zvVUCvaB4nyWL4IHVJuE501qRJOY4g5NB0G8mGNA2fbssgrXdKaJI1fZ/hj9OPP8W6OzX2XfPv3Gfk1/vZBWewxMRfI9YJwq7rmos5BgDZD+Pq2aloW9y9rnbAFP9ycJMEx42MjsyBq4rSlHz/U/DXlHuZPqD2bLOZDUYotgj/z3h/2G6tkJIBI1aki8zXBvVHnAxdRP34CPA/SW7VGboxiG9vOduYwielIW8xRjBNnNZUzTleNXr6cYRB8wHkQHeuwHPYA7f50c5wHdyC6AdP51B1KMhPug37qLtHfSxteZMQsX8OFdclOCscW8ji5djaTbbtDiG6Zk6cplj/JkxFQ3KOgbddPHeUZ9+U/9ttNvLIGfvhiMpyGJAabbCHclhHF+pl7+KCZEvGw9jHVje69GTI8ZnEKLORKQ0VBxxfhNMi7ElWwDDxu6SdFiWLRPMZP+sjeQjh6G2IDxhs+ESDsp8nDyL1rw7XAk+M9jhtlvm2CR6hHXH0eZ08fYByEhZDXMSxcPhXKE6yF9JqNciz3Y1U2xqddbaxMBXEvwdgTIhxjh4pdFsbj7ug9HTkF6yDc1VhtjLeBO+vCyvFki8dwBaGq3XZZsUUvvRvYrbuawPsLlMpikYw6WaLJ3NamPhQgvxgXJiO6mo140/U=</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>