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
    <field name="periodFrom" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Từ kỳ" e="From Period"></header>
      <footer v="Từ kỳ/năm" e="From Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="yearFrom" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Từ năm" e="From Year"></header>
      <items style="Numeric"></items>
    </field>
    <field name="periodTo" allowNulls="false" type="Decimal" dataFormatString="#0">
      <header v="Đến kỳ" e="To Period"></header>
      <footer v="Đến kỳ/năm" e="To Period/Year"></footer>
      <items style="Numeric"></items>
    </field>
    <field name="yearTo" allowNulls="false" type="Decimal" dataFormatString="###0">
      <header v="Đến năm" e="To Year"></header>
      <items style="Numeric"></items>
    </field>

    <field name="ke_hoach" type="Boolean" clientDefault="1">
      <header v="So sánh với" e="Compare with"></header>
      <footer v="Kế hoạch" e="Plan"></footer>
      <items style="CheckBox"></items>
    </field>
    <field name="binh_quan" type="Boolean">
      <header v="" e=""></header>
      <footer v="Bình quân ngành" e="Branch Average"></footer>
      <items style="CheckBox"></items>
    </field>
    <field name="cty_khac" type="Boolean">
      <header v="" e=""></header>
      <footer v="Công ty khác" e="Other Entity"></footer>
      <items style="CheckBox"></items>
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
      <item value="111----: [periodFrom].Description, [periodFrom], [yearFrom]"/>
      <item value="111----: [periodTo].Description, [periodTo], [yearTo]"/>
      <item value="111000: [ke_hoach].Label, [ke_hoach], [ke_hoach].Description"/>
      <item value="111000: [binh_quan].Label, [binh_quan], [binh_quan].Description"/>
      <item value="111000: [cty_khac].Label, [cty_khac], [cty_khac].Description"/>
      <item value="110000-: [form].Label, [form]"/>
      <item value="110000-: [mau_bc].Label, [mau_bc]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2jQihU+ZF1gJYdNPaJrPsDCzDTbAYjxedDUkYV9a1omgMm+cPs69mQwYzgY3h4nm01Vlkt0i7ZN4aRatfJtsDQn3rKtCc97AlUK5bm5uQIgrIJPOaPIZ+z63f3sdcWm2XBiS2OMPrmO/HZtrlxXovNPoGupmuZmPE51NlEpMpKsAbRLGCfcTjqr4MZSMbO/kqt8PVSDByzHG9aXC1/xKzE=</Encrypted>]]>&defaultForm;<![CDATA[<Encrypted>&Yg5kCMHpRxVk0phZxDQR77vgMbfRI3e6BDGxfc5Ox9TJa7T4TsH/1P2o9YkLHpmcOiY5iE76Ty6x+rKi28LDzqfAa+89aJO608ZQZIYnZH6JPOLIJr75Ii71z7sZSd27uVwqIfcqTxdkJh5W27c+5VnxWD50aqtVX/Pv6MPJlptVGM6/IgfzAFrAjvmJA20WC6pmDEeh/j0i40IlAoUbCNlIIT72aMgv6Le8ewn+wysVcILc0V2oaIihBo+i+D9e</Encrypted>]]>
      </text>
    </command>

    &XMLWhenFilterLoading;
    &XMLWhenFilterClosing;
    <command event="Processing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAA2yLSlHLMIpNRbXv95PEzLcpXyvZZ1194114mb0OWgQ0/CXTCdg5qha27HtnahR2/jCbWtPJ0wy3RbPSf7SAoAMdtyNwFZ7z94voFGQ8pGeJT3rpB8iaWG06suLRPvmQ==</Encrypted>]]>&defaultTable;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ4mLNZehf14I2kiFHW9yD9AlSqlh2Ee8xpjy7xUmoU9gfWZZ1GV9z4Jcpkfx24JkBp0vmt8/gVFavOPkfob0sFMKABsFyGKE4MISu5qH0Z7MgOcDF6tc3BfnsPpXqbJzV84q4hRjVVo44pBx4YSDceQrNr4RymuUOxDh22EEU6AqWPO3oC9oIXqLHeyxl8/vGA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &JavascriptPivotFilter;
      &OutlineEntry;
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtQyWw6Bu7pN1Fgrd4RHwv9xRnrlhXuDgxTtGSli+OTTcAAGkRxZIu89b+M7/NN1NdM3UOpvSWZBBdKWouRu5rKyrIQTMT7Slu0ZC6B9TlF6yqMpJXaDvgMrIYdpITtoD555EYuzLZrQfj/N+SX3D5bJtqmow61HdLBeyip8rrHBJiXK2p7HGLytOyV4UP8QvTZ5Sh4yQhO3W14VkaueKUtlYpmHvoBx9HCtieDaXmtONID3k7TLwdRJZ8QYFtLYQaNxdiiKX39g1tDwKpU3u5/UnrSPC4vPleoEBvIAJgzjnXCaaEvxGS6D7qivNo0FtNbJUIteSBcnFL0lbjYZXwHTDuYclGRwLunJ82MiGcphDhfge4YIVlDL6nDK0OIl/on+bd60LLSf5fWuQGSv1a4b94Bh61dfPDKYDR4MrnT8AOjJaHOPbAbtBaQ47tG4xii218+L7ik8rSs+2Caxi89dc35kA3n2sZJQfH9GVwPRDUGobdew74fb7TaCC1UIaw183YBdclfSN0ttXq+GGY80Z2fZAIP9TxgRbGkiPsTn0Z2BYv2DGHKFJnJgRxlTtW86TYRLsOYNhHfE1KFx3/iuLo5rC5c0OCt1nqX3UYR+VE4hZCLwNvUcu19ruAddVhPG+IG6P6mXQGVwcYYZoQ0vZ3niCI8JzVYNwFI+VIsgapIYqtDxr7k5FM3kMwiYfEGiiUrcbX1OlRvka2W/aSwa3M7327a47+wJvEI289Q5IUdSjK8fMmQbQuCSvU0y1q9KFAJgE5hgpN8Lsq58J9xQHmrUR2I7OCrSdm5j60ffP8F2hjmrQkxEsH9trXLWII7emhGjtXWdzWVCUnj+AJC786lFcAsBJBUw7GSjbfRq/V7gaKjpFAxpflEULW5Ts97yz6wt8+OYU1aTZJuooXF91DKMa6fRrrf6nECMeqlHFUYj1hnG5rBcx9u1fGWqA1NxKBhjqqn/iVnIBCQKb2IX20By+yH1+7YGPRrvO3KlI9/XDyFFnAT7jkQrg0o4zUYdRUcpbms3FiQRUT0gzekkbpwsCpvPd7y8UpTHw3n4L</Encrypted>]]>
    </text>
  </script>

  &OutlineCss;
</dir>