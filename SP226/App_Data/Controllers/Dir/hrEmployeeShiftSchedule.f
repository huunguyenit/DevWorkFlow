<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">

  <!ENTITY h1 "&lt;div style=&quot;text-align:center;&quot;&gt;">
  <!ENTITY h2 "&lt;div id=&quot;">
  <!ENTITY h3 "&quot; style=&quot;text-align:right;&quot;&gt;&lt;/div&gt;">
  <!ENTITY h4 "&lt;/div&gt;">
  <!ENTITY h5 "1 = 1">
  <!ENTITY h6 "status = '1'">

  <!ENTITY c7 "&lt;span style=&quot;color:#4695d6;&quot;&gt;">
  <!ENTITY c8 "&lt;span style=&quot;color:#e6400d;&quot;&gt;">
  <!ENTITY c9 "&lt;/span&gt;&h4;">
]>

<dir table="hrca$000000" code="stt_rec_nv" order="stt_rec_nv" type="Voucher" id="H01" xmlns="urn:schemas-fast-com:data-dir">
  <title v="ca làm việc" e="Working Shift"></title>
  <partition table="hrca$000000" prime="hrca$000000" field="stt_rec_nv" expression="''" default=""/>

  <fields>
    <field name="stt_rec_nv" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nv" external="true" defaultValue="''">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <footer v="&lt;div class=&quot;Break&quot;/&gt;" e="&lt;div class=&quot;Break&quot;/&gt;"></footer>
    </field>
    <field name="ho_ten" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp" external="true" defaultValue="''">
      <header v="Bộ phận" e="Department"></header>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" external="true" defaultValue="''">
      <header v="Vị trí công việc" e="Position"></header>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="thang" type="Decimal" dataFormatString="#0" external="true" defaultValue="0">
      <header v="Tháng/năm" e="Month/Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" external="true" defaultValue="0">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>

    <field name="d1" external="true" defaultValue="''">
      <header v="&h2;d1&h3;" e="&h2;d1&h3;"></header>
      <footer v="&h1;&c8;Chủ nhật&c9;" e="&h1;&c8;Sunday&c9;"></footer>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d2" external="true" defaultValue="''">
      <header v="&h2;d2&h3;" e="&h2;d2&h3;"></header>
      <footer v="&h1;Thứ hai&h4;" e="&h1;Monday&h4;"></footer>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d3" external="true" defaultValue="''">
      <header v="&h2;d3&h3;" e="&h2;d3&h3;"></header>
      <footer v="&h1;Thứ ba&h4;" e="&h1;Tuesday&h4;"></footer>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d4" external="true" defaultValue="''">
      <header v="&h2;d4&h3;" e="&h2;d4&h3;"></header>
      <footer v="&h1;Thứ tư&h4;" e="&h1;Wednesday&h4;"></footer>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d5" external="true" defaultValue="''">
      <header v="&h2;d5&h3;" e="&h2;d5&h3;"></header>
      <footer v="&h1;Thứ năm&h4;" e="&h1;Thursday&h4;"></footer>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d6" external="true" defaultValue="''">
      <header v="&h2;d6&h3;" e="&h2;d6&h3;"></header>
      <footer v="&h1;Thứ sáu&h4;" e="&h1;Friday&h4;"></footer>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d7" external="true" defaultValue="''">
      <header v="&h2;d7&h3;" e="&h2;d7&h3;"></header>
      <footer v="&h1;&c7;Thứ bảy&c9;" e="&h1;&c7;Saturday&c9;"></footer>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d8" external="true" defaultValue="''">
      <header v="&h2;d8&h3;" e="&h2;d8&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d9" external="true" defaultValue="''">
      <header v="&h2;d9&h3;" e="&h2;d9&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d10" external="true" defaultValue="''">
      <header v="&h2;d10&h3;" e="&h2;d10&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d11" external="true" defaultValue="''">
      <header v="&h2;d11&h3;" e="&h2;d11&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d12" external="true" defaultValue="''">
      <header v="&h2;d12&h3;" e="&h2;d12&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d13" external="true" defaultValue="''">
      <header v="&h2;d13&h3;" e="&h2;d13&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d14" external="true" defaultValue="''">
      <header v="&h2;d14&h3;" e="&h2;d14&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d15" external="true" defaultValue="''">
      <header v="&h2;d15&h3;" e="&h2;d15&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d16" external="true" defaultValue="''">
      <header v="&h2;d16&h3;" e="&h2;d16&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d17" external="true" defaultValue="''">
      <header v="&h2;d17&h3;" e="&h2;d17&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d18" external="true" defaultValue="''">
      <header v="&h2;d18&h3;" e="&h2;d18&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d19" external="true" defaultValue="''">
      <header v="&h2;d19&h3;" e="&h2;d19&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d20" external="true" defaultValue="''">
      <header v="&h2;d20&h3;" e="&h2;d20&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d21" external="true" defaultValue="''">
      <header v="&h2;d21&h3;" e="&h2;d21&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d22" external="true" defaultValue="''">
      <header v="&h2;d22&h3;" e="&h2;d22&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d23" external="true" defaultValue="''">
      <header v="&h2;d23&h3;" e="&h2;d23&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d24" external="true" defaultValue="''">
      <header v="&h2;d24&h3;" e="&h2;d24&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d25" external="true" defaultValue="''">
      <header v="&h2;d25&h3;" e="&h2;d25&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d26" external="true" defaultValue="''">
      <header v="&h2;d26&h3;" e="&h2;d26&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d27" external="true" defaultValue="''">
      <header v="&h2;d27&h3;" e="&h2;d27&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d28" external="true" defaultValue="''">
      <header v="&h2;d28&h3;" e="&h2;d28&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d29" external="true" defaultValue="''">
      <header v="&h2;d29&h3;" e="&h2;d29&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d30" external="true" defaultValue="''">
      <header v="&h2;d30&h3;" e="&h2;d30&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d31" external="true" defaultValue="''">
      <header v="&h2;d31&h3;" e="&h2;d31&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d32" external="true" defaultValue="''">
      <header v="&h2;d32&h3;" e="&h2;d32&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d33" external="true" defaultValue="''">
      <header v="&h2;d33&h3;" e="&h2;d33&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d34" external="true" defaultValue="''">
      <header v="&h2;d34&h3;" e="&h2;d34&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d35" external="true" defaultValue="''">
      <header v="&h2;d35&h3;" e="&h2;d35&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d36" external="true" defaultValue="''">
      <header v="&h2;d36&h3;" e="&h2;d36&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d37" external="true" defaultValue="''">
      <header v="&h2;d37&h3;" e="&h2;d37&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d38" external="true" defaultValue="''">
      <header v="&h2;d38&h3;" e="&h2;d38&h3;"></header>
    </field>
    <field name="d39" external="true" defaultValue="''">
      <header v="&h2;d39&h3;" e="&h2;d39&h3;"></header>
    </field>
    <field name="d40" external="true" defaultValue="''">
      <header v="&h2;d40&h3;" e="&h2;d40&h3;"></header>
    </field>
    <field name="d41" external="true" defaultValue="''">
      <header v="&h2;d41&h3;" e="&h2;d41&h3;"></header>
    </field>
    <field name="d42" external="true" defaultValue="''">
      <header v="&h2;d42&h3;" e="&h2;d42&h3;"></header>
    </field>

    <field name="n01" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n02" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n03" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n04" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n05" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n06" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n07" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n08" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n09" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n10" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n11" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n12" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n13" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n14" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n15" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n16" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n17" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n18" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n19" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n20" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n21" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n22" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n23" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n24" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n25" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n26" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n27" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n28" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n29" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n30" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="n31" disabled="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="partition" external="true" defaultValue="''" hidden="true" readOnly="true" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="20, 88, 19, 40, 40, 8, 20, 88, 19, 88, 20, 88, 19, 88, 20, 88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0"/>
      <item value="10011: [thang].Label, [thang], [nam]"/>
      <item value="10010001000000001111111111111111: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec_nv], [n01], [n02], [n03], [n04], [n05], [n06], [n07], [n08], [n09], [n10], [n11], [n12], [n13], [n14], [n15]"/>
      <item value="10010001000000001111111111111111: [ma_bp].Label, [ma_bp], [ten_bp%l], [n16], [n17], [n18], [n19], [n20], [n21], [n22], [n23], [n24], [n25], [n26], [n27], [n28], [n29], [n30], [n31]"/>
      <item value="10010001000000001: [ma_vt].Label, [ma_vt], [ten_vt%l], [partition]"/>
      <item value="1000000000000000: [ma_nv].Description"/>

      <item value="1010001010101010: [d2].Description, [d3].Description, [d4].Description, [d5].Description, [d6].Description, [d7].Description, [d1].Description"/>
      <item value="-1-100-1-1-1-1-1: [d1].Label, [d2].Label, [d3].Label, [d4].Label, [d5].Label, [d6].Label, [d7].Label"/>
      <item value="-1-100-1-1-1-1-1: [d1], [d2], [d3], [d4], [d5], [d6], [d7]"/>
      <item value="-1-100-1-1-1-1-1: [d8].Label, [d9].Label, [d10].Label, [d11].Label, [d12].Label, [d13].Label, [d14].Label"/>
      <item value="-1-100-1-1-1-1-1: [d8], [d9], [d10], [d11], [d12], [d13], [d14]"/>
      <item value="-1-100-1-1-1-1-1: [d15].Label, [d16].Label, [d17].Label, [d18].Label, [d19].Label, [d20].Label, [d21].Label"/>
      <item value="-1-100-1-1-1-1-1: [d15], [d16], [d17], [d18], [d19], [d20], [d21]"/>
      <item value="-1-100-1-1-1-1-1: [d22].Label, [d23].Label, [d24].Label, [d25].Label, [d26].Label, [d27].Label, [d28].Label"/>
      <item value="-1-100-1-1-1-1-1: [d22], [d23], [d24], [d25], [d26], [d27], [d28]"/>
      <item value="-1-100-1-1-1-1-1: [d29].Label, [d30].Label, [d31].Label, [d32].Label, [d33].Label, [d34].Label, [d35].Label"/>
      <item value="-1-100-1-1-1-1-1: [d29], [d30], [d31], [d32], [d33], [d34], [d35]"/>
      <item value="-1-100-1-1-1-1-1: [d36].Label, [d37].Label, [d38].Label, [d39].Label, [d40].Label, [d41].Label, [d42].Label"/>
      <item value="-1-100-1-1-1-1-1: [d36], [d37], [d38], [d39], [d40], [d41], [d42]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1NsRRJ2LJ71wsTKHenIpyu074draJUt0Jn3PypucpW2bDfLzrHmobpOGZMC4sYTjYf8GdijtG25t7S+XUV2F5wSmbMwTOPDafAqVM5mpBOY</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf659qBlmOgUuGTuYDRGLNcQQjhfn3N3GA/TrVOhpvDeQoaGszdy/m+54fs4KISyC0imYd7g5ff5LCE1+ZmuRoXA+536+HEVnEVCI0h34xfFi</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7pzHFhXaFflgm5c+NyaPOO23CeJsSjaEEU8TWJ/a9rANrl/Wv3ig9LzYWdbSjlPBusgIbRtYPYpEhLGZlgTKna+qQE3uEbRNBBtgNOw20jI</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5Pq6xIFrJCgF5/FYQSugmsdGfZfGqfzyT2fE0fH5z+ohouNlh9N2blWKGldCPFm5WlomqC+gmUQ5TUUj1mB5bzt4Vrb8gkZzU+hXFm4ZF5Cl2KP6FPbK+NqE5KJfH6DL4qfgPQbf6vReLU9YqnWAWEetBzk8hb5L+PLQ7SZBRVnBj3Z0LLBLgOUuEdaCN7naUHOXqMuFQJnlYI/C94iJSAkcDPHzCKPp6XYDnV4Wht46t/e8RpJugK8jQdAt1UKDRAKtuwfu+ygeaS1oDQ1WpIMlybXJ3DZrU3B+ZaLB9Bdn6/ic4l93DPKgJfs2U7zWiDgU2xTO26yzRjA3L8ETwe9HhmEt7mIxJtRYBEj8fgHw3bUgr1nFpUcMroZJrUOzY9Skb6lh8EuK4zcQdjaZJJJVTThf16LciX9qJ5zPIr89mSCIvpNmopZPlv6J2K55cQewJ22GKBkyq483pqJX+eMakS/v7PVEUX0VRJl0eRQ</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6X1rO5yYi3HOzA/8C+8/VbTMBxH4rX5IRAzdWmUOLs/IZa3X7e2Vhs7kvfBZ1lRnKUxHtRAHsrPnlMxT2PWY1ZGgeDgWOXvYxtrms/yPG44gYUagoyibJ6HL6mIRszv6tnbQWTMuDMU4hjm4tunmCtNyUNyWR/t4sZdta9WLE4h3D8FGqk2Gw8YjmxrxiL6sqtKshxpdvSCo3XAe7swJHN03H4P2ZMnX/wI9SD30hi1ZV8mTPKixG9RAgWiC7Ow3wcLfONon7UI1e6Tcdd7Lf4EHlPe6dKc4UA4fgtyhnJla1AZJ8lb2XKcCo8pw/wDFxI7h1xalOi0V2tjZ61IWOqTX9mmPk8JVo3tW1j4zGZ7DlNDjxApSOt2NV7MZ4A3Ffb2tl6UsjlpJoZThC9gh58FRbmXm7BfNs+qdqDxgmCgEywFGYqxazrCH6N7iC3XHi//5f9ZbQvoVj6LFfleyLoU2qMlw4bC4vnH/7U4Ezp71JQkCZoYwq0vTzswojcqsQM7Ves2aHrCvL4QvVwPCarxt1qdu+f8QYFGfqVurAmYS3guwngfoQKg0UPUIQt4siGEjyEk8GY7I0x4Gmct32+I=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%dUxtAbG76hDnHEpXdcWHx+TXzSi9oc/nfvjGQ8H0OmpItqTt09Blo8N1vSmzO1duteWPQuzuSX/tZU4JhB0R6h88DUaxarL4kSVnwbrPdZMk5aVQkZBq1X8oc/L73sGlACBDOt3JKJc6UVIbifTouKykgPqWw04OneQ3UMcuod35JjSIne0zqFyoKwDgH1hGqixwfUrzGy30ZskZ0l1BfYx0yVBmBw8SbFTOYncQQVp/v1F91Z9r7Fa8eB7GO8AxEhCzbEWHH10h339/KF2mP5S1YFKjKa57HV8tGlmilbbI7/qDptClAMHmIII2NATE</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp0/Ag/xY0E5Qf/akP7VkFOJqXPHQHtrZRpV75EHbnu9rqEUbtGxBirX0j9/eKinUMbKtBEoG0OM8FsWc5WgeuZjZItWMST0x29sQQD4VZSZHjJm1cl0QE3uZTv4BJ5EKXpnr0dDgbgty8dZMhd4SjgNNFX+9lQw2682Vq+wxfdpMAFB2kqhLbbB2WeeK/Dgf3rLPv3v3nPeGOOPy/M9pRvHSj97D37zcfZ86ZZS05NeUI/JeIvghaZAKfHAamqIzL1dj3BYgLICKl7W9JPBAMFL4</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%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</encrypted>]]>
      &OutlineEntry;
    </text>
  </script>

  <response>
    <action id="GetFormData">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6X1rO5yYi3HOzA/8C+8/VbS0ZF7I17DAsNHDPVJqEZifjTuKeBkqmZ1XoRxf82P6tAOGequeZMWeoI8VREqA9kP0fC00Xgu8V+nE43/IR+U2R3mDVhzHzxfywJtzZ6oOhTG27EdIjDZ/78B0RHsPhm+5Z6ahf0JKvEOY47s9cafpEspgGFnpC4AXlO/NxsDJxdG4+FVAGfQLrzdEsWLRqBJa+7CDjWw9hAnT8vfUvD6rCLKZ2pZxhmT+SfV0h96IhV7Ga0FWqdUpyjlHCqZKEv9igZ4qufuz9MPJylm5l8xalCLJuDVLbNY4tMpdNsaeAg==</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hISTETwwifdcC43N5rLCW9zJY6a0AK1+zBTeHPOSScRxJ</encrypted>]]>
    </text>
  </css>
</dir>