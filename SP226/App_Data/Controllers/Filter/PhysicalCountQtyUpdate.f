<?xml version="1.0" encoding="utf-8"?>

<dir table="kktt$0000" code="stt_rec" order="ngay_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="ngay_ct1" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="fromDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu từ" e="Request Date from"></header>
      <footer v="Ngày yêu cầu từ/đến" e="Request Date from/to"></footer>
    </field>
    <field name="ngay_ct2" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false" aliasName="toDate" defaultValue="new Date()">
      <header v="Ngày yêu cầu đến" e="Request Date to"></header>
    </field>
    <field name="so_ct" align="right" allowNulls="false">
      <header v="Số yêu cầu" e="Voucher No."></header>
      <items style="AutoComplete" controller="StocktakingRequisition" key="(ngay_ct between @d1 and @d2)" check="(ngay_ct between @d1 and @d2)"/>
    </field>
    <field name="ma_kho">
      <header v="Mã kho" e="Site"></header>
      <items style="AutoComplete" controller="Site" reference="ten_kho%l" key="status = '1'" check="1=1" information="ma_kho$dmkho.ten_kho%l"/>
    </field>
    <field name="ten_kho%l" readOnly="true" external="true">
      <header v="" e=""></header>
    </field>
  </fields>
  <views>
    <view id="Dir">
      <item value="120, 40, 60, 100, 230, 0"/>
      <item value="1101: [ngay_ct1].Description, [ngay_ct1], [ngay_ct2]"/>
      <item value="110: [so_ct].Label, [so_ct]"/>
      <item value="11010: [ma_kho].Label, [ma_kho], [ten_kho%l]"/>
    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcJBXmYgSlKDf6IFdppPKnEVfvzWvnd3DMT4JJiaLfSNzcwghJ0wUhVjyzUyaC1+KNZrlbo+y83JN3viaJsnrbrr4avyFk7xigzsk+dQQ/baf</Encrypted>]]>
      </text>
    </command>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcB0mV/3C8B746Tq1ALdoziSXi2oEA8DJTSmzqGWd9Qhjyb5NMmBxScO2Q8Cd2G/+LpjWtmcbADmvqzq/E4Rk8xn00t5c1a0TgzJ8IOPVcgND</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNDlcIidoSU/zqwgtjO7LJcRZCr2EMdLc3QUVHSbwBRMeFuTCzWDCfezTXSTMgJq95AafOco9aWkRQb6Hgr5LkWGSOt925Zyyb7OWEIfXonT</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5B2ARh+M1OAT8p75lJ0BBj/ChVNDvBq3mzdnF7Fxj9HnOVwGSgveq9TKsn5hxVGhAhwbRC3jSLye2Z1QpGghX8LEFMM4P3WyBt1z7R656VvkdCgcgyiIaC4qPjhdg8A87yPnYnPvVAAgrDPZ4ElY7EOAgvBaNyN5M5AJECrEzSOnarOGUpwkt5hQnpWPDLRiRda0aARgIl2Z1eHshDY/pAxLN56RnLdirpMyau6PhyJ1LXntmbmuk3+htx/biQpGtYBJFRLuI8KsirxgeUoV2hrqpgj2/P5c9JadrR+TMI6cBeK+vXA2v/RsvwNOrlsbdYmcQy3RX/gyLoFfo4Kcier7mszXlbNxhk6X0fEbz5Xavm+ktHfJtavdpm9izAc6lu+oKIlFoKHFec3Yd7XaOHd4XgsGwT73C6jMLwoLlGWu9unolzPE9PdJTN6VveEOIL+oHFhX8OVWV4jCdNxa41tRI7XYQp6Yp7TsYAmJ7gy9ACRCWjuF95SHHR9fEHMEcsANm7MWPz0XvZHRvt0+r1bg2S4kZrg0kjwqa32hMMKDknFyrjKU/Vb3WDonHI9IgGtmP4ZaQto4cyb5NgXxK9o93LLc6w+Sw7RB67Os/FXG2I65gf19apxbh4y88xPXlL44iBuhsEOR7ER7F79eOk=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtb3PYw4rZL1tlpanXOR6qUesBB9us/QpqPpqql6t1tsVJOJCAQkyU42/j+e0Arj2kh/5PsdVWWH00Tw1uuP3VP3NkEDReL3AFnYQoSW71FaAclF8YoiWREpIXsFT1F3rofCCLj7qsOebmpuPN2mqTH8wZsc5cQYc09Xn4UbKRB6WCyX0zuNFYME5W6MHyXNXNBVu4niVwgUgisEVG80vK2ZqZmwUPiaVt22SccqYaGY4egHstASoh1CxPp+Hy617tnHJ7aZTMaYfgP7CNDF0xYNd9UZo2mImFmutv5LXSbTs75VOJoRHIS4s3cvhHt5+SWPNMeWBGugAseevBmL2xEsbiDkRnYzc9bDIfSz8b2ogg29jQMczeNWljs9Oh/cSBmFJmanBgX6hhzK2erk7m54wAOMNFS/rWAZ5d+0JvT8ndRF/kJPeVVpR2haCRwFVIPustWFrIaejAQtScHQQemTr7PTv1J8KOOo+HsYUync8XrLkgXmrWDhAiFQ7vFL9RMFUIZsb88WwN4xjZaWerkIE6cgGUXvBOcf4gd/T3ds/catvp0HAubVDtZmjkS21aT5FzrBggG28IA5XtdsNyDRznKw9tZzNyT7kBBZhNoKbqnq9/2VdgGqLYHj71IWwJAXDFTccK9q7qjBNIgQzA3bEOq0oItbCui6k7WpNJKQXsTJa65bet2ereWWNqzpjjQlRjDimjpviu6iM1CqK8edyQ9zm+/NEbidkDxvc6t8SqtFgujNgEu/FCVVYdigmJpEngnPueVK43QersZJ6+yi11eOOUY8n2fwa847F6zkkO9jVY1p/2bX2NxaFVMNJihxshOYcgRG5deZNTqyl/lM1tmiSIQMAsyox8BBOO+fx4SyzciQ682yqguEVGxtR1rCgyhvaFE6E+FWlNj3B94w9VtGn2fPjBkBSJWQx5Q6g/FnUISzOiyFCgjQfOfTw1+y9ZGpk0bYP0u7kZdU8L+k=</Encrypted>]]>
    </text>
  </script>
</dir>