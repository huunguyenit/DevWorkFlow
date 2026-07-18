<?xml version="1.0" encoding="utf-8"?>

<grid table="structmpctyct" type ="Detail" code="so_ct" xmlns="urn:schemas-fast-com:data-grid" >
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>
  <fields>
    <field name="tag" type="Boolean" external="true" allowContain="true" defaultValue="0" width="60">
      <header v="Chọn" e="Select"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
      <items style="CheckBox"/>
      <footer v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></footer>
    </field>
    <field name="so_ct" width="100" align="right" readOnly ="true">
      <header v="Số chứng từ" e="MO No."></header>
    </field>
    <field name="ma_vt" width="100" aliasName="a" readOnly ="true">
      <header v="Mã vật tư" e="Item Code"></header>
    </field>
    <field name="ten_vt" width="300" aliasName="b" readOnly ="true">
      <header v="Tên vật tư" e="Item Name"></header>
    </field>
    <field name="ngay_yc" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly ="true">
      <header v="Ngày yêu cầu" e="Due Date"></header>
    </field>

    <field name="ngay_dat" type="DateTime" dataFormatString="@datetimeFormat" width="100" readOnly ="true">
      <header v="Ngày đặt" e="Release Date"></header>
    </field>
    <field name="stt_rec_dh" width="0" hidden ="true"  readOnly ="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="tag"/>
      <field name="so_ct"/>
      <field name="ma_vt"/>
      <field name="ten_vt"/>
      <field name="ngay_yc"/>
      <field name="ngay_dat"/>
      <field name="stt_rec_dh"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcId2xB+L9A0FuJAQVgRyH0gM/L5jLwqjOegq/ugev0ANP+pl12wcpq/b05VIXZBplDKKFEG1HhQleM06zlE5GM9zhGVZTkYDtOQarbMaeyUOjQNkLV1L6k9QWFU/hZXP5klyz++VkxRfcXCnx/VX9Co=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPaSX9peRH2nRZu+rKDurKV8SQqddMG9kdcvUjxHMu6bAdLEviuocfmyGAcXvxM0lwHJAoOkMbSQze2WW0g4fbCmA2DdOg6tx9+ZCcD5Iabe5OwnKNPQv0FI0NZWIAfeAQ==</Encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNGvl0yp/lxpJCYsfxfp8GEE5ybDKk0KGsLRpFEfMGS94c+F7JdI+Av+ued6HNmfxTMr57NbsUFYPMDfUN6cAK8=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fyZ7FSJOd5E836kG5vLjWEQ5erV5ptg3kw8JsaNRFgMFGVlfW2gmHAsmqG7huMjKh8juWzB7aA6FIUIcZm+Rne58P7M4Ex/L3XOPUFPUU1XImwJyjUTGuqcC81KSrhgMd5gpL7bhYTIVxMFbqh87fiI8p2QkrUORnaMfOH1QLxXCiCyGs3nW7LlE0rdQOGK7blZt0Xtp7r/bv3wwBjBuErWmLehFoVwp+JcIpb66Rzr3QPdDAb7vFVlVRAbx2nhe+kgI1jv7PI/DzQuAXlSfj/tNA1XgX2M3vRA3IQpkx1f0sAkYMjpUjbOuvtc+w73cJuHKRhU6WQF7F0BebSUTmgIwNa/Fc3VpYwolvCwUcMEVwUIXztPKl0rr7F0zvUfN7kHL+nbigfee4S7lLFOvJrpAtsvkJc77QRTBglh2aoZT0wvvSTPXpQQV6+FkYSExaOE6WCiytFTdtBKRG3x/YvOqPAjbMbulIvndDtke1PnYdyux/W6GwoLDdICA7V3gR7LYoJdaCPaZLY7pMueBLfP0SGuIn1AGAYwC1JqyQ6BXQZNs0/K2DK1hNY7JCWeW6/Z6DYOlrAglFiGJOVWsA1vRfsg1mllpW95nKKfVRDXtHorYqxch7JhuU82tUWJaRbOf4yUZmj1G4Y1XJJDhDqfEI8HVYqlLkRrRfqr/5AW4BtIBjoMOWGyxV7AKTjlzxX4huf0KKqlXvuc3jYV/kr7I315JyU3HEFDgOAdX7/H2PaVSM9F8wWLm0JT4VVDmASlXQPBxVvlVPxxQnXhzivAY1h1ecGJXXD454L3VFpVKXX/7DJJQTlBkIHx5ZRbEUi21jsVV/bqa7gMXZNpQpEiab5n7OKvUC5UYu2LRwbBkwDELx6RyAubgs2G4g7JcrFySaYq3lSeJL75HtJruAJ7bmWHcGBGT0h8qxBNLvCVLBJUVSwuYoN9OZr27xJR3Q==</Encrypted>]]>
    </text>
  </script>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcF7GuEGLaBKkxqo3N+afAKD+n8o7TWTD+WxnjyEXdXp4tSToFHr+tLMOaxpBQHh853390k0UQxI4GhIBCQK/1lWtwQtSB0S9Y2iWvuDmX9It</Encrypted>]]>
      </text>
    </query>
    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcFWvZ7oiSkWVyy8rPPLySK+cCxHSeyHvDsCzHLs8zhTfHqkiQGHr6lfvlDkHqzcnfIREwKn6FvBJb9P1Ui/DbkV6P2Rt13DudD7N/dEtHN2oESB/wEdqQs6vBWljQXB/2g==</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu26bGSpOxclCTapcY8M1lxxaz5arT8haVF32HIcTt7pzQbJ2lGQ1SmhKQtD2pzbA9JpQcgLjtOElF+UzZu3nSFzorKqgS/VyqJOZWTmn/QtRqWYJvHOgTffeHdk01F4ay2nQJSUxzY+98oxg+8eTXetvD/8vfazZZYNiwwS05eMmHmKM8JkpZ+JuoDlAzc4hCSmx9tglMVWxrvuLmrwIBvs=</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Erase">
      <title v="Xóa đơn hàng$$90" e="Delete$"></title>
    </button>

    <button command="Retrieve">
      <title v="Toolbar.Retrieve" e="Toolbar.Retrieve"></title>
      <menuItems>
        <menuItem commandArgument="10" urlImage="../images/Menu/SalesOrder.png">
          <header v="Lấy đơn hàng từ hoạch định sản xuất"  e="Extract Data from Planned Order"/>
        </menuItem>
        <menuItem commandArgument="20">
          <header v="-"  e="-"/>
        </menuItem>
        <menuItem commandArgument="30">
          <header v="Chuyển sang lệnh sản xuất"  e="Release"/>
        </menuItem>
      </menuItems>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>