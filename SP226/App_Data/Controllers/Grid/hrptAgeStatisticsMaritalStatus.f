<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY XMLWhenReportLoading SYSTEM "..\Include\XML\WhenReportLoading.xml">
  <!ENTITY XMLWhenReportClosing SYSTEM "..\Include\XML\WhenReportClosing.xml">
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">

  <!ENTITY % Repetition SYSTEM "..\Include\Repetition.ent">
  %Repetition;
]>

<grid type="Report" filter="&Repetition.Key.001;" repetition="&Repetition.Key.002;" valid="systotal = 1" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Báo cáo thống kê độ tuổi theo tình trạng hôn nhân" e="Age Statistics by Marital Status"></title>
  <subTitle v="Bộ phận: %s, ngày báo cáo: %d..." e="Department: %s..., Report Date: %d..."></subTitle>
  <fields>
    <field name="ma_tinh_trang" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã tình trạng" e="Marital Status"></header>
    </field>
    <field name="ten_tthn" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên tình trạng" e="Description"></header>
    </field>
    <field name="cot1" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Cột 1" e="Column 1"></header>
    </field>
    <field name="cot2" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Cột 2" e="Column 2"></header>
    </field>
    <field name="cot3" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Cột 3" e="Column 3"></header>
    </field>
    <field name="cot4" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Cột 4" e="Column 4"></header>
    </field>
    <field name="tong" type="Int16" dataFormatString="### ### ###" width="100" allowSorting="true" allowFilter="true" aggregate="Sum">
      <header v="Tổng" e="Total"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="ma_tinh_trang"/>
      <field name="ten_tthn"/>
      <field name="cot1"/>
      <field name="cot2"/>
      <field name="cot3"/>
      <field name="cot4"/>
      <field name="tong"/>
    </view>
  </views>

  <commands>
    <command event ="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHls1/nfOq4E/sdEe6I6f6ml5jBLOIKb1Li+0wv6iG8m7K2kca2P5LW7mmj2GPxqwX+Ss+GjXTjLi/eVSEeXC8M=</Encrypted>]]>
      </text>
    </command>
    &XMLWhenReportLoading;
    &XMLWhenReportClosing;
  </commands>

  <script>
    <text>
      &JavascriptReportInit;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtVeWZvF3ZbQCsYnlgTz1idhuXYlL0uG3x5Yq0tTNm+FYLiaEKOwDjN4C/5P/1BviTW6mLCFfXHrtZ3guX22PqoH4npWSjsYiurtodAbWLaLPWwaAFojOZMPbbaKHZ6Po3ymG7uU7+e8NXWsPCTFv/0HKK7angL1etn8OJTE20plGQ/OuK2CH+7lMlM1AKtOhM3pMuhowb4oG4EGZRfAUlT+BLNUjVQHJkUzBoPsFRWkAv1OQaYg57UXjmBNxUl+R4NS1NHcUMvMS4THIIOod3bKNjuDjcYA7hU7mhZOLfetoNcDVvAIr7okZiFuD4jpjpwBiVNKke26YHqok/l9pyldUet2AKXNUWMrZggsGthhCapsIQ8ckQfOaPs9o4Mg+iEfA7+A1cmx4y6IcvBqFV4v11Gc9TL/u1w4QqyfDV+qVJUdWq2C7UCiIWrZC3RBzL5bIl0LpvdDm63MQ8H/ox1U=</Encrypted>]]>
    </text>
  </script>

  <toolbar>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="Print">
      <title v="Toolbar.Print" e="Toolbar.Print"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"></title>
    </button>
    <button command="Aggregate">
      <title v="Toolbar.Aggregate" e="Toolbar.Aggregate"></title>
    </button>
    <button command="Seprate">
      <title v="-" e="-"></title>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>