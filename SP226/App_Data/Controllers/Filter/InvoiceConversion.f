<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY f "ma_ct in ('HDA', 'HD1', 'HD2', 'HD4', 'HD5', 'HD6', 'PXC', 'PXD', 'HD7')">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_tu" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày hóa đơn từ" e="Invoice Date from"></header>
      <footer v="Ngày hóa đơn từ/đến" e="Invoice Date from/to"></footer>
    </field>
    <field name="ngay_den" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày hóa đơn đến" e="Invoice Date to"></header>
    </field>
    <field name="so_hd1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Hóa đơn từ số" e="Invoice No. from"></header>
      <footer v="Hóa đơn từ/đến số" e="Invoice No. from/to"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_hd2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Hóa đơn đến số" e="Invoice No. to"></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_ct" allowNulls="false" aliasName="defaultEIVoucher">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="&f; and status = '1'" check="&f;"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>

    <field name="ma_nt">
      <header v="Ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="39">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101--: [ngay_tu].Description, [ngay_tu], [ngay_den]"/>
      <item value="1101-1: [so_hd1].Description, [so_hd1], [so_hd2], [maxLength]"/>
      <item value="110100: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="110100: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="110100: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="110100: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>

    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1snEZ3LakEidUn95J9J7awSf0X5ikG8lmtoLX6voG7ak8yYof89h9r9AlAij3I0SCE0kIuK6zkwg1++3j6AOLA1jr4Wb839lRp8J+2XLPNPO89YdGqjBYRkY2rBnbgjRuQYfAOU009fouhQXdvdF+o4IKZH6VEzlnbivcgg2iKRAxcMUSn/okz80FGOfKCmKdsP1zL6EVuWsrlR/myFy840yNGhcMleFKspCIHo16RhytJvzP3mqv7cFWV7aqbkT2Ju1obYZLpcwuFoJtUFll2Ob4Eh6Px+k1VnO9lq3juI</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFSesqNXIl+kdAsZroBdqAzZPfcbzh+su4dGDO0HdcXrGSkq5tBUCX1O6Jh3ClRlJiA8cUy7wsVF5Gb4Yp6t3Wk=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4dobEStpXvEM8i1YuPh0edC/MdrhTU2nj3mvPJxbSdxRPeYeSwiQtPjJhljvOh0d9+zkARucElJJhooTP/udIQleZ+i+oetq2nkrU08aUrRhUu4efY03VpkbYb3xZsClVmLvQY+SihaNmXg6zDePGa04kRVoPH9atxyUAaonmd2a</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdOAE7rf7u4jURSPNN4P/B7ZOfA6PRh1wzNOF3/XyvO3k6WZk8/g63Ih449AH0UKN9S89R531/ZB90rQjsAXds9e1cXFzstdoOwpdrCzRZZLEfP1ObHaXX05iA9lctMHyspFdL3eSwEVoT6/82Ic2fVvzyCeW6gSTKDo6/od071/qOx2e099sfPh0lYK0pxH5y7Tyvrc0Larfln8/Jcw54U9qFzutBTYGic4STcn19alLSGPMQV+9TUJNmztAq/mesOQmHldEhGGwe8FlkJ8laliEq3AnipI8a4Q5J/pP/Jv2gWZAfUPcqo9of5IQ5QU3Cu/5W13Qh07/zrVmud9GzEkcWhVUco4Hs9LLGb0S8PRRkZGZiW5KlE6BGXG3OsSLJKV222non0fE8yVJvIQQidVJWm8pTPz3HzOizrVBoYV5yOMeXmWki8FOyz8X6ca+MhBmNw3zGSWQlI/WtDQxoqud5cuRHKqwc8taDbUBZtF7JuMBNh7x8l3hAIBAkoo5zgU/T4Klu1NNktOIFoHtPut6CivnyvHELP/fjX7vsUW/3KZCtSSMBcFxnYKKhKmCKgKrXdkjLd7xIcKAnSf2d0NBzd97Nj3DBbmbw8ewlIXq1p1OhcoXE/qHLKcX7WEKhsAFWwBaSvVBH9yWaY/tWQzYilt5kSZlDiQKiapPY5nSRBId0+xZubKG4lN8laU6DrxDTJgV8tiP22uPf8X+hysquwZda+rCgW6qK6WnP/d+OG3Um8LBtKhv6meHVzm06NpeGjwZKvBrX7xrEO04OFg0JpDzmb3Aud9bSH/yjkYR</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetDefaultValue">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuyI8ZCcQblE8Np3nK/w5LUGuwA4vdYDEyJ/POluhKA03h0yFUzmUF7Z9V7sW1Ztk8lSm0qwGoDxxme408QrYurVo5Z/AFvWldaR8LYK4IUb6ihN4vC+My0hgmmLXLER9a31gVZL0qwaWlOx5A4K7trs=</Encrypted>]]>
      </text>
    </action>
  </response>

</dir>