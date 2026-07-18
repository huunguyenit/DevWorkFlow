<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu từ" e="Counting Date from"></header>
      <footer v="Ngày yêu cầu từ/đến" e="Counting Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu đến" e="Counting Date to"></header>
    </field>
    <field name="so_ct" align="right" allowNulls="false">
      <header v="Số yêu cầu" e="Voucher No."></header>
      <items style="AutoComplete" controller="StocktakingRequisition" key="(ngay_ct between @d1 and @d2)" check="(ngay_ct between @d1 and @d2)"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="126">
      <item value="120, 30, 70, 100, 100, 130"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="110: [so_ct].Label, [so_ct]"/>
    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOORcN5iELDDuylhp4ceOC+gV59qpvL9lUAUr1JPKHIB3vmb3zRwwTW4wXYn9XZ0zc0IylO6n9DMkbSiDKlLlMXlztpmM93QRf+udANtCQCDbaGW8Pt94eNrBkWtiPtEog==</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8KU3qC26YeKeL7edhfPrfpgZONKdU1UPWxvzyV+vn9pV8AMouFBAF6ZfFNjB8xB1ohB+NYLwmZGVZnGJWnlC/76UTkVbduA498XuwQbi0hfUb9v2JGBx4uF7k4RSWMzV1wJ90kNT17/XJHA1790eaDwd3yzxo+mvp01rCE994TnAsqjboeNGtk3mYWKYv9PXQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5B2ARh+M1OAT8p75lJ0BBgqhKM+ogaIyRRtI58CGHErmA8olQGVEyG6F8Qcm0FVY/Wpe5mqqOTB1cxWnHI8rzcO3XQD1AiBc9K7apwmC4drf944PL7aRScEeHQ6WxgGO8u4WBYrWvMxVQLf6UmAJBV2K9vrkY6hO7vJnziQ0xRGyKocYiQKjm9NiH8he1CsalHCI9eft/qc77nRvrpHnorF31nT36FqQbbY9+vqGenBp0PpVXpMuZvGXO65qgIOcbTtFj5VJ22AwQgUGChuelOAI7tUlH/eZIe4qzSybhhGXRPuwFeHqp/OgMRM/I1ujUVmF3dtG15hNya9GDDFpAfiUc9E6/9eZhwt/T0eYxvyCddWsaoFsTPiBa0K7vQVwpOWWYhsVxFutAhAmBUSSe9plWq+L65L98bv7a0WSL9okizgS3o1b+iemKk05w9rNYkSAyP6c8uttBsgO92Lmyy8b6oL30386x0vQKUeLl2LYJFoqfKKlugJIPOs5QFQugy/QWsgWoZdwMdcYlPq2+0iOxIGES/Hhx6gYPNDzKs+hYdp2xFDcpS11g7xTnH5GCAOPEjJ9jfXSBOUk9L/7x4=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQEHzcLjZnUFdV2invek2XIJUoTDQHy9l80xpFlyKrqKYW8HoKalNM668kDvv8npkLBNuTzs1P6VrlHwISF38iPcgRlZul/kiqPqs52loNAVep+GWIOIFr9cB+mhXhti/emZph237CpcUuNwXhlDTeuPdGxlCUcYLgbxQcvaJnV1UmREFVSX541bZgZ7oRfLo4X/vSiRNivFts7G9S4oyMdf/83yr5B77U1H/bhy1vF7maeVZHTT1cFlqsWQzoJ36R8z5n2upn85VDbAH14miHvzs629lziogSI1wHPeIwwKgoLNjuv06SK61LrQ+Twd5TgulLhgM4+yJaCz//P6OsUtw+D9muentv+M6ULpAI0Hw+8ROJ7dJMVVdHem6EtXq77Jnp1RTH1VdFtMNTF7Fj/37qyfQ6m4lLUpKImGXGXqCnLBo4FI3Y4eCO+dBptgXj43rcycr5N2c0edffqMbBg4W8qn2Tgbsbwm3kwqJYEL55z8zhwJQl3Fxv8TwW4Nb/NPnS2jhXYs5P5EKUnisMfZ08Fq3TbMoP4XvyuvHPVeDQ9QElTCK1hWswq2zyZn65kWMPwWXrm5ENv5ddSUVADu+4c+BvG+NvB3Ay2JSc6v/0ZSecnf6/z94X3W/AqQGY9JZH8uUGBbjLoMRvv45GzttUHA19Mbg3acFFiknmDD8PKohVmyFFewTIO2qJ7TI/5ryf8Avie3iy1LWtnWtVOuzeg9Oc2aecwStGw/KZKUtKLHIpzvscvR5avphOBk/KxLWeTTON3IcY5QUxHtfF2+mpzxik5MkphphrRaagVjxcTPB1bYW+kJU6xMdh3JPMXUqzhoF5xVh6LtKYWl8PadIdibVlCBigt2fNvYGlPkuyZ97qWHyU1TIfMv2JlJQIjzIwTuEi8xHyhleu1ZZ0XHfa7rdKm/v4ASNCNsMErN</Encrypted>]]>
    </text>
  </script>
</dir>