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
      <header v="Loại tài sản" e="Asset Type"></header>
      <items style="AutoComplete" controller="FAType" reference="ten_loai%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_loai%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_bp">
      <header v="Bộ phận sử dụng" e="Using Department"></header>
      <items style="AutoComplete" controller="FADepartment" reference="ten_bp%l" key="status ='1'">
      </items>
    </field>
    <field name="ten_bp%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_1">
      <header v="Nhóm tài sản 1" e="Asset Group 1"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_1%l" key="status ='1' and loai_nh = 1" check="loai_nh = 1"></items>
    </field>
    <field name="ten_nh_1%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_2">
      <header v="Nhóm tài sản 2" e="Asset Group 2"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_2%l" key="status ='1' and loai_nh = 2" check="loai_nh = 2"></items>
    </field>
    <field name="ten_nh_2%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="nhom_3">
      <header v="Nhóm tài sản 3" e="Asset Group 3"></header>
      <items style="AutoComplete" controller="FAGroup" reference="ten_nh_3%l" key="status ='1' and loai_nh = 3" check="loai_nh = 3"></items>
    </field>
    <field name="ten_nh_3%l" readOnly="true" external="true" >
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
      <item value="111--: [ky].Description, [ky], [nam]"/>
      <item value="1100100: [ma_loai].Label, [ma_loai], [ten_loai%l]"/>
      <item value="1100100: [ma_bp].Label, [ma_bp], [ten_bp%l]"/>
      <item value="1100100: [nhom_1].Label, [nhom_1], [ten_nh_1%l]"/>
      <item value="1100100: [nhom_2].Label, [nhom_2], [ten_nh_2%l]"/>
      <item value="1100100: [nhom_3].Label, [nhom_3], [ten_nh_3%l]"/>
      <item value="110000-: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="1100001: [mau_bc].Label, [mau_bc], [keys]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7KrfAMmztAe3h1T2XUwhW/Pn5m3yh6p9eMvfjr73FA8vl87o2hajjWoJKwcRMt8bVsw7HCY5/1UOVKXY5V/M3cLSH1c2hByRHnG7a3iAihFyBwPi+MSgk+mqEV7djBw4n7DCErl/76fyPLFOfhgkr970=</encrypted>]]>
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
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm4+SpeCuq5ic4WMUrthGm0QpG58M8j4M/exu0F3QaxJyg7CzRmOI1c+V537zDhYve3MfOI9yqph945UG7GA28kPTqbkpMqO3XyadcsymZ8B9Uj3nJXi/PtOfRyIeFFxN+L7W2qvhmzBaD9NgEm/xAi9ywkfqnqsDvkJD5UwHUR3RAUnad7uPDAZzEm7UymoDz+wVI0wJ5mxDz8gUMpmSH3xgWRYB6XL/hbVynozXKPLEBia9WYQpaD43ObLCCzmSu33HOL9Tee87FlSngNOUQczp/1pGiQpnhmJON3g/5E/VfBAV/fI0hZlOEPp3f1vRDxZCHWBqBmV9gMUS+jvTU4hW3ExtnEMfHBbNMEPf9lh/xJz7QvmYuz8+yBnXU24b0ClrBEIuPkVWxhSdWSM9QRupTJrGyMmVzvIyTUrYFObPAwwRIfY6Vjq5KhBbGQTlG5qexwNDS9YLRwnUh7z9choQrjMFpX77Gjoke065psvSbeBE69wGGmdzptPcGbNCirG7MxE/EmFraQ6topYbWRix</encrypted>]]>

    </text>
  </script>

  &OutlineCss;
</dir>