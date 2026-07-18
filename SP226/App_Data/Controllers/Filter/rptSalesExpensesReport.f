<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">
  <!ENTITY ReportDataTypeField SYSTEM "..\Include\XML\ReportDataTypeField.xml">
  <!ENTITY ScriptQueryFilterString SYSTEM "..\Include\Javascript\QueryFilterString.txt">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">

  <!ENTITY defaultForm "COCP1">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"/>
  <fields>
    <field name="thang1" type="Decimal" dataFormatString="#0" allowNulls="false" clientDefault="1">
      <header v="Từ tháng" e="Month from"></header>
      <footer v="Từ đến/tháng" e="Month from/to"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="thang2" type="Decimal" dataFormatString="#0" allowNulls="false" clientDefault="12">
      <header v="Đến tháng" e="Month to"></header>
      <items style="Numeric"></items>
    </field>
    <field name="nam" type="Decimal" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="ma_dvcs">
      <header v="Đơn vị" e="Unit"></header>
      <items style="Lookup" controller="Unit" key="status = '1'" check="1=1"/>
    </field>
    <field name="form" allowNulls="false">
      <header v="Chọn báo cáo" e="Select Report"></header>
      <items style="DropDownList">
        <item value="">
          <text v="" e=""/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
    <field name="mau_bc">
      <header v="Mẫu báo cáo" e="Report Form"/>
      <items style="DropDownList">
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
        <item value="20">
          <text v="Mẫu ngoại tệ" e="FC Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>
  <views>
    <view id="Dir" height="210">
      <item value="120, 40, 40, 20, 100, 100, 130"/>
      <item value="111: [thang1].Description, [thang1], [thang2]"/>
      <item value="11: [nam].Label, [nam]"/>
      <item value="110000: [ma_dvcs].Label, [ma_dvcs]"/>
      <item value="110000: [form].Label, [form]"/>
      <item value="110000: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsDCzDTbAYjxedDUkYV9a1omgMm+cPs69mQwYzgY3h4nm01Vlkt0i7ZN4aRatfJtsDQn3rKtCc97AlUK5bm5uQIgRsqCwntXP0WJGnqD/KX1yf6jhaytSurzqZp3cYgi1qhMOR+RFr1RxqqMoDaJbXwmtryCQiXj0VNE6R7IHguYtAZj/MMQU6xtNpMs8dPekKp3JMGdTArcunRzLPCSJl6k</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77vgMbfRI3e6BDGxfc5Ox9TJa7T4TsH/1P2o9YkLHpmcOiY5iE76Ty6x+rKi28LDzqfAa+89aJO608ZQZIYnZH6JPOLIJr75Ii71z7sZSd27uVwqIfcqTxdkJh5W27c+5VnxWD50aqtVX/Pv6MPJlptVGM6/IgfzAFrAjvmJA20WC6pmDEeh/j0i40IlAoUbCNlIIT72aMgv6Le8ewn+wysVcILc0V2oaIihBo+i+D9e</Encrypted>]]>
      </text>
    </command>
    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;

    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPyvC2sapSczSOKYZ1bPdmXFGPKTZNWfvxBQ4+r7jX9mlCpIA4RkNo0nhPebHUPSO7WC3myBT9ZBvrju8/6Gsx3MLz7Gu/PyWn8jxXxF3cEQGHOK/aR4uVqwR2M0WWS0IyhrcHDFmeixqNM3qeSdIaxrlj+SOZ4J7d9pz/0JpN5l</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdORSYYxroiqGXItUaG5gxydvIMorAC6KkImAdpfPCIcUaG0xOv0B+TlH+OdNVwzhzmi7WXJlolvPsln1aGLnWHDtz2jCzVRWcG5MhLGNdjxfyuPd/BstrV7dDddUgUGCWQTLDDcvWg69Gt4/1d7Xnfu7gbNYsf8+1XmEeDRcJYuGk4AyJMjh9YjoYyRGsu+PptlT8QPlBRx8xzYzax3WICiPh70DDeSYu+ZX6/xhnw9+pNf7qlWwaKcpisQgbhMfSX53PsUJkkSY8BY79hjazYMln+zSG70rZ5GQyRzCzGr7HFhGkChVKfsKxnY66n1jg0RfmbDJ0PgdXhSY+p8xifHBxQL5Tk6Un8v2PRiy3uw5csI1wwTlVVIp/M/QXyAOGeoSBIocR2dKIS9hzFBHeGGt0atOnF5K6XJQmj4EgWaVl3iV6ODmZBw6F015qhQ07TNiNBvXpwD+EdjECt5x8m5+DNxhQAjWnb1hQAmW9mfKIopyKv6GmNIQskMG1ed7Q2iv9Bij4tTrevlijEObyVMulkEei4VFmuJf+YZwMozs9slLLuY/DhGt4cK4Qm1NHOpGbuyQ7CeVffZw5fFX5TSUVqHU10mWrbwIREaoC2pKoibu3J/nSK3jgSYhoMX45Q==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>