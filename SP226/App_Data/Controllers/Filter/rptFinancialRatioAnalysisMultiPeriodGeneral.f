<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY XMLWhenFilterLoading SYSTEM "..\Include\XML\WhenFilterLoading.xml">
  <!ENTITY XMLWhenFilterClosing SYSTEM "..\Include\XML\WhenFilterClosing.xml">

  <!ENTITY OutlineCss SYSTEM "..\Include\Javascript\OutlineCss.txt">
  <!ENTITY OutlineEntry SYSTEM "..\Include\Javascript\OutlineEntry.txt">
  <!ENTITY OnSelectionOutline SYSTEM "..\Include\Javascript\OnSelectionOutline.txt">
  <!ENTITY JavascriptPivotFilter SYSTEM "..\Include\Javascript\PivotFilter.txt">

  <!ENTITY defaultTable "gltcpt01th">
  <!ENTITY defaultForm "gltcpt01th">
]>

<dir id="1" type="Report" cache="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Điều kiện lọc" e="Filter Condition"></title>
  <fields>
    <field name="loai_ky" dataFormatString="1, 2, 3, 4" clientDefault="Default" defaultValue="2" align="right">
      <header v="Kiểu báo cáo" e="Report Type"></header>
      <footer v="1 - Tháng, 2 - Quý, 3 - Nửa năm, 4 - Năm" e="1 - Month, 2 - Quarter, 3 - Half a year, 4 - Year"></footer>
      <items style="Mask"></items>
    </field>
    <field name="so_ky" type="Int16" dataFormatString="#0" clientDefault="Default" defaultValue="2" allowNulls="false">
      <header v="Số kỳ báo cáo" e="No. of Periods"></header>
      <items style="Numeric"></items>
    </field>
    <field name="periodFrom" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="yearFrom" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
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

    <field name="mau_bc" clientDefault="10">
      <header v="Mẫu báo cáo" e="Report Form"></header>
      <items style="DropDownList" >
        <item value="10">
          <text v="Mẫu chuẩn" e="Standard Form"/>
        </item>
      </items>
      <clientScript>&OnSelectionOutline;</clientScript>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 40, 30, 100, 100, 130"/>
      <item value="1110000: [loai_ky].Label, [loai_ky], [loai_ky].Description"/>
      <item value="11-----: [so_ky].Label, [so_ky]"/>
      <item value="111----: [periodFrom].Description, [periodFrom], [yearFrom]"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsDCzDTbAYjxedDUkYV9a1omgMm+cPs69mQwYzgY3h4nm01Vlkt0i7ZN4aRatfJtsDQn3rKtCc97AlUK5bm5uQIgk2YBlEPgZ80abpeUfVOl5JfRqXsW23jsovsZzz2w100Mq3bSCCVaw9Hkzd0dLDFiffhkC3kpm3YmuaKOCHKYtyvumsbZCFzpcc710Toyt98=</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77vgMbfRI3e6BDGxfc5Ox9TJa7T4TsH/1P2o9YkLHpmcOiY5iE76Ty6x+rKi28LDzqfAa+89aJO608ZQZIYnZH6JPOLIJr75Ii71z7sZSd27uVwqIfcqTxdkJh5W27c+5VnxWD50aqtVX/Pv6MPJlptVGM6/IgfzAFrAjvmJA20WC6pmDEeh/j0i40IlAoUbCNlIIT72aMgv6Le8ewn+wysVcILc0V2oaIihBo+i+D9e</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAinW8zZxXCDY8N+40iMgRKMGgcPGf2Qfh3vpmQumhd/7dmIXCDpSLnAFgtsb80UktgvOTn1UZ4nniQuSC6YtLgezgRZk/bSBM2XeKASWA0OvQ2M251Ba606aLokSbdtmyM1/NAChve3Tj8rsoP5tgNcgwmm9frYYjjhGRyUvyM6O4Zx0ZooJxqOqbaBjxWCA8Wc+2l/9pLkqaoR3atqdeOJJsWZltf0gfyOh/OkB3Bs7a1YmYG15ttrvwqCB3ZzvfYcY2zXcBctvBq4u7F/lerHQ39+QJlqgEZftCmYyy0O</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ4mLNZehf14I2kiFHW9yD9AlSqlh2Ee8xpjy7xUmoU9gT8SofNM6LuJ/1yW/3P4td0MteN3BT/LE6mXV34dHPmc8hajvS5jLLVW16qhfFOU4Q9MyB7hD7+Yu1MYlNPNf9B11R9uO7MPNj4/HKBTjph+dFph+FMyyklqU28Ri1K32</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKyrIQTMT7Slu0ZC6B9TlF6yqMpJXaDvgMrIYdpITtoD555EYuzLZrQfj/N+SX3D5bLrzBnBmf98JtiHIidl/XKOr46CVEJLi6emH2ifc54j0O4m6Eu7Au/esDROOrJJeIl/iBzxJib9Pfqgb6n9UOxkSYv5mRfkITT1UyBuHIO/JZw+nDg4tbOpnQTxob5DOyIOQh+oBDF5NKFUp+RkztED1mYIP1raKGdkVrS6ZFEjxj7brjBEuLZJ+1exfguZ3S+ooXI1eB6GlJgF6odabQKEnsQULLAwTIw9P2DBYTO2VlTkN6jftlAgv+5rzzgDCX+6QekcOkhji9VvKpaF2dHd9YTFCM2ImsuEDcP/8ljBng3WKK0u/iKjTqIhFXRmwl5LfqzOm+5QqhGA2lXsr3YLnkSoyzK5UFKgbVNrDV8mfms28LbMSktEFdHkiOPFdjLCy/65KQUQ8+lrEqsX0M6xkYHnlZTPUPNpSlVA95QaFUvaORiUtlgZ+v5j0/4bd5Sjlb4xXu9PLR13JNEDB0Ba0NrimE4aBOHPb/IRvCXgEPjr9q9c4SCh47orgE/5mA0a5t6EMbW749epoXfxR9g/GV2fCXWwbUwJPuvilusZMKtj9cwoPC4q2kGwtJplwbku2TfrqihVu4wEp6m11FgjdR1DFXq6yww4UaQZgFuByGvNvYtO3oAiTI9w1uX1b7rdugFWnth/38Bz2p72hxoxe5D754UpIgaIvrmbpIvhjxwmA9I3sgulSv86lrBvyNAwyR/BaohvIJYM81vM58Vhuxs3dOw7rqqWKgEq0I74Gpez8B6vT0yPAAwQs0GbQJChiPcC6YP07HjLJBJ6WE5ZLeFHkAKmKw6h5l/aa+eZwQ==</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>