<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckEdition "wedition &lt;&gt; '9'">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
]>

<grid table="voptions" code="name" order="ma_phan_he, stt, name" filter="&FilterCheckEdition;" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo các tham số tùy chọn" e="Optional Parameters"></title>
  <subTitle v="Mã phân hệ: %s1 - %s2" e="Module: %s1 - %s2"></subTitle>
  <fields>
    <field name="name" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_phan_he" width="100" allowFilter="true" allowSorting="true" readOnly="true">
      <header v="Phân hệ" e="Module"></header>
    </field>
    <field name="stt" type="Decimal" width="60" allowFilter="true" allowSorting="true" readOnly="true" hidden="true" external="true">
      <header v="Stt" e="Order"></header>
      <items style="Numeric"></items>
    </field>
    <field name="descript%l" width="300" readOnly="true" external="true" allowFilter="true" allowSorting="true">
      <header v="Tên tham số hệ thống" e="System Parameter Name"></header>
    </field>
    <field name="val_view%l" width="300" readOnly="true" external="true" allowFilter="true" allowSorting="true">
      <header v="Giá trị" e="Value"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="name"/>
      <field name="ma_phan_he"/>
      <field name="stt"/>
      <field name="descript%l"/>
      <field name="val_view%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zYoXBjtLCfuFJhfaX79HdwFAx5OVbQ+jTUUESwFkfYbTOH65hQvm7xrzwblstoJ7jEDVRHCZzQiBUHg8ljRZz6bU4UL6qY94fBKHT8diXGz</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL759jkjNXNM2ySx3Jkus6J1XkwQ0M2KtdcOP1dRQpOuLDKBEC3gERtiolmz2VUwicfj27DDvuSPOk9MJpXvEfXcAE=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtYvKsQSd5MxPqwLRKDOj0SEto/85gTLSkCs/khX1w1OXuzVKkmlZ3SFkxiOh/zBY6XmpwWGMQpZBpsK6BwC5+SacMPi/2POMqs3hX9m0lA01SWHtkMHI/OUIbByfWOYTuiOiWzhUtPqTyNjrE/5RUvh6EuZis54sbc3tQcLxFoIfXx0IDG4ZvXYffOGxkgvsSY5zA6RHNRD/RpVb+trGPxy+E1n5L9c+h0SDcxosLmzAiZZYus6OMLzDFcoOksO5MhvzhjYYHhCN/AYNbBh/lm/7i/DqnzJM2TKtDeTq2HFZYl66gxd+faRbKcPDDcMr/5iV7grXyHykfoxs4c20qfpdmiwmUIlc6PULLJvNd5RGBi9rKY41mlLcRwiRLZhZHjopYQH/u7a4w4C42tP92c8=</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7x3hzVjb+R6o+3hwXnmae14JAkAufuEojlgYrzY6gVLLIF+0R030DpWClvBbmneyDjQUmbZRj2AxXs9ZNoetXHe0AKOXuriOmtkeKb3R13xhn3hcA4DIEkJdYloH4N7OAIQwxM45KqQh4yja7vyFbLn1UOStfgc1m84CaliBQQrVwN/vVdVxI1jVYFoPG9Y2A==</Encrypted>]]>
    </text>
  </css>


  <toolbar>
    <button command="Edit">
      <title v="Khai báo (Ctrl + E)$$120" e="Toolbar.Edit"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
  </toolbar>
</grid>