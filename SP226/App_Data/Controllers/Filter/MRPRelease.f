<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="tu_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Từ ngày" e="Date from"/>
      <footer v="Ngày từ/đến" e="Date from/to"/>
    </field>
    <field name="den_ngay" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Đến ngày" e="Date to"/>
    </field>

    <field name ="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Đơn hàng từ số" e="Order No. from"></header>
      <footer v="Số đơn hàng từ/đến" e="Order No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name ="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100" filterSource="voucherNumber">
      <header v="Đơn hàng đến số" e="Order No. to"></header>
      <items style="Mask"></items>
    </field>

    <field name="ma_vt">
      <header v="Mã sản phẩm" e="Product Code"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="loai_vt in ('41', '51', '61') and kieu_hd &lt;&gt; '0' and status = '1'" check="loai_vt in ('41', '51', '61') and kieu_hd &lt;&gt; '0' " information="ma_vt$dmvt.ten_vt%l" new="Default"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kho">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="maxLength" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 100, 100, 230"/>
      <item value="1111: [tu_ngay].Description, [tu_ngay], [den_ngay], [maxLength]"/>
      <item value="111: [so_ct1].Description, [so_ct1], [so_ct2]"/>
      <item value="1110: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
      <item value="1110: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
    </view>
  </views>

  <commands>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<encrypted>%IYfbRnGMZu+vvTXZ4br7Kg2Iu2O0GAi6TV34jybrI9vnxmiIXt2VEAtCikBc+xWOlGS+daN9Eosess398/6sulfWsMeTBGG7wFzg2LA5KaJv7pNMDI4ocUkss4ScAZxvapb4rlotVc2t5oEnFIFWtTOsAntYe4W3v8QNNSm1LR4=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Jm9ipjJmxPMRQmnJy2kiBbusa3EjFd+kj8SHI083yVYU3jg67mYTmJvr0ghQ2FoZbHIzklYnV8t/i1gFxjmm483dLYLoMNHd2GlBBCYXZZ7E2hFv3L67BS2hL+OxYzje0R3i4W4dw4Uq81KHpnXr2k7ncX1WDOk+KteKOos1xFIn6uQqYJomPivdg7k6MHnc6Oyalyf0kxWWCH2Qt5dVivpqsB2Fx4MP/eCSnpRV3ALYmuSZUnXX7fLrje610mzpPUuaa/lZ28C53tRPZEcq80QJFNaxkJM0Ip9sDze6PuUkT3t+WNkb9Sl7/M6xGxRqparInJGU9sakBHTnL9SA3YCbc72cBRsaGAPoCUret3F7TX84CMpnGHY4aAUfbOL7Dag4VkPXNgFHMQ7pzu6w9euU1LP3+LKPJY82RFBYLyj7DbUEoxROr2os0H1gUjtb9CD0I3Q3tywMhdzzeJuH1D2N5slsAgPlWqK6lVxAXR1RZVmub+Fa/jCNQUN8yzkew==</encrypted>]]>
    </text>
  </script>
</dir>