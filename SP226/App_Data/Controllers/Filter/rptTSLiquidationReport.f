<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ky" type="Decimal" dataFormatString="#0" allowNulls="false">
      <header v="Kỳ" e="Period"></header>
      <footer v="Kỳ/năm" e="Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="ma_loai">
      <header v="Loại CCDC" e="Tool &amp; Supply Type"></header>
      <items style="AutoComplete" controller="TSType" reference="ten_loai%l" key="status ='1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="TSDepartment" reference="ten_bp%l" key="status ='1'" check="1 = 1">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_ts1">
      <header v="Nhóm CCDC 1" e="Tool &amp; Supply Group 1"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_ts2">
      <header v="Nhóm CCDC 2" e="Tool &amp; Supply Group 2"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nh_ts3">
      <header v="Nhóm CCDC 3" e="Tool &amp; Supply Group 3"></header>
      <items style="AutoComplete" controller="TSGroup" reference="ten_nh3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh3%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="mau_bc">
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

    <field name="keys" hidden="true" readOnly="true" filterSource="Infinite">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="111: [ky].Description, [ky], [nam]"/>
      <item value="1100100: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [nh_ts1].Label, [nh_ts1], [ten_nh1%l]"/>
      <item value="1100100: [nh_ts2].Label, [nh_ts2], [ten_nh2%l]"/>
      <item value="1100100: [nh_ts3].Label, [nh_ts3], [ten_nh3%l]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100001: [mau_bc].Label, [mau_bc], [keys]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Kr/6nASV/k7dZT7AT4ic5rK+WrI1XtovJMoH6eKyab6T2IPE6S+iIDhEQ8v0Q0L4OpIh0RSI9b1Oroc/9ogLDEgWz0ClxOXdGFMKbcR9sk3Lg5spZN/I1PAxb7PyEuylWZJe77uNNNdDU5iK+FWutvs=</encrypted>]]>
      </text>
    </command>
    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KInAnqcXJOY1YJQqLL4krg0cRErPud/P/RswW592B1WOZnYXVphzyUvf9OZZuPJAUYbMkG0N2OTIdfoIsdN9De75WCdyY4B7VsqNqwHHMVOulPt7LTt+2XPd2sFRDCd3CqFFYh+otN78519N3J12lBRvA954Dr1DgZHt9SMlPPD3mbkDR1qUf9YrcRoa4CR6f17KUHhvtOwYkbjO9l9YYFEmcUMyL7wCMB7zTxt0obzH7Lr+2wsq03SJ1sd+WDQfEVmBvZEYcoDpmv4d+MnHyLKUsvb9PSEuLP/xp7Nc2o6n+GKOqUCI2YaWLQ8ZzOi6iBL11fhffyhJOK7gQ9aSJ/hCd1Fqoy9XMEAXXh3TvSLaqiYYSj1kgo20n5YtesP4w==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+SpeCuq5ic4WMUrthGm0QpG58M8j4M/exu0F3QaxJyg1m1OgTKxBgLkQogswQ58xBenSxHRttI5x1is+SD7p2VyVk3CWHPr+YY6M4nSlM5d6LzIkqJ6opABcClev63nTVAazy5dJFOFqooTwa4bgCQvKRNWPFDhqZgRaeAquxY77CwL4EydtsEzKTBLv85AIcyipMEFEsdJdccRzfSfpQUXTXqXvZLK5x9aeQrx8x+4EfR+T1M0A6kTjbZqOBjkyOgiXhNyq+nhwWmI7Tc3WXMXjMVSkmmzUGWbwgdk7xwjDo1cVRmFZP9F8v/jmttgKwhafanUBwkjXL8RBmfmw6KKucX7m3SI2yeWa06QQ/tx4dzxrv2Bss38C9R8R0by+KnAUx2OpUZDXgu8rHR382yIX9kVMmiOCGqg6MWveVMbhUPa8LgB7sY/Otb39d9M0TGw2SpIzlnal7ubkcJ6zyKHqsVj9vm6R+WUhBj6q5t4/hsFRfDelBuwKJ7DYv8us6ocjNEkkJdGqHR0PxNJxag</encrypted>]]>

    </text>
  </script>

  &OutlineCss;
</dir>