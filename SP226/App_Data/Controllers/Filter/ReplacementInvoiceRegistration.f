<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY r "'HD1', 'HDA', 'PXC', 'PXD'">
  <!ENTITY j "'HD2', 'HD4', 'HD5', 'HD6'">
  <!ENTITY f "ma_ct in (&r;,&j;)">
]>

<dir table="hddt01" code="stt_rec0, stt_rec1" order="ngay_ct0" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lọc số liệu" e="Filter Data"></title>
  <fields>
    <field name="ngay_ct01" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày chứng từ từ" e="Invoice Date from"></header>
      <footer v="Ngày chứng từ từ/đến" e="Invoice Date from/to"></footer>
    </field>
    <field name="ngay_ct02" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày chứng từ đến" e="Invoice Date to"></header>
    </field>
    <field name="ngay_ct11" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày thay thế từ" e="Replacemen Date from"></header>
      <footer v="Ngày thay thế từ/đến" e="Repl. Date from/to"></footer>
    </field>
    <field name="ngay_ct12" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày thay thế đến" e="Replacement Date to"></header>
    </field>
    <field name="ma_ct" allowNulls="false" aliasName="defaultEIVoucher">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="&f; and status = '1'" check="&f;"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1))) and status = '1'" check="((@@admin = 1) or (ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_access = 1)))"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="1101: [ngay_ct01].Description, [ngay_ct01], [ngay_ct02]"/>
      <item value="1101: [ngay_ct11].Description, [ngay_ct11], [ngay_ct12]"/>
      <item value="11010-: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="11010-: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1snEZ3LakEidUn95J9J7awSf0X5ikG8lmtoLX6voG7ak8yYof89h9r9AlAij3I0SCE0kIuK6zkwg1++3j6AOLA1jr4Wb839lRp8J+2XLPNPO89YdGqjBYRkY2rBnbgjRuQYfAOU009fouhQXdvdF+o4IKZH6VEzlnbivcgg2iKRAxcMUSn/okz80FGOfKCmKdsP1zL6EVuWsrlR/myFy840yNGhcMleFKspCIHo16RhytJvzP3mqv7cFWV7aqbkT2Ju1obYZLpcwuFoJtUFll2Ob4Eh6Px+k1VnO9lq3juI</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcKeQTrejyfMsWhyx/15RRPOKuGyVZHR5Q8T9Ocig0WsqRXHo1ihciuiVmGjNTBk9Bz2UVajevlNwN7rr2HhPXGiMrzTKkoXOGKOVOPDb3ea78R6AtfgMvkh//IYznyXzugv6MlOSPJfZrpqe6HqS+Zsf+sXeLRktuSTpxcuzk2X5/bEaw+CbWiajEsNXX+3vRnvlxjkXRmDTk8SFlrmO99ppnx5EcxyA+o0ZPAKwm4pL/cy4EeBdzQfA15cbPxygxhNeBZ2e4nGWC36LOp/RFv7HWRB+vxCE7N4X/+T937YrCZRsgX/GAG6JWmHpZArZqycl1IP0EkkFI1VvzH++yVM=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RUEW0slMShueWy06PcBDyd9ktXeZZLi+u4e3uWzzfV6UBkjyLCJvaQKhV1r6qPPTglkHqnaRjYR8qCTAKvDrzcU4U/yp/dR/ROwx10d9NsGdcrRnfTi9DMIycmacsrp0d0g7zv5QQRr22jB1AqZ6VzHU33wvthJeNpeL2grgV1oo5imxBhcK4xZWRGBKBw8fqAhpW9wzWLoUKvnh/AvsP2qz9SUa1dgHrzMgFc21c8wNnZAIztAzKg6PsWTNHUdv6ZlWKS75tixoVV/HxIcOF9dTFNz+NizY24w+82wjEqy4tOJISXvD9XZZpBrQ/zeL57DoKyzWR06icGOhSMxK7yNe6IFVLdGFQxnYMcRiSP4hYxT9DMe8llKT6DAvld8gVnonZutUUJwk+1ApKaJqzcaOFRPdAAvtWHUv2AjWgWw1FW/j4hHfNX7/BWh1KzD+n9LrH/oTbLnSm3fFEY4Z4NsM1ZHTZr/0WcXwC0svQ1BOwt5i5WU3ZmoKBxxOmY0tXSRpRnHkZhZn9CxOWwYsycB3PQA9myCFYOgFTqqs5gSv7HDnZNr1L3HaGIhHCHb7n8fFOre9Bw+6rQX7By2FGMddcWJ8zXEJBlIaDqPAKdjFwwIpKqAouwCA76TirEgGc1/S4e2VQBnHiNFxeEmdg+SWRQmHj/xI77A8zZErWDce68xkVlV8Nguu0VkFaGIQMJ1NfuOJBPiQ+xj+ZpIk0YKkPO94cMeE32BcP2AeiOud2VGKdDOW5TA3BA/VdzoDps4H28kQQCGp5tp9hxTxx+rkSUQPwKPIQ3fqZ/Rk7QnXhVbcqN87B19GuwJ1NYXWpGkKufkmUEdAow09HpK8s8Fk43M2X2N0+RSr/mK3ay4YbVP6WE0dj/gQqvnKKI481MsSD1a359mZpj3kN8Dk7VJOfodbKc3s18DjdcAi3tZ9/jaD0+21eVaM7i3keHwz3G7a3gAD3+EGIth8mOigKcAV41poXp1sJFHQxib3qslKIWIiHv9Dcgr8DxR4Usfbryt+/dmb6EnWqyvq2x2pS3STeTO11nvzhQoJ2bYwNbw</Encrypted>]]>
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