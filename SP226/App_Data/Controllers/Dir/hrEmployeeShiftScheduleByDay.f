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
    <field name="ma_vi_tri" external="true" defaultValue="''">
      <header v="Vị trí công việc" e="Position"></header>
    </field>
    <field name="ten_vi_tri%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" external="true" align="left" defaultValue="null" allowContain="true">
      <header v="Từ ngày" e="Date from"></header>
      <footer v="Từ/đến ngày" e="Date from/to"></footer>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" external="true" align="left" defaultValue="null" allowContain="true">
      <header v="Đến ngày" e="Date to"></header>
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
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d39" external="true" defaultValue="''">
      <header v="&h2;d39&h3;" e="&h2;d39&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d40" external="true" defaultValue="''">
      <header v="&h2;d40&h3;" e="&h2;d40&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d41" external="true" defaultValue="''">
      <header v="&h2;d41&h3;" e="&h2;d41&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>
    <field name="d42" external="true" defaultValue="''">
      <header v="&h2;d42&h3;" e="&h2;d42&h3;"></header>
      <items style="Lookup" controller="hrWorkingShift" key="&h6;" check="&h5;"/>
    </field>

    <field name="n01" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n02" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n03" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n04" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n05" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n06" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n07" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n08" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n09" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n10" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n11" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n12" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n13" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n14" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n15" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n16" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n17" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n18" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n19" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n20" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n21" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n22" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n23" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n24" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n25" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n26" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n27" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n28" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n29" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n30" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n31" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n32" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n33" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n34" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n35" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n36" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n37" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n38" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n39" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="n40" disabled="true" hidden="true" external="true" defaultValue="' '" allowContain="true">
      <header v="" e=""></header>
    </field>
    <field name="partition" external="true" defaultValue="''" hidden="true" readOnly="true" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="20, 88, 19, 40, 40, 8, 20, 88, 19, 88, 20, 88, 19, 88, 20, 88, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0"/>
      <item value="100100010: [tu_ngay].Description, [tu_ngay], [den_ngay]"/>
      <item value="10010001000000001111111111111111: [ma_nv].Label, [ma_nv], [ho_ten], [stt_rec_nv], [n01], [n02], [n03], [n04], [n05], [n06], [n07], [n08], [n09], [n10], [n11], [n12], [n13], [n14], [n15]"/>
      <item value="10010001000000001111111111111111: [ma_bp].Label, [ma_bp], [ten_bp%l], [n16], [n17], [n18], [n19], [n20], [n21], [n22], [n23], [n24], [n25], [n26], [n27], [n28], [n29], [n30], [n31]"/>

      <item value="10010001000000001--: [ma_vi_tri].Label, [ma_vi_tri], [ten_vi_tri%l], [partition]"/>
      <item value="1000000000000000111111111: [ma_nv].Description, [n32], [n33], [n34], [n35], [n36], [n37], [n38], [n39], [n40]"/>

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
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz0dYPNs+yIhtPTljAI9JAIE5Lmvmv7Le9dxJgt/DHqno+53PlnwnKMaxPh5EqNqpnNVKENCPS56zeARSRzHZ+gLZ7jxa1yOK0++H3KFU6iwvMfpGFETWHNDViY5KRwWCgeWCq9LsbssXZgy4uxOvCN8rF6YlpR0ce0ZUFa5SGa50wbKa8ggztROCWnAJdwSFCD82VPffWvA7dHfFMgEkgmsOe/yQvCgXDiQKJGomD5ljmHlBKGDQcaxj3k71bRwVM4sEEfBuZc9D6reC+TrYizFismTKeeXIgf8tchmfdU9XPTZlWR+c6sdJ85eGkZubg==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6X1rO5yYi3HOzA/8C+8/VbTzcwjbF63+wUCVT/HeysK0Z15B9s45T3pl+aH4HAWzWNYC9uUY793cSMkaM9ps4C9EhESsIVTshbwDt3CZoLTtT209Rx+09Z/3f7oJ2/GoxAFkBDj+z4hWAI2OptDw5BpIk71TxzAOHvMzJoAhws7C+papsftycP1XnVKXBrg3F/eRD4cLAZaq0Okc0um7gflzvaMwDz3h/60Kg4ZKqMKAQGBeq8HnY5fUGuH8aTbH+2GsbygHkjrvhT00JvacJyPMssAUj4SMIMBICdJjPVaCYONSYZP93rnuo9zq9JIpDwodhfpOf4lgBK8/8qcdZZzTZ7F/HgkG6T1Zxjn5xopGvkjeuX0hpOnqP4SE31D6nDU8hV8p73vVspgLZeT2dmb71p74PQNtZmDdhI7E+Ui60sqfjQPlr58DdMRn9AP3fXbwV3+zKl3qMqHWC14FHu8hoBtIV87vhpmTIvFK4XWDIY3KXP6C91nOMh7+p7REgDYKmnPxn7FVtU1obcqg87kx9L4Du5iyRsenKqLG7h4psJHYB7/gmMEHFZPUyLzo8IVh+Kq3iR5MNCT3MnGpo1k7/F/LRvOqoNdImnhS7DkMGR8pzioKU+aM/+fkOMtnUKbGm+wKcouP5MfOGddMkQV+81NRy/0s70AbbNSpQgwgmzEKtVbUcoQhVyigtrqFVBq5+r2ifqdopd//6gUtzQXZu2Hh8NqScx1u0Kzatf5OkFzYLBfDC1mS/R4jh31BWomkaxjNKJ69OP5B1OyNP4IOdfu0dfo9ULh+VDFa/OK4ftlx3OUxadYudm8js5SRRREt7ITgN8s5yoU2Kfw+QG+SsygDhSGKQGJox5FBEn3USB+g7ubZL4N3uyPtJfMMaYiyOdtWCL5cQ8jjop2tXIxNQdWAv5FV4W2z1tISIeDRc6QHlNxynK583MXddyURsRaM/oCKkKVPIKD8z+PAyzOnTnQIRCi359Bu6r6k06+vfpFaYJhKMLXIML85MVIovqpoDONunQeBNMGG59UjWFhsCr2IhgQFsAd98BJcrHYcx195nTJ24075iJJyG2OQHZ1kT3+qiJ+YDtFq/pYmfgATplA992fHUwJYqv6LXHm0lKWBi10kJtiMKuUwHcvQQX4q/q98QZN5YQIDjcYEM4pSVBCNzq/1AxKqpbir3r8keH0DtKhwGcYucZmQeDeKFA==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%dUxtAbG76hDnHEpXdcWHx2Qs+0tWXconatdmGK9nADg=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp08vXzSmIGwl4wHV1ryE0gmctOX8f3B9eImTLqur4/+enlOdE8Bf2RjANX4Wa3UbPaPVYSDflVFJYwp0d4mSUxVpEzypGz92nYeTVH+XOZA2TY3UiQlH2sQ4+9sEbWvFnC//XimrgD0UegO55jUrtO/llKsnjTWzVTq8Cib7xT8j6kTxgpSaXedckkoBecnPphVaTc34+oi84gDkAdP38UJJCLDYPLyVLVeQcm2KR5y/aTi9+8g2f0spoklOsL90Lh9YHYhBtnT/CVOOVo61pZ5X</encrypted>]]>
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
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6X1rO5yYi3HOzA/8C+8/VbTzcwjbF63+wUCVT/HeysK0AwyvTBYvCeo7ieEdiFdcLW7F4BPX7JB2C7EEAuD75lnTk2TizGRHXgCLDgh0BbJdzl+3w9PBZkm/URzN80JJdYhUj2yDzXEQXQtU0s4M3sGR7ImBqqbIR9JiNCQFRQIN7Q/jK+EVE1587ShaH3J0I4CHtid2Niqeg8/uR627EzK4kDGAO3igc9DV6eT56DzK0qGQ4NA8hkThyTWb5Jr21C0BaEoRzoRc2l3PrDCnLV5yN1fVHQxEa2TdVc9bkfbUkyKQyDotuiM0k1Mpp18EShpU5OLjRgUJBiBd6oLDqhuV1rKXrxzvaAuMIXgq9VI/IytyRy8NzP4et+VgTsdWOw5ZlMjK0E2dtQawRy4aGnLc4Z67dNrB9pRmubw0gSIltP22pmG9Xp9yAB2a8qeHSHr+/a3mpLbe5L0mQP8IZKrACLNDG8GEkLHGfgZU9IfglIBlncB57TGQQ+lwd29BROVml5H21nG2p/sVO+4J/xmDUvnvZTG46h51h/3KAYhw1IUDXILgfVO6wkf5uGvSvxFWR07PMM3ErWy45br2ZZj9DByhtp9M0GeBzlb2kBXcbRsGqCLbpUwTeHDu6lTnzVL9B2edtvZ/RCaCbvnEt9OSl67pcOtGp1UPH1w1NVrJESysWsGJgfLeLHMazEE8ypN1BvglzSJqVEJ1WRQ7GhoLGtpMq92S+DroNcAWuDlJFWpYm0x912CKNVUu4pGH0WAHQqV+j4stcZt0nzKFGQG27BxoJq4HPeA55dYIR9yk7sYk6DrhbG9iOe9xTWMYLtw02GbrBg12U2KIzPrSV2pojas//3EZr4z9qPXLpV7mWegiUP/6tI3c/VWi734CWEwyJ02A/f5RkI+DrC5mzCpvMfpevXHytMHobxwE2vg0nKn82LFUF5rilqcm/Cf9Gkh90yzucULdNhIOnAKdYt/f+F7pW5VMdAigxZlq+Mns5lFXhhmTT5qK/JnFbKJkDrFglGqASoE2gm6MHPCr8AhzjBkIykFKjTKHJ27aIORHcZWysRgXgkcyT2Vv/0BGLw==</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hISTETwwifdcC43N5rLCW9zJY6a0AK1+zBTeHPOSScRxJ</encrypted>]]>
    </text>
  </css>
</dir>