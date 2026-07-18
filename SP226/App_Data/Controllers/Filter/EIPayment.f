<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY f "ma_ct in ('HDA', 'HD1', 'PXC', 'PXD', 'HD2', 'HD4', 'HD5', 'HD6', 'HD7')">
]>

<dir id="0" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="xu_ly" dataFormatString="1, 0" clientDefault="1" align="right">
      <header v="Loại" e="Type"></header>
      <footer v="1 - Thanh toán, 0 - Hủy thanh toán" e="1 - Payment, 0 - Cancel Payment"></footer>
      <items style="Mask"/>
    </field>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Chứng từ từ ngày" e="Date From"></header>
      <footer v="Ngày chứng từ từ/đến" e="Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Chứng từ đến ngày" e="Date to"></header>
    </field>
    <field name="so_ct1" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="Số chứng từ từ/đến" e="Voucher No. from/to"></header>
      <items style="Mask"></items>
    </field>
    <field name="so_ct2" dataFormatString="@upperCaseFormat" align="right" maxLength="-100">
      <header v="" e=""></header>
      <items style="Mask"></items>
    </field>
    <field name="ma_ct" allowNulls="false" aliasName="defaultEIVoucher">
      <header v="Mã chứng từ" e="Voucher Code"></header>
      <items style="AutoComplete" controller="Voucher" reference="ten_ct%l" key="&f; and status = '1'" check="&f;"/>
    </field>
    <field name="ten_ct%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_nt">
      <header v="Mã ngoại tệ" e="Currency"></header>
      <items style="AutoComplete" controller="Currency" reference="ten_nt%l" key="status = '1'" check="1=1"/>
    </field>
    <field name="ten_nt%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_kh">
      <header v="Mã khách hàng" e="Customer"></header>
      <items style="AutoComplete" controller="Customer" reference="ten_kh%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_kh%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_dvcs" allowNulls="false">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status = '1'" check="1 = 1"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>

    <field name="user_id0" dataFormatString="0, 1" clientDefault="0" align="right" inactivate="true">
      <header v="Người sử dụng" e="User"></header>
      <footer v="1 - Lọc theo người sử dụng, 0 - Không" e="1 - Filter by User, 0 - No"></footer>
      <items style="Mask"/>
    </field>
    <field name="maxLength" type="Int16" readOnly="true" hidden="true" maxLength="-100">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="39">
      <item value="120, 30, 70, 100, 230, 0"/>
      <item value="11100-: [xu_ly].Label, [xu_ly], [xu_ly].Description"/>
      <item value="1101-: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="1101-1: [so_ct1].Label, [so_ct1], [so_ct2], [maxLength]"/>
      <item value="11010-: [ma_ct].Label, [ma_ct], [ten_ct%l]"/>
      <item value="11010-: [ma_kh].Label, [ma_kh], [ten_kh%l]"/>
      <item value="11010-: [ma_nt].Label, [ma_nt], [ten_nt%l]"/>
      <item value="11010-: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11100-: [user_id0].Label, [user_id0], [user_id0].Description"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu1snEZ3LakEidUn95J9J7awSf0X5ikG8lmtoLX6voG7ak8yYof89h9r9AlAij3I0SCE0kIuK6zkwg1++3j6AOLA1jr4Wb839lRp8J+2XLPNPO89YdGqjBYRkY2rBnbgjRuQYfAOU009fouhQXdvdF+o4IKZH6VEzlnbivcgg2iKRAxcMUSn/okz80FGOfKCmKdsP1zL6EVuWsrlR/myFy840yNGhcMleFKspCIHo16RhytJvzP3mqv7cFWV7aqbkT3cxbrk64CQFE0yIZg3tJnp+hAE3zTKJ91kWjEWpMuB6jPfN+z6yhVrMhwqzQbScl7zV8iSqcdufUtzvXrrPp4k=</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu+mVdKuhWVt8i3/5T5rw2U6k477FUYCApxgD7Q+IkbPqofSiMRNCoBVcxQY8DzHxtGh9+Bz/TshDVeUNNkOfN+1507Zz0EtIZpMjbzpNvJM0urJB5sb0+w2WBgnLz8Ze16ij9lBt7RgE/Rbc3DrQDJeqlpZFlkSwjTFgyc4WSbWW0Zu5I3dgg/EaymUqa72Kt6YCgdttFP7zAiINdc2z5Ue0Al4qOrLbHc2M75pU8IYcv7M3nj1FDd2LEvwB3Mf/SRskMhm1eyg0caTxE13Q5gAi7m/f9ZpvQ3+8nop0fXVh0xweWHtS0M+5XEaqqgdJHxGFbqV13aWZDNGAqE+vwkDt8Bwc3GpfKkBTL5HBt0/SrZ6QCn57GdMV7lwwC7170g==</Encrypted>]]>
      </text>
    </command>

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4RDczbcKmvg8tdgILqAkX0fvDua2KUH3PgvZ8kokAlT5jWmn2CTVRA6aisEuBgkJgXuX5eGypYUfH9+oowzotV9F3eMI9a6rQ3cWVqW4PKFTfiL4IY5lulG6U/0nGWaPqw8iDtlDRR9vChs7kL+2xKaGPqiA2FexiAL176iG1BEq</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdOAE7rf7u4jURSPNN4P/B7ZOfA6PRh1wzNOF3/XyvO3k6WZk8/g63Ih449AH0UKN9S89R531/ZB90rQjsAXds9e1cXFzstdoOwpdrCzRZZLEfP1ObHaXX05iA9lctMHyspFdL3eSwEVoT6/82Ic2fVtgtBNDEfbfGU2bmKV08fGdtNktZ6oKAuXjgjv7g12FXBotxvmWVIpkdA2EvyP/lpsDr34AtMnRLNNUbEhsD6IKiUuh0OsDidVMtKUrLwgrt1pJOfxg0VO1TNHI/D6mJ6zMhZWe+f+6R8mGGfFXCgqmAEe/HjXcUNZEGRJAwD850j0XYc7HjXuB5K0vshPw3Rs2Y5ZsxdJPskviBl26+N6QDy+pVvRENKgB6IN/zXlxdAmtnzDbbWTHcFWD5B5Fx60q11aHbNkP4beDJyIh9tt156q3EZR2zOJzPRK5IhLnPM472/Vxg7tWi66v7SiivnMWd0tN0Z1qQzbmnkxrsEs17Xdtq8AyOGVF3JSpzaOs8wxbh3rWye0SP+na8RuriI1Y1PxISp1+5jwdHYqh3RBV0tQ9fS9Lw/ENP7jMi/KH/tjLVPX7Na9pPEUF5wEnsq7IVil9apZK3/slB6+Ixa93uU19+B57OXPamqNc1OgMZQDImRct5s6pWW/NsmcVADdgG4LcbGlB7mA4aRvSzPD/2JDEQ6ppY9puM1Jv/0a/88OAgCcLTUhL6SXUgPT5ZfTWGJVDdgp3KH1JKyjl1h4Y3ORQQqOOM2B2cKHZ0J+qW9mCGj3PuitxdS8CFdH06IzU8kar3Kc7apSf/v6Z9sMdtk3+TxUK5kauM4aaPJKSajctd77vpHTgkkUXw5ZLQm2EWGhe7UghEFaZj0cFN0V75D5tZ8Ee/z5npt3gSNRo5SVLrO/WTIyoXqgVJoCuyns=</Encrypted>]]>
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